with raw_countries as (
    select * from {{ source('economic_data', 'countries') }}
),
country_metadata as (
    SELECT * FROM {{ ref ('country_metadata') }}
)

select 
    src.country_code as country_id,
    src.country_name,
    meta.region,
    meta.income_group
from raw_countries src
left join 
    country_metadata meta 
on src.country_code = meta.country_code