from __future__ import unicode_literals
from django.utils.translation import gettext as _


from django.db import models

# Create your models here.
class Size(models.Model):
	size = models.CharField(_("Size"), max_length=10)

	def __unicode__(self):
		return self.size

class Color(models.Model):
	color = models.CharField(_("Color"), max_length=255)

	def __unicode__(self):
		return self.color

class Properties(models.Model):
	name = models.CharField(_("Properties"), max_length=255)

	def __unicode__(self):
		return self.name

class Category(models.Model):
	"""
	Basic hierarchical category model for storing products
	"""
	name = models.CharField(_("Name"), max_length=200)
	parent = models.ForeignKey('self', blank=True, null=True,
		related_name='child')
	description = models.TextField(_("Description"), blank=True,
		help_text="Optional")
	is_active = models.BooleanField(_("Active"), default=True, blank=True)
	related_categories = models.ManyToManyField('self', blank=True, null=True,
		verbose_name=_('Related Categories'), related_name='related_categories')

	def __unicode__(self):
		return self.name

	class Meta:
		ordering = ['parent__name', 'name']
		verbose_name = _("Category")
		verbose_name_plural = _("Categories")
		unique_together = ('name',)
        


class Brand(models.Model):
	name = models.CharField(_("Name"), max_length=200)
	contact = models.CharField(_("Contact Person"), max_length=400,blank=True, null=True)
	is_active = models.BooleanField(_("Active"), default=True, blank=True)
	address = models.CharField(_("Contact Address"), max_length=2000,blank=True, null=True)

	def __unicode__(self):
		return self.name

class Product(models.Model):
	name = models.CharField(_("Full Name"), max_length=255, blank=False,
		help_text=_("This is what the product will be called in the default site language.  To add non-default translations, use the Product Translation section below."))
	slug = models.SlugField(_("Slug Name"), blank=True,
		help_text=_("Used for URLs, auto-generated from name if blank"), max_length=255)
	sku_code = models.CharField(_("SKU CODE"), max_length=255, blank=True, null=True,
		help_text=_("Defaults to slug if left blank"))
	description = models.TextField(_("Description of product"), help_text=_("This field can contain HTML and should be a few paragraphs in the default site language explaining the background of the product, and anything that would help the potential customer make their purchase."), default='', blank=True)
	guide = models.TextField(_("Usage guide for Product"), help_text=_("This field can contain HTML and should be a few paragraphs in the default site language explaining the background of the product, and anything that would help the potential customer make their purchase."), default='', blank=True)
	category = models.ManyToManyField(Category, blank=True, verbose_name=_("Category"), related_name='category')
	brand = models.ForeignKey(Brand, default=True,blank=True, verbose_name=_("Brand"), related_name='brand')
	more_sizes = models.ManyToManyField(Size, blank=True, null=True, verbose_name=_('More Sizes'), related_name='more_sizes')
	more_colors = models.ManyToManyField(Color, blank=True, null=True, verbose_name=_('More Colors'), related_name='more_colors')
	properties = models.ManyToManyField(Properties, blank=True, null=True, verbose_name=_('Properties'), related_name='properties')
	paytmsyas = models.CharField(_("paytm's thought on product"), default='', blank=True, max_length=2000)
	date_added = models.DateField(_("Date added"), null=True, blank=True)
	active = models.BooleanField(_("Active"), default=False, help_text=_("This will determine whether or not this product will appear on the site"))
	newarrivals = models.BooleanField(_('New Arrivals'), default=0)
	freesize = models.BooleanField(_('Free Size'), default=False)
	nonreturnable=models.BooleanField(_('NonReturnable'), default=False)
	cost_price = models.DecimalField(_("Cost Price"), max_digits=14, decimal_places=6,blank=True, null=True ) 
	sell_price = models.DecimalField(_("Selling Price"), max_digits=14, decimal_places=6,blank=True, null=True )
	discount_price = models.DecimalField(_("Discount Price"), max_digits=14, decimal_places=6,blank=True, null=True )
	quantity = models.IntegerField(_("Quantity"),default=0)