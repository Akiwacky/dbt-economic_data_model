with raw_dates as (
    select * from {{ source('economic_data', 'dates') }}
)

select
    year as date_id,
    date, 
    month, 
    quarter, 
    year
from raw_dates