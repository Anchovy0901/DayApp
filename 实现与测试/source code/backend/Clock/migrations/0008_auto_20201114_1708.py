# Generated by Django 3.1.3 on 2020-11-14 09:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clock', '0007_auto_20201114_0411'),
    ]

    operations = [
        migrations.AddField(
            model_name='clockrecord',
            name='detail',
            field=models.CharField(default='打卡成功！', max_length=256),
        ),
        migrations.AlterField(
            model_name='clockinitem',
            name='_id',
            field=models.CharField(default='160534491075ibtDc4rHXo', max_length=128, unique=True),
        ),
    ]
