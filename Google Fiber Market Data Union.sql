CREATE TABLE google_fiber_market_data AS
(SELECT * FROM market_1
UNION ALL
SELECT * FROM market_2
UNION ALL
SELECT * FROM market_3);

SELECT * FROM google_fiber_market_data;