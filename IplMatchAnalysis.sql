--1.Top Venues with the Highest Number of Matches along with their Cities

SELECT 
    venue, 
    city, 
    COUNT(*) AS total_matches
FROM 
    `ipl-analysis-439111.matches.analysis`
WHERE 
    venue IS NOT NULL AND city IS NOT NULL
GROUP BY 
    venue, city
ORDER BY 
    total_matches DESC
LIMIT 10;

--2. Venues with Highest Wins by Teams

SELECT 
    venue, 
    winner, 
    COUNT(*) AS total_wins
FROM 
    `ipl-analysis-439111.matches.analysis`
WHERE 
    winner IS NOT NULL AND venue IS NOT NULL
GROUP BY 
    venue, winner
ORDER BY 
    total_wins DESC
LIMIT 10;

--3. Team Performance Comparison

SELECT 
    team1, 
    team2, 
    COUNTIF(winner = team1) AS team1_wins, 
    COUNTIF(winner = team2) AS team2_wins,
FROM 
    `ipl-analysis-439111.matches.analysis`
GROUP BY 
    team1, team2
ORDER BY 
    team1_wins DESC, team2_wins DESC;


--4. Winning Margin by Matches (Runs or Wickets)

SELECT 
    CASE 
        WHEN LOWER(won_by) LIKE '%runs%' THEN 'Runs'
        WHEN LOWER(won_by) LIKE '%wickets%' THEN 'Wickets'
        ELSE 'Tie/NA'
    END AS win_type,
    COUNT(*) AS matches_won
FROM 
    `ipl-analysis-439111.matches.analysis`
WHERE 
    won_by IS NOT NULL
GROUP BY 
    win_type
ORDER BY 
    matches_won DESC;



--5. Eliminator Matches Winners

SELECT 
    winner, 
    COUNT(*) AS eliminator_wins
FROM 
    `ipl-analysis-439111.matches.analysis`
WHERE 
    eliminator = 'Y'
GROUP BY 
    winner
ORDER BY 
    eliminator_wins DESC;


--6. Top Players of the Match

SELECT 
    player_of_the_match, 
    COUNT(*) AS awards_count
FROM 
    `ipl-analysis-439111.matches.analysis`
WHERE 
    player_of_the_match IS NOT NULL
GROUP BY 
    player_of_the_match
ORDER BY 
    awards_count DESC
LIMIT 10;


--7. Toss Decision and Match Outcome

SELECT 
    toss_winner AS team,
    toss_decision, 
    COUNTIF(winner = toss_winner) AS wins_after_toss,
    COUNT(*) AS total_tosses_won,
    ROUND(COUNTIF(winner = toss_winner) / COUNT(*) * 100, 2) AS win_percentage
FROM 
    `ipl-analysis-439111.matches.analysis`
WHERE 
    toss_decision IS NOT NULL
GROUP BY 
    toss_winner, toss_decision
ORDER BY 
    win_percentage DESC, total_tosses_won DESC;


For this queries give description,problem statement(it should not be same as business questions),business questions,insights generated --1.Top Venues with the Highest Number of Matches along with their Cities

SELECT 
    venue, 
    city, 
    COUNT(*) AS total_matches           
FROM 
    `ipl-analysis-439111.matches.analysis`
WHERE 
    venue IS NOT NULL AND city IS NOT NULL
GROUP BY 
    venue, city
ORDER BY 
    total_matches DESC
LIMIT 10;

--2. Venues with Highest Wins by Teams

SELECT 
    venue, 
    winner, 
    COUNT(*) AS total_wins
FROM 
    `ipl-analysis-439111.matches.analysis`
WHERE 
    winner IS NOT NULL AND venue IS NOT NULL
GROUP BY 
    venue, winner
ORDER BY 
    total_wins DESC
LIMIT 10;

--3. Team Performance Comparison

SELECT 
    team1, 
    team2, 
    COUNTIF(winner = team1) AS team1_wins, 
    COUNTIF(winner = team2) AS team2_wins,
FROM 
    `ipl-analysis-439111.matches.analysis`
GROUP BY 
    team1, team2
ORDER BY 
    team1_wins DESC, team2_wins DESC;


--4. Winning Margin by Matches (Runs or Wickets)

SELECT 
    CASE 
        WHEN LOWER(won_by) LIKE '%runs%' THEN 'Runs'
        WHEN LOWER(won_by) LIKE '%wickets%' THEN 'Wickets'
        ELSE 'Tie/NA'
    END AS win_type,
    COUNT(*) AS matches_won
FROM 
    `ipl-analysis-439111.matches.analysis`
WHERE 
    won_by IS NOT NULL
GROUP BY 
    win_type
ORDER BY 
    matches_won DESC;



--5. Eliminator Matches Winners

SELECT 
    winner, 
    COUNT(*) AS eliminator_wins
FROM 
    `ipl-analysis-439111.matches.analysis`
WHERE 
    eliminator = 'Y'
GROUP BY 
    winner
ORDER BY 
    eliminator_wins DESC;



--6. Toss Decision and Match Outcome

SELECT 
    toss_winner AS team,
    toss_decision, 
    COUNTIF(winner = toss_winner) AS wins_after_toss,
    COUNT(*) AS total_tosses_won,
    ROUND(COUNTIF(winner = toss_winner) / COUNT(*) * 100, 2) AS win_percentage
FROM 
    `ipl-analysis-439111.matches.analysis`
WHERE 
    toss_decision IS NOT NULL
GROUP BY 
    toss_winner, toss_decision
ORDER BY 
    win_percentage DESC, total_tosses_won DESC;    


--7. Top Players of the Match

SELECT 
    player_of_the_match, 
    COUNT(*) AS awards_count
FROM 
    `ipl-analysis-439111.matches.analysis`
WHERE 
    player_of_the_match IS NOT NULL
GROUP BY 
    player_of_the_match
ORDER BY 
    awards_count DESC
LIMIT 10;   


