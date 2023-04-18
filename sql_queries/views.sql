# team_ratings view

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
        SUM(`p_s`.`saves`) AS `Total Saves`,
        SUM(`p_s`.`tackles`) AS `Total Tackles`
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
        `p_s`.`player_id` AS `player_id`,
        `p_s`.`goals` AS `goals`,
        `p_s`.`assists` AS `assists`,
        `p_s`.`saves` AS `saves`,
        `p_s`.`tackles` AS `tackles`
    FROM
        (`players` `p`
        JOIN `player_stats` `p_s` ON ((`p`.`player_id` = `p_s`.`player_id`)))
    ORDER BY `p`.`firstname` , `p`.`lastname`
