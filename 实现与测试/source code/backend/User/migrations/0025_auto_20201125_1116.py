# Generated by Django 3.1.3 on 2020-11-25 03:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('User', '0024_auto_20201124_1856'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='profile',
            field=models.CharField(default='./static/imgs/default.png', max_length=512),
        ),
        migrations.AlterField(
            model_name='user',
            name='nickname',
            field=models.CharField(default='轻记用户_k6igqrzXNUwE', max_length=64),
        ),
    ]
