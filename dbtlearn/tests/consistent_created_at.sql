select * from
{{ ref('fct_reviews') }} reviews
join {{ ref('dim_listings_cleansed') }} listings 
on reviews.listing_id = listings.listing_id
where reviews.review_date < listings.created_at