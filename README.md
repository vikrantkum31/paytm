# paytm
paytm sample project for inventory backend system.
For running this project please follow below steps

Install below depencies:
------------------------
1.sudo apt-get install mysql-server

2.sudo apt-get install libmysqlclient-dev

3.sudo apt-get install python-dev

4.pip install mysql-python

5.pip install Django==1.9.2

6.pip install django-admin-tools

7.pip install django-logentry-admin

Sample Database setup and running
---------------------------------
1.Download paytm_sample_db.sql file from repo

2.Create Database in mysql
>>> create database paytm

3.Restore paytm_sample_db.sql
>>> use paytm;

>>> source <path-for-db-file>/paytm_sample_db.sql

Django setup and running
------------------------
1.open django settings.py file which is inside paytm directory

2.configure database in django settings.py

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'paytm',
        'USER': 'root',
        'PASSWORD': 'admin',
        'HOST': '127.0.0.1',   # Or an IP Address that your DB is hosted on
        'PORT': '3306',
    }
}

if your mysql password is not admin please replace admin with your password
if your db name is not paytm please replace paytm with your db name

3.Now go to paytm directory where manage.py available and run below command

python manage.py runserver

4.Open http://127.0.0.1:8000 in browser

5. Sample Login Details


   username : paytm123
   
   
   password : paytm123456
   
   username : paytm456
   
   
   password : paytm123456

6.For user activity api open below link in broser


http://127.0.0.1:8000/user_activity?start_date=2018-12-25&end_date=2018-12-26&user_id=1


