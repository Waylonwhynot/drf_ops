# Generated by Django 2.2.16 on 2022-02-06 20:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('host', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='host',
            name='is_show',
            field=models.BooleanField(default=True, verbose_name='是否显示'),
        ),
        migrations.AlterField(
            model_name='hostcategory',
            name='is_show',
            field=models.BooleanField(default=True, verbose_name='是否显示'),
        ),
        migrations.AlterField(
            model_name='pkeymodel',
            name='is_show',
            field=models.BooleanField(default=True, verbose_name='是否显示'),
        ),
    ]
