from django.shortcuts import render_to_response
from django.template import RequestContext
from django.http import HttpResponseRedirect,JsonResponse
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.views.generic import View, TemplateView
from django.core.urlresolvers import reverse
from django.contrib.admin.models import *

class HomeView(TemplateView):

    def get(self, request, *args, **kwargs):
        template_name = "index.html"
        response = render_to_response(template_name, {}, RequestContext(request))
        return response
        # response = HttpResponseRedirect('/admin')
        # return response

class UserActivityView(View):

    def get(self, request, *args, **kwargs):
        user_id = request.GET.get('user_id', False)
        start_date = request.GET.get('start_date', False)
        end_date = request.GET.get('end_date', False)
        message = []
        if user_id and not User.objects.filter(id=user_id).exists():
            return_json = {'status': 'Error', 'message': 'User does not exist.'}
            return JsonResponse(return_json, safe=False)
        log_entry = LogEntry.objects.all()
        if user_id:
            log_entry = log_entry.filter(user_id=user_id)
        if start_date:
            start_date = str(start_date)+' 00:00'
            log_entry = log_entry.filter(action_time__gte=str(start_date))
        if end_date:
            end_date = str(end_date)+' 23:59'
            log_entry = log_entry.filter(action_time__lte=str(end_date))
        for log in log_entry:
            if log.action_flag == 1 :
                action = 'ADDITION'
            elif log.action_flag == 2:
                action = 'CHANGE'
            else:
                action = 'DELETION'
            temp = {
            'action_time':log.action_time,
            'object':log.object_repr,
            'action':action,
            'content':log.content_type.model,
            'change_message':log.change_message,
            'username':log.user.username
            }
            message.append(temp)
        return_json = {'status': 'success','message': message }
        return JsonResponse(return_json, safe=False)