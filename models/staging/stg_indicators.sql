with raw_indicators as (
    select * from {{ source('economic_data', 'indicators') }}
)

select  
    indicator_code as indicator_id,
    indicator_name
from raw_indicators