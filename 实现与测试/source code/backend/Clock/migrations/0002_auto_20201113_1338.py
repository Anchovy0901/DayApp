# Generated by Django 3.1.3 on 2020-11-13 13:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clock', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='clockinitem',
            name='_id',
            field=models.CharField(default='1605274733GkJErhi80SNn', max_length=128, unique=True),
        ),
    ]
