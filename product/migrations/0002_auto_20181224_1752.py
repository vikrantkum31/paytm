# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2018-12-24 17:52
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Brand',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200, verbose_name='Name')),
                ('contact', models.CharField(blank=True, max_length=400, null=True, verbose_name='Contact Person')),
                ('is_active', models.BooleanField(default=True, verbose_name='Active')),
                ('address', models.CharField(blank=True, max_length=2000, null=True, verbose_name='Contact Address')),
            ],
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200, verbose_name='Name')),
                ('description', models.TextField(blank=True, help_text='Optional', verbose_name='Description')),
                ('is_active', models.BooleanField(default=True, verbose_name='Active')),
                ('parent', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='child', to='product.Category')),
                ('related_categories', models.ManyToManyField(blank=True, null=True, related_name='_category_related_categories_+', to='product.Category', verbose_name='Related Categories')),
            ],
        ),
        migrations.RemoveField(
            model_name='product',
            name='deactivate_reason',
        ),
        migrations.RemoveField(
            model_name='product',
            name='short_description',
        ),
        migrations.RemoveField(
            model_name='product',
            name='sku',
        ),
        migrations.AddField(
            model_name='product',
            name='sku_code',
            field=models.CharField(blank=True, help_text='Defaults to slug if left blank', max_length=255, null=True, verbose_name='SKU CODE'),
        ),
        migrations.AddField(
            model_name='product',
            name='brand',
            field=models.ManyToManyField(blank=True, related_name='brand', to='product.Brand', verbose_name='Brand'),
        ),
        migrations.AddField(
            model_name='product',
            name='category',
            field=models.ManyToManyField(blank=True, related_name='category', to='product.Category', verbose_name='Category'),
        ),
    ]
