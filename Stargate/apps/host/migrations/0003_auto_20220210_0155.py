# Generated by Django 2.2.16 on 2022-02-10 01:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('host', '0002_auto_20220206_2000'),
    ]

    operations = [
        migrations.AlterField(
            model_name='hostcategory',
            name='name',
            field=models.CharField(max_length=32, unique=True, verbose_name='主机类别'),
        ),
    ]
