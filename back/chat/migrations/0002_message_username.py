# Generated by Django 4.0 on 2024-12-03 12:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='message',
            name='username',
            field=models.CharField(default='Default', max_length=150),
            preserve_default=False,
        ),
    ]