-- 3-Points attempts per game, Field Goals attempts per game and 3-Points attempts rate
SELECT season,
       ROUND(SUM(x3pa) * 1.0 / SUM(g), 3) AS threes_per_game,
       ROUND(SUM(fga) * 1.0 / SUM(g), 3) AS fg_attempts_per_game,
       ROUND(SUM(x3pa) * 1.0 / SUM(fga), 3) AS threes_usage
FROM team_totals
GROUP BY season
ORDER BY season;

-- League's efficiency per season in 3-points shooting
SELECT season,
       SUM(x3p) AS total_3pm,
       SUM(x3pa) AS total_3pa,
       ROUND(SUM(x3p)*1.0 / SUM(x3pa),3) AS three_pct
FROM team_totals
GROUP BY season
ORDER BY season;

-- Difference between 3-point rate per team vs league's 3-point rate per season.
-- Difference between 3-point efficiency per team vs league's 3-point efficiency per season.
WITH league_avg AS (
    SELECT season,
           SUM(x3pa)*1.0 / SUM(fga) AS league_three_usage
    FROM team_totals
    GROUP BY season
),
	league_efficiency AS (
	SELECT season,
		   SUM(x3p)*1.0 / SUM(x3pa) AS league_three_efficiency
	FROM team_totals
	GROUP BY season
)

SELECT tt.season,
	   tt.team,
       ROUND(tt.x3pa*1.0/tt.fga,3) AS team_3_usage,
       ROUND(la.league_three_usage,3) AS league_3_usage,
       ROUND((tt.x3pa*1.0/tt.fga) - la.league_three_usage,3) AS difference_att,
	   ROUND(tt.x3p*1.0/tt.x3pa,3) AS team_3_efficiency,
	   ROUND(le.league_three_efficiency,3) AS league_3_efficiency,
	   ROUND((tt.x3p*1.0/tt.x3pa) - le.league_three_efficiency,3) AS difference_eff
FROM team_totals tt
	JOIN league_avg la
		ON tt.season = la.season
	JOIN league_efficiency le
		ON tt.season = le.season
ORDER BY difference_att DESC,
		difference_eff DESC
;

--Number of players per season shooting more than 3, 5 or 8 3-points per game.
SELECT season,
    COUNT(CASE WHEN x3pa/g > 3 THEN player END) AS players_3plus,
    COUNT(CASE WHEN x3pa/g > 5 THEN player END) AS players_5plus,
    COUNT(CASE WHEN x3pa/g > 8 THEN player END) AS players_8plus
FROM player_totals
GROUP BY season
ORDER BY season;

-- Number of players per season shooting more than 3, 5 or 8 3-points and which percentage from the total players occupied. 
SELECT season,
    COUNT(player) AS total_players,
    COUNT(CASE WHEN x3pa/g > 3 THEN player END) AS players_3plus,
    ROUND(COUNT(CASE WHEN x3pa/g > 3 THEN player END) * 100.0 / COUNT(player), 1) AS pct_3plus,
    COUNT(CASE WHEN x3pa/g > 5 THEN player END) AS players_5plus,
    ROUND(COUNT(CASE WHEN x3pa/g > 5 THEN player END) * 100.0 / COUNT(player), 1) AS pct_5plus,
    COUNT(CASE WHEN x3pa/g > 8 THEN player END) AS players_8plus,
    ROUND(COUNT(CASE WHEN x3pa/g > 8 THEN player END) * 100.0 / COUNT(player), 1) AS pct_8plus
FROM player_totals
GROUP BY season
ORDER BY season;

-- Top 100 3-point shooters indicating his status as active or retired.
SELECT  player,
        MIN(season) AS first_season,
        MAX(season) AS last_season,
        COUNT(DISTINCT season) AS seasons_played,
        SUM(x3p) AS total_3p,
        CASE 
            WHEN MAX(season) = (SELECT MAX(season) FROM player_totals)
            THEN 'Active'
            ELSE 'Retired'
        END AS player_status
FROM player_totals
GROUP BY player
HAVING COUNT(DISTINCT season) > 10
ORDER BY total_3p DESC
LIMIT 100;

-- Evolution of the 3-point rate per position.
SELECT  season,
        pos,
        ROUND(SUM(x3pa)*1.0 / SUM(fga),3) AS three_rate
FROM player_totals
GROUP BY season, pos
ORDER BY season, pos;

-- Power Forwards rate shooting 3's 
SELECT  season,
        COUNT(CASE WHEN x3pa*1.0/g >= 1 THEN player END) AS PF_shooters,
        COUNT(player) AS total_PF,
        ROUND(COUNT(CASE WHEN x3pa*1.0/g >= 1 THEN player END) * 1.0 / COUNT(player), 3) AS PF_shooters_rate
FROM player_totals
WHERE pos = 'PF' AND 
	  mp > 500
GROUP BY season
ORDER BY season;

-- Centers rate shooting 3's 
SELECT  season,
        COUNT(CASE WHEN x3pa*1.0/g >= 1 THEN player END) AS centers_shooters,
        COUNT(player) AS total_centers,
        ROUND(COUNT(CASE WHEN x3pa*1.0/g >= 1 THEN player END) * 1.0 / COUNT(player), 3) AS center_shooters_rate
FROM player_totals
WHERE pos = 'C' AND 
	  mp > 500
GROUP BY season
ORDER BY season;
