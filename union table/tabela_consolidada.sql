-- Consolida Google + Facebook
WITH cte_ads AS (
  SELECT 
    CAST(campaign_id AS NVARCHAR) AS campaign_id,
    campaign_name,
    date,
    source,
    medium,
    SUM(cost) AS cost,
    SUM(clicks) AS clicks,
    SUM(impressions) AS impressions,
    SUM(conversions) AS conversions,
    SUM(conversions_value) AS conversion_value
  FROM (
    SELECT 
      campaign_id,
      campaign_name,
      date,
      source,
      medium,
      CAST(cost AS decimal(18,6)) AS cost,
      clicks,
      impressions,
      conversions,
      conversions_value
    FROM google_ads
    
    UNION ALL
    
    SELECT 
      campaign_id,
      campaign_name,
      date,
      source,
      medium,
      CAST(cost AS DECIMAL(18,6)) AS cost,
      clicks,
      impressions,
      conversions,
      conversions_value
    FROM facebook_ads
  ) AS all_ads
  WHERE LOWER(source) IN ('facebook', 'google') AND LOWER(medium) = 'cpc'
  GROUP BY date, source, medium, campaign_id, campaign_name
),
cte_ga AS (
  SELECT 
    date,
    source,
    medium,
    CAST(campaign_id AS nvarchar) AS campaign_id,
    SUM(sessions_ga) AS sessions_ga,
    SUM(add_to_cart_ga) AS add_to_cart_ga,
    SUM(conversions_ga) AS conversions_ga,
    SUM(receita_ga) AS receita_ga
  FROM google_analytics
  WHERE LOWER(source) IN ('facebook', 'google') AND LOWER(medium) = 'cpc'
  GROUP BY date, source, medium, campaign_id
)
SELECT
  COALESCE(a.date, g.date) AS date,
  COALESCE(a.source, g.source) AS source,
  COALESCE(a.medium, g.medium) AS medium,
  COALESCE(a.campaign_name, '') AS campaign_name,
  
  -- Métricas Ads
  a.cost,
  a.clicks,
  a.impressions,
  a.conversions,
  a.conversion_value,
  
  -- Métricas GA
  g.sessions_ga,
  g.add_to_cart_ga,
  g.conversions_ga,
  g.receita_ga

FROM cte_ads a
FULL OUTER JOIN cte_ga g
  ON a.date = g.date
  AND a.source = g.source
  AND a.medium = g.medium
  AND a.campaign_id = g.campaign_id
WHERE COALESCE(a.campaign_name, '') != '';
