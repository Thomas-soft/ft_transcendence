# Generated by Django 4.0 on 2024-12-06 13:12

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Message',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=150)),
                ('message', models.CharField(max_length=999)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
        ),
    ]
