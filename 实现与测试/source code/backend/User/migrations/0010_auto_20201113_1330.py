# Generated by Django 3.1.3 on 2020-11-13 13:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('User', '0009_auto_20201113_1326'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='nickname',
            field=models.CharField(default='轻记用户_8JdMtY1sSPum', max_length=64),
        ),
    ]
