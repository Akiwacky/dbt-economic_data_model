SELECT
    fct.sk_indicator,
    fct.mtr_indicator_value,
    dim.dsc_indicator_name
FROM
    {{ ref('fct_economic_indicators') }} AS fct
JOIN
    {{ ref('dim_indicators') }} AS dim
ON
    fct.sk_indicator = dim.sk_indicator
WHERE
    dim.dsc_indicator_name = 'GDP (current US$)'
    AND fct.mtr_indicator_value < 0
