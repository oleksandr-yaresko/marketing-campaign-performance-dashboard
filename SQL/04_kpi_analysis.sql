/*
===================================================
KPI ANALYSIS
===================================================

Purpose:
Calculate key marketing performance indicators.

KPIs:
- Overall CTR
- Engagement Rate
- Average Campaign Duration
- CTR by Channel
===================================================
*/

-- KPI 1: Overall CTR

SELECT
    ROUND(
        SUM(clicks)::numeric /
        SUM(impressions) * 100,
        2
    ) AS ctr_percentage
FROM marketing_campaigns_clean;


-- KPI 2: Engagement Rate

SELECT
    ROUND(
        SUM(engagement_score)::numeric /
        SUM(impressions) * 100,
        2
    ) AS engagement_rate
FROM marketing_campaigns_clean;


-- KPI 3: Average Campaign Duration

SELECT
    ROUND(
        AVG(duration_days),
        2
    ) AS avg_campaign_duration
FROM marketing_campaigns_clean;


-- KPI 4: CTR by Channel

SELECT
    channel_used,

    ROUND(
        SUM(clicks)::numeric /
        SUM(impressions) * 100,
        2
    ) AS ctr_percentage

FROM marketing_campaigns_clean

GROUP BY channel_used

ORDER BY ctr_percentage DESC;
