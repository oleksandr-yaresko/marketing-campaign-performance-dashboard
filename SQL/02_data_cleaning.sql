CREATE TABLE marketing_campaigns_clean AS
SELECT
    "Campaign_ID" AS campaign_id,
    "Company" AS company,
    "Campaign_Type" AS campaign_type,
    "Target_Audience" AS target_audience,
    REPLACE("Duration",' days','')::INTEGER AS duration_days,
    "Channel_Used" AS channel_used,
    "Conversion_Rate" AS conversion_rate,
    "Acquisition_Cost" AS acquisition_cost,
    "ROI" AS roi,
    "Location" AS location,
    "Language" AS language,
    "Clicks" AS clicks,
    "Impressions" AS impressions,
    "Engagement_Score" AS engagement_score,
    "Customer_Segment" AS customer_segment,
    TO_DATE("Date",'YYYY-MM-DD') AS campaign_date
FROM marketing_campaigns_raw;
