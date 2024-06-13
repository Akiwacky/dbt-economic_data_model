with stg_fct_economic_indicators as (
    SELECT 
        country_code AS nk_country_id,
        indicator_code as nk_indicator_id,
        year as dt_year,
        indicator_value as mtr_indicator_value
    FROM {{ ref('stg_economic_indicators') }}
)
SELECT 
    coalesce(d_country.sk_country, '-1') as sk_country,
    coalesce(d_indicator.sk_indicator, '-1') as sk_indicator,
    fct.dt_year as sk_year,
    fct.mtr_indicator_value
FROM 
    stg_fct_economic_indicators as fct
LEFT JOIN {{ ref('dim_countries') }} as d_country
ON fct.nk_country_id = d_country.nk_country_id
LEFT JOIN  {{ ref('dim_indicators') }} as d_indicator
ON fct.nk_indicator_id = d_indicator.nk_indicator_id