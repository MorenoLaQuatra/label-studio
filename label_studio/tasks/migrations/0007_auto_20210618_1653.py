# Generated by Django 3.1.12 on 2021-06-18 16:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0006_remove_annotation_state'),
    ]

    operations = [
        migrations.AlterField(
            model_name='annotation',
            name='ground_truth',
            field=models.BooleanField(db_index=True, default=False, help_text='This annotation is a Ground Truth (ground_truth)', verbose_name='ground_truth'),
        ),
        migrations.AlterField(
            model_name='annotation',
            name='was_cancelled',
            field=models.BooleanField(db_index=True, default=False, help_text='User skipped the task', verbose_name='was cancelled'),
        ),
    ]