{% snapshot dimcustomers %}
    {{
      config(
        target_schema='public',
        unique_key='customer_id',
        strategy='timestamp',
        updated_at='updated_at'
      )
    }}

    SELECT
      customer_id,
      name,
      city,
      updated_at
    FROM demo_dag.raw_customers

{% endsnapshot %}