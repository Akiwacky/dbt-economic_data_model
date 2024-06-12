with stg_dim_countries AS (
    SELECT DISTINCT 
        country_id as nk_country_id,
        country_name as dsc_country_name,
        'Region' as dsc_region,
        'Income_Group' as dsc_income_group 
    FROM {{ ref('stg_countries') }}
)
SELECT 
    {{ dbt_utils.generate_surrogate_key(['nk_country_id']) }} as sk_country,
    *
from stg_dim_countries