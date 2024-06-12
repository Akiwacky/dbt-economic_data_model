with raw_economic_indicators as (
    select * from {{ source('economic_data', 'economic_indicators') }}
)

select 
    country_code, 
    indicator_code, 
    year, 
    cast(indicator_value as FLOAT64) as indicator_value
from raw_economic_indicators
where indicator_value is not null 
