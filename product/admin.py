from django.contrib import admin
from django.utils.translation import gettext as _

# Register your models here.
from .models import Product, Category, Brand, Size, Color, Properties

class BrandAdmin(admin.ModelAdmin):
	list_filter = ('is_active',)
	list_display = ('name','contact','address','is_active')

class CategoryAdmin(admin.ModelAdmin):
	list_filter = ('is_active',)
	list_display = ('name','parent','related','description','is_active')
	filter_horizontal = ('related_categories',)

	def related(self,obj):
		return ",".join([p.name for p in obj.related_categories.all()])


class ProductAdmin(admin.ModelAdmin):
	list_display = ('name','slug','sku_code','brand','cost_price','sell_price','discount_price','quantity','active')
	list_filter = ('category','brand','active')
	filter_horizontal = ('category','more_sizes','more_colors','properties')
	fieldsets = (
	(_('General'), {'fields': ('name','slug','sku_code','category','brand','active'), 'classes': ('collapse',)}),
	(_('Labels'), {'fields': ('newarrivals','freesize','nonreturnable'), 'classes': ('collapse',)}),
	(_('Details'), {'fields': ('description','guide', 'paytmsyas'), 'classes': ('collapse',)}),
	(_('Variation'), {'fields': ('cost_price','sell_price','discount_price','quantity','more_sizes','more_colors', 'properties'), 'classes': ('collapse',)}),)

admin.site.register(Brand, BrandAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(Size)
admin.site.register(Color)
admin.site.register(Properties)