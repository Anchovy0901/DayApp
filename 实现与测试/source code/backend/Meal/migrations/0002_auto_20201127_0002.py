# Generated by Django 3.1.3 on 2020-11-26 16:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Meal', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usermeal',
            name='breakfast',
            field=models.CharField(default='./static/meal/non.png', max_length=1024, null=True),
        ),
        migrations.AlterField(
            model_name='usermeal',
            name='dinner',
            field=models.CharField(default='./static/meal/non.png', max_length=1024, null=True),
        ),
        migrations.AlterField(
            model_name='usermeal',
            name='lunch',
            field=models.CharField(default='./static/meal/non.png', max_length=1024, null=True),
        ),
    ]
