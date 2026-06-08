SELECT COUNT(*)
FROM marketing_campaigns_raw;

SELECT *
FROM marketing_campaigns_raw
LIMIT 5;

SELECT
    "Campaign_ID",
    COUNT(*)
FROM marketing_campaigns_raw
GROUP BY "Campaign_ID"
HAVING COUNT(*) > 1;

SELECT COUNT(*)
FROM marketing_campaigns_raw
WHERE "Campaign_ID" IS NULL;

SELECT COUNT(*)
FROM marketing_campaigns_raw
WHERE "Company" IS NULL;

SELECT COUNT(*)
FROM marketing_campaigns_raw
WHERE "Channel_Used" IS NULL;

SELECT COUNT(*)
FROM marketing_campaigns_raw
WHERE "ROI" IS NULL;

SELECT DISTINCT "Channel_Used"
FROM marketing_campaigns_raw
ORDER BY 1;

SELECT
    MIN("ROI") AS min_roi,
    MAX("ROI") AS max_roi
FROM marketing_campaigns_raw;
