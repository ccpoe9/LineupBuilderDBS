
/*
# Get team ratings in desc order from `team_ratings` view - cand add LIMIT {N} at the end to only get top N teams

SELECT * FROM lineupbuilder.team_ratings
ORDER BY `Team Rating` DESC;
*/

/*
# Get team stats - can get top attackers/defenders by changing parameters

SELECT `Team Name`, `Total Goals` FROM lineupbuilder.team_stats
ORDER BY `Total Goals` DESC;
*/






