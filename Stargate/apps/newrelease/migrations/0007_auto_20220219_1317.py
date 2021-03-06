# Generated by Django 2.2.16 on 2022-02-19 13:17

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
        ('newrelease', '0006_auto_20220219_0316'),
    ]

    operations = [
        migrations.AddField(
            model_name='releaseapply',
            name='release_user',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='release_apply_release_user', to='user.UserProfile', verbose_name='发布人'),
        ),
        migrations.AddField(
            model_name='releaseapply',
            name='review_desc',
            field=models.CharField(blank=True, max_length=128, null=True, verbose_name='审核意见'),
        ),
        migrations.AddField(
            model_name='releaseapply',
            name='review_user',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='release_apply_review_user', to='user.UserProfile', verbose_name='审核人'),
        ),
    ]
