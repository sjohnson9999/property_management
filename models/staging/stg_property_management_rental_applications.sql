select 
    id,
    created_at,
    rent,
    property_id,
    name,
    bedrooms,
    bathrooms,
    square_feet,
    status,
    address_1,
    address_2,
    city,
    state,
    zip_code,
    uploaded_at
from {{ source('property_management', 'units') }}