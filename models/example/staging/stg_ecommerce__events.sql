{{
	config(
		materialized='incremental',
		unique_key='event_id',
		on_schema_change='sync_all_columns',
		partition_by={
			"field": "created_at",
			"data_type": "timestamp",
			"granularity": "day"
		}
	)
}}

with source as (

    select * from {{ source('thelook_ecommerce', 'events') }}

),

renamed as (

    select
        id as event_id,
        user_id,
        sequence_number,
        session_id,
        created_at,
        ip_address,
        city,
        state,
        postal_code,
        browser,
        traffic_source,
        uri,
        event_type

    from source

)

select * from renamed


{% if is_incremental() %}

WHERE created_at > (SELECT MAX(created_at) FROM {{ this }})

{% endif %}