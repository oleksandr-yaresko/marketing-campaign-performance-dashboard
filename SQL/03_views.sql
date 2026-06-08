/*
===================================================
VIEWS FOR POWER BI DASHBOARD
===================================================

Purpose:
Create aggregated views for dashboard reporting.

Views:
- Channel Performance
- Customer Segment Performance
- Location Performance
- CTR Performance
- Monthly Performance
- Campaign Type Performance
===================================================
*/
CREATE OR REPLACE VIEW vw_channel_performance AS
SELECT
    channel_used,
    COUNT(*) AS campaign_count,
    ROUND(AVG(roi),2) AS avg_roi,
    ROUND(AVG(conversion_rate),4) AS avg_conversion_rate
FROM marketing_campaigns_clean
GROUP BY channel_used;
CREATE OR REPLACE VIEW vw_customer_segment_performance AS
SELECT
    customer_segment,
    COUNT(*) AS campaign_count,
    ROUND(AVG(roi),2) AS avg_roi,
    ROUND(AVG(conversion_rate),4) AS avg_conversion_rate
FROM marketing_campaigns_clean
GROUP BY customer_segment;
CREATE OR REPLACE VIEW vw_location_performance AS
SELECT
    location,
    COUNT(*) AS campaign_count,
    ROUND(AVG(roi),2) AS avg_roi,
    ROUND(AVG(conversion_rate),4) AS avg_conversion_rate
FROM marketing_campaigns_clean
GROUP BY location;
CREATE OR REPLACE VIEW vw_channel_ctr AS
SELECT
    channel_used,
    ROUND(
        SUM(clicks)::numeric /
        SUM(impressions) * 100,
        2
    ) AS ctr_percentage
FROM marketing_campaigns_clean
GROUP BY channel_used;
CREATE OR REPLACE VIEW vw_monthly_performance AS
SELECT
    DATE_TRUNC('month', campaign_date) AS month,
    ROUND(AVG(conversion_rate) * 100, 2) AS avg_conversion_rate,
    ROUND(AVG(roi), 2) AS avg_roi
FROM marketing_campaigns_clean
GROUP BY 1
ORDER BY 1;
CREATE OR REPLACE VIEW vw_campaign_type_performance AS
SELECT
    campaign_type,

    COUNT(*) AS campaign_count,

    ROUND(AVG(roi), 2) AS avg_roi,

    ROUND(
        AVG(conversion_rate) * 100,
        2
    ) AS avg_conversion_rate,

    ROUND(
        SUM(clicks)::numeric /
        SUM(impressions) * 100,
        2
    ) AS ctr_percentage,

    ROUND(
        AVG(
            REPLACE(
                REPLACE(acquisition_cost, '$', ''),
                ',',
                ''
            )::numeric
        ),
        2
    ) AS avg_acquisition_cost

FROM marketing_campaigns_clean

GROUP BY campaign_type;
