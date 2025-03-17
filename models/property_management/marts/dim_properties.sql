with properties as (
    select * from {{ ref('stg_property_management__properties') }}
),

units as (
    select * from {{ ref('stg_property_management__units') }}
),

final as (

    select
        properties.id as property_id,
        count(units.id) as unit_count,
        sum(units.rent) as property_income
    from properties left join units on properties.id = units.property_id
    group by properties.id
)

select * from final