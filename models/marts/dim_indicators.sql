with stg_dim_indicators AS (
    SELECT
        indicator_id AS nk_indicator_id,
        indicator_name AS dsc_indicator_name
    FROM {{ ref ('stg_indicators') }}
)
SELECT 
    {{ dbt_utils.generate_surrogate_key( ['nk_indicator_id'] )}} AS sk_indicator,
    *
FROM stg_dim_indicators