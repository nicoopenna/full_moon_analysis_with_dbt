{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}

with src_reviews as (
    select * from 
    {{ ref("src_reviews") }}
)
select * 
from src_reviews
where 1=1 
and review_text is not null
{% if is_incremental() %}
and review_date > coalesce((select max(review_date) from {{ this }}), '1900-01-01')
{% endif %}
