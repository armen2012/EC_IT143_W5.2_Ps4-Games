/*****************************************************************************************************************
NAME:    Ps4 Games Scripts
PURPOSE: EC_IT143_W5.2

MODIFICATION LOG:
Ver       Date          Author            Description
-----   ----------   -----------       -------------------------------------------------------------------------------
1.0     18/10/2023   Armen Hagobian    1. Built this script for EC_IT143_W5.2



NOTES: 
Answers to questions you and other students created about your My Communities data sets.
 
******************************************************************************************************************/
-- My Comunity: Ps4 Games
-- Q1: Stacey Singleton: I am interested in whether or not, gamers are happier playing a game when they are able to complete the whole game. 
-- A1: Good games are designed to address your instinctive needs and desires in order to produce fun. Depending on your 
-- personality, you might enjoy solving puzzles, collecting valuable items, exploring, and war games. Succedding in these 
-- activities gives you the sense of accomplishment, and it's easier to get in games than in real life. 

SELECT * From [Ps4 Games]
    -- Compute Pearson correlation
    (COUNT(*)*SUM(comp_per*rating) - SUM(comp_per)*SUM(rating)) / 
    (SQRT(COUNT(*)*SUM(comp_per*comp_per) - SUM(comp_per)*SUM(comp_per)) *
     SQRT(COUNT(*)*SUM(rating*rating) - SUM(rating)*SUM(rating))) AS PearsonCorrelation

/* ARMIN - Explanation
Completion Percentage (comp_per): How much of the game players typically complete.
Rating (rating): How much players like the game (or how "happy" they are with it).
The Pearson Correlation Coefficient is a measure that helps understand the strength and direction of the linear relationship between two variables. Its value ranges from -1 to 1:

A value close to 1 means there's a strong positive relationship: as one variable increases, the other also tends to increase.
A value close to -1 means there's a strong negative relationship: as one variable increases, the other tends to decrease.
A value close to 0 means there's little to no linear relationship between the variables.
In simpler terms for this context:

If the result is close to 1: Players who complete more of the game tend to give higher ratings, suggesting they are happier when they finish more of the game.
If the result is close to -1: Players who complete more of the game tend to give lower ratings, which would be quite unusual in this context.
If the result is close to 0: There's no clear trend showing that completing more of the game affects player ratings.
The query calculates this Pearson value for the entire dataset to see if, in general, gamers are happier when they complete more of a game.
*/

----------------------------------------------------------------
-- My Comunity: Ps4 Games - THIS MAKES NO SENSE WITH QUESTION AND ANSWER
-- Q2: Gamer: What is the average rating that players gave the games where 20% or less were able to complete the whole Game?
-- A2: The Gamer population is 54% Male and 46% female. Of those feamles, women 18 and older account for a greater portion of 
-- the population than males younger than 18. The average female video game player is 44 years old, while the average male 
-- video game player is 35. 

-- Q2 Query
SELECT AVG(rating) AS AvgRating
FROM [Ps4 Games]
WHERE comp_per <= 20;




--------------------------------------------------------------------
-- My Comunity: Ps4 Games
-- Q3: Team member: How can we find the hightest score for the gamers? 
-- A3: The Concept of video game high scores might seem evergreen, but the truth is that hardcore,
-- sleep-deprived gamers could only log their records. 

-- Q3 This table is summary of each game so highest score does not make sense because each game is has average score there. But if you consider all games we can do this

SELECT game, score AS HighestScore
FROM [Ps4 Games]
WHERE score = (SELECT MAX(score) FROM [Ps4 Games]);

--------------------------------------------------------------------------
-- My Comunity: Ps4 Games
-- Q4: Gamer: How can we identitfy the most played games with the gamers? 
-- A4: Shooter games ranked as the most-played gaming genre for virtually all age groups except for online users aged 45 to 54 and 55 to 64 years,
-- where it ranked second. Action adventure were the second-most popular game genre, ranking second across alomst all ages groups. 

SELECT game, gamers AS NumberOfGamers
FROM [Ps4 Games]
ORDER BY gamers DESC;


-----------------------------------------------------------------------------
-- My Comunity: Ps4 Games
-- Q5: Team Member: what is the highest rating in a game?
-- A5:  The Entertainment Software Rating Board (ESRB), the video game content rating board for North America, has issued an "Adults Only"
-- (AO) rating for 26 released video games. AO is the highest rating in the ESRB system, and indicates the game's content is suitable only for 
-- players aged 18 years and over. 

-- Again to get a highest rating in a game, you need a table with each game and how many times it played but this table has one game in each record so this query gives 
-- highest rating in any given day.
SELECT game, rating AS HighestRating
FROM [Ps4 Games]
WHERE rating = (SELECT MAX(rating) FROM [Ps4 Games]);




-------------------------------------------------------------------------------

