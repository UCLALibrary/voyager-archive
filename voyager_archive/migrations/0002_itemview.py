# Generated by Django 4.1 on 2022-09-20 21:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('voyager_archive', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='ItemView',
            fields=[
                ('item_id', models.DecimalField(decimal_places=0, max_digits=38, primary_key=True, serialize=False)),
                ('mfhd_id', models.DecimalField(decimal_places=0, max_digits=38)),
                ('item_enum', models.CharField(blank=True, max_length=80, null=True)),
                ('chron', models.CharField(blank=True, max_length=80, null=True)),
                ('year', models.CharField(blank=True, max_length=20, null=True)),
                ('caption', models.CharField(blank=True, max_length=256, null=True)),
                ('freetext', models.CharField(blank=True, max_length=256, null=True)),
                ('item_barcode', models.CharField(blank=True, max_length=30, null=True)),
                ('perm_location', models.CharField(blank=True, max_length=10, null=True)),
                ('temp_location', models.CharField(blank=True, max_length=10, null=True)),
                ('item_type', models.CharField(blank=True, max_length=25, null=True)),
                ('temp_item_type', models.CharField(blank=True, max_length=25, null=True)),
                ('copy_number', models.DecimalField(blank=True, decimal_places=0, max_digits=38, null=True)),
                ('on_reserve', models.CharField(blank=True, max_length=1, null=True)),
                ('reserve_charges', models.DecimalField(blank=True, decimal_places=0, max_digits=38, null=True)),
                ('pieces', models.DecimalField(blank=True, decimal_places=0, max_digits=38, null=True)),
                ('price', models.DecimalField(blank=True, decimal_places=0, max_digits=38, null=True)),
                ('historical_charges', models.DecimalField(blank=True, decimal_places=0, max_digits=38, null=True)),
                ('historical_browses', models.DecimalField(blank=True, decimal_places=0, max_digits=38, null=True)),
                ('recalls_placed', models.DecimalField(blank=True, decimal_places=0, max_digits=38, null=True)),
                ('holds_placed', models.DecimalField(blank=True, decimal_places=0, max_digits=38, null=True)),
                ('create_date', models.DateTimeField(blank=True, null=True)),
                ('create_operator_id', models.CharField(blank=True, max_length=10, null=True)),
                ('create_location', models.CharField(blank=True, max_length=10, null=True)),
                ('modify_date', models.DateTimeField(blank=True, null=True)),
                ('modify_operator_id', models.CharField(blank=True, max_length=10, null=True)),
                ('modify_location', models.CharField(blank=True, max_length=10, null=True)),
                ('item_sequence_number', models.DecimalField(blank=True, decimal_places=0, max_digits=38, null=True)),
            ],
            options={
                'db_table': 'item_view',
                'managed': False,
            },
        ),
    ]