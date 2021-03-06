# Generated by Django 2.2 on 2021-11-17 18:15

from django.db import migrations, models
import django.db.models.deletion
import jsonfield.fields


class Migration(migrations.Migration):

    dependencies = [
        ('cmdb', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Data',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('change_user', models.CharField(blank=True, default='admin', max_length=64, null=True, verbose_name='修改人')),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('uuid', models.UUIDField(unique=True, verbose_name='唯一识别ID')),
                ('status', models.PositiveSmallIntegerField(choices=[(0, '无状态'), (1, '空闲'), (2, '故障'), (3, '待回收'), (4, '正在使用')], default=0, verbose_name='状态')),
                ('data', jsonfield.fields.JSONField(verbose_name='数据')),
                ('info', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='cmdb.Info', verbose_name='对应的模型')),
            ],
            options={
                'verbose_name': '数据',
                'verbose_name_plural': '数据',
                'db_table': 'cmdb_resource_data',
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('change_user', models.CharField(blank=True, default='admin', max_length=64, null=True, verbose_name='修改人')),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('tag_name', models.CharField(max_length=50, verbose_name='标签名称')),
                ('tag_value', models.CharField(max_length=50, verbose_name='标签值')),
            ],
            options={
                'verbose_name': '标签管理',
                'verbose_name_plural': '标签管理',
                'db_table': 'cmdb_tags_tag',
                'ordering': ['id'],
                'unique_together': {('tag_name', 'tag_value')},
            },
        ),
        migrations.CreateModel(
            name='DataTagRelated',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('change_user', models.CharField(blank=True, default='admin', max_length=64, null=True, verbose_name='修改人')),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('data', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='tag_info', to='cmdb.Data', verbose_name='资源数据')),
                ('tag', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='data_info', to='cmdb.Tag', verbose_name='资源数据')),
            ],
            options={
                'verbose_name': '数据和标签关联关系',
                'verbose_name_plural': '数据和标签关联关系',
                'db_table': 'cmdb_tags_data_related',
                'unique_together': {('data', 'tag')},
            },
        ),
        migrations.CreateModel(
            name='DataRelated',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('change_user', models.CharField(blank=True, default='admin', max_length=64, null=True, verbose_name='修改人')),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('source', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='source_data', to='cmdb.Data', verbose_name='源数据')),
                ('source_info', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='source_info', to='cmdb.Info', verbose_name='目标模型')),
                ('target', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='target_data', to='cmdb.Data', verbose_name='目标数据')),
                ('target_info', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='target_info', to='cmdb.Info', verbose_name='目标模型')),
            ],
            options={
                'verbose_name': '数据关系',
                'verbose_name_plural': '数据关系',
                'db_table': 'cmdb_resource_data_related',
                'ordering': ['id'],
                'unique_together': {('source_info', 'target_info'), ('source', 'target')},
            },
        ),
    ]
