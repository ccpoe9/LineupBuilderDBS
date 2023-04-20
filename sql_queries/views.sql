# team_ratings view
USE lineupbuilder;

CREATE VIEW `team_ratings` AS
    SELECT 
        `teams`.`teamid` AS `teamid`,
        `teams`.`name` AS `name`,
        `teams`.`league` AS `league`,
        AVG(`players`.`rating`) AS `Team Rating`
    FROM
        (`teams`
        JOIN `players` ON ((`teams`.`teamid` = `players`.`team`)))
    GROUP BY `teams`.`teamid` , `teams`.`name` , `teams`.`league`
    ORDER BY 'Team Rating' DESC;
    
# team_stats view
    
CREATE VIEW `team_stats` AS
    SELECT 
        `p`.`team` AS `teamid`,
        `t`.`name` AS `Team Name`,
        SUM(`p_s`.`goals`) AS `Total Goals`,
        SUM(`p_s`.`assists`) AS `Total Assists`,
        SUM(`p_s`.`tackles`) AS `Total Tackles`,
        SUM(`p_s`.`saves`) AS `Total Saves`
    FROM
        ((`player_stats` `p_s`
        JOIN `players` `p` ON ((`p_s`.`player_id` = `p`.`player_id`)))
        JOIN `teams` `t` ON ((`p`.`team` = `t`.`teamid`)))
    GROUP BY `p`.`team` , `t`.`name`
    ORDER BY `t`.`name` ASC;
    
# player_named_stats view
    
CREATE VIEW `player_named_stats` AS
    SELECT 
        `p`.`firstname` AS `firstname`,
        `p`.`lastname` AS `lastname`,
        `p`.`position` AS `position`,
        `p`.`rating` AS `rating`,
        `p_s`.`player_id` AS `player_id`,
        `p_s`.`goals` AS `goals`,
        `p_s`.`assists` AS `assists`,
        `p_s`.`saves` AS `saves`,
        `p_s`.`tackles` AS `tackles`
    FROM
        (`players` `p`
        JOIN `player_stats` `p_s` ON ((`p`.`player_id` = `p_s`.`player_id`)))
    ORDER BY `p`.`firstname` , `p`.`lastname`;


DELIMITER //
CREATE PROCEDURE GetPlayerWithStats(
	IN orderBy VARCHAR(20),
    IN orderDir VARCHAR(20)
    )
BEGIN
	SELECT 
        `p`.`firstname` AS `firstname`,
        `p`.`lastname` AS `lastname`,
        `p`.`position` AS `position`,
        `p`.`rating` AS `rating`,
        `p_s`.`player_id` AS `player_id`,
        `p_s`.`goals` AS `goals`,
        `p_s`.`assists` AS `assists`,
        `p_s`.`saves` AS `saves`,
        `p_s`.`tackles` AS `tackles`
    FROM
        `players` `p`
        JOIN `player_stats` `p_s` ON `p`.`player_id` = `p_s`.`player_id`
    ORDER BY 
		(CASE WHEN orderBy = 'lastname' AND orderDir='ASC' THEN lastname END) ASC,
        (CASE WHEN orderBy = 'lastname' AND orderDir='DESC' THEN lastname END) DESC,
        (CASE WHEN orderBy = 'rating' AND orderDir='ASC' THEN rating END) ASC,
        (CASE WHEN orderBy = 'rating' AND orderDir='DESC' THEN rating END) DESC,
        (CASE WHEN orderBy = 'goals' AND orderDir='ASC' THEN goals END) ASC,
        (CASE WHEN orderBy = 'goals' AND orderDir='DESC' THEN goals END) DESC,
        (CASE WHEN orderBy = 'assists' AND orderDir='ASC' THEN assists END) ASC,
        (CASE WHEN orderBy = 'assists' AND orderDir='DESC' THEN assists END) DESC,
        (CASE WHEN orderBy = 'tackles' AND orderDir='ASC' THEN tackles END) ASC,
        (CASE WHEN orderBy = 'tackles' AND orderDir='DESC' THEN tackles END) DESC,
        (CASE WHEN orderBy = 'saves' AND orderDir='ASC' THEN saves END) ASC,
        (CASE WHEN orderBy = 'saves' AND orderDir='DESC' THEN saves END) DESC;
END; //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetTeamsWithStats()
BEGIN
	SELECT 
        `p`.`team` AS `teamid`,
        `t`.`name` AS `TeamName`,
        SUM(`p_s`.`goals`) AS `TotalGoals`,
        SUM(`p_s`.`assists`) AS `TotalAssists`,
        SUM(`p_s`.`tackles`) AS `TotalTackles`,
        SUM(`p_s`.`saves`) AS `TotalSaves`
    FROM
        ((`player_stats` `p_s`
        JOIN `players` `p` ON ((`p_s`.`player_id` = `p`.`player_id`)))
        JOIN `teams` `t` ON ((`p`.`team` = `t`.`teamid`)))
    GROUP BY `p`.`team` , `t`.`name`
    ORDER BY `t`.`name` ASC;
END; //

DELIMITER ;