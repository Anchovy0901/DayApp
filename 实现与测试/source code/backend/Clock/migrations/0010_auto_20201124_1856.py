# Generated by Django 3.1.3 on 2020-11-24 10:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clock', '0009_auto_20201124_1854'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='weekrecord',
            name='week_start',
        ),
        migrations.AlterField(
            model_name='clockinitem',
            name='_id',
            field=models.CharField(default='1606215407jrl86YPxyIu9', max_length=128, unique=True),
        ),
    ]
