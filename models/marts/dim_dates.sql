with stg_dim_dates AS (
    SELECT
        date_id AS nk_date_id,
        date AS dt_date,
        year AS dsc_year,
        quarter AS dsc_quarter,
        month AS dsc_month,
    FROM {{ ref('stg_dates') }}
)

SELECT 
    {{ dbt_utils.generate_surrogate_key(['nk_date_id']) }} AS sk_date,
    *
FROM stg_dim_dates