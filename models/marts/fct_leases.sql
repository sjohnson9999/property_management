with leases as (

    select * from {{ ref('stg_property_management__leases') }}

),

units as (

    select * from {{ ref('stg_property_management__units') }}

),

applications as (

    select * from {{ ref('stg_property_management__rental_applications') }}

),

application_leases as (

    select * from applications left join leases on applications.id = leases.rental_application_id

),

final as (

    select * from application_leases left join units on units.id = application_leases.unit_id

)

select * from final