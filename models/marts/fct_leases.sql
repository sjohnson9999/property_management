with leases as (

    select * from {{ ref('stg_property_management__leases') }}

),

units as (

    select * from {{ ref('stg_property_management__units') }}

),

apps as (

    select * from {{ ref('stg_property_management__rental_applications') }}

),

final as (

    select
        leases.id as lease_id,
        units.id as unit_id,
        apps.contact_info_id as contact_info_id,
        leases.start_date as start_date,
        leases.end_date as end_date,
    from leases 
        left join units on units.id = leases.unit_id
        left join apps on apps.id = leases.rental_application_id

)

select * from final