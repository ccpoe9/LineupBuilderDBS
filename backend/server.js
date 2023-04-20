import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import * as dbRead from './database_reads.js';
import * as dbWrite from './database_writes.js';
import * as dbSort from './database_sorts.js';

dotenv.config();

const app = express();
app.use(express.json());

app.use(cors({
    origin: '*'
}));

/* 
    DB READS
*/

// Get a json struct of all player data
app.get("/players", async (req, res) => {
    const players = await dbRead.getAllPlayers()
    res.send(players)
})

// Get a json struct of all player data
app.get("/players/stats", async (req, res) => {
    const players = await dbRead.getAllPlayersWithStats(req.query.orderBy, req.query.orderDir)
    res.send(players)
})

// Get a json struct of a single player's data
app.get("/players/:id", async (req, res) => {
    const id = req.params.id
    const player = await dbRead.getPlayer(id)
    res.send(player)
})

// Get a json struct of all coach data
app.get("/coaches", async (req, res) => {
    const coaches = await dbRead.getAllCoaches()
    res.send(coaches)
})

// Get a json struct of a single coaches' data
app.get("/coaches/:id", async (req, res) => {
    const id = req.params.id
    const coach = await dbRead.getCoach(id)
    res.send(coach)
})

// Get a json struct of all team data
app.get("/teams", async (req, res) => {
    const teams = await dbRead.getAllTeams()
    res.send(teams)
})

// Get a json struct of all team data
app.get("/teams/stats", async (req, res) => {
    const teams = await dbRead.getAllTeamsWithStats(req.query.orderBy, req.query.orderDir)
    res.send(teams)
})

// Get a json struct of a single team's data
app.get("/teams/:id", async (req, res) => {
    const id = req.params.id
    const team = await dbRead.getTeam(id)
    res.send(team)
})

// Get a json struct of a single team's roster
app.get("/teams/:id/players", async (req, res) => {
    const id = req.params.id
    const team = await dbRead.getPlayersOfTeam(id)
    res.send(team)
})

// Get a json struct of a single team's rating
app.get("/teams/:id/rating", async (req, res) => {
    const id = req.params.id
    const team = await dbRead.getTeamRating(id)
    res.send(team)
})

// Get a json struct of a single team's stats
app.get("/teams/:id/stats", async (req, res) => {
    const id = req.params.id
    const team = await dbRead.getTeamStats(id)
    res.send(team)
})

// Get a json struct of all formation data
app.get("/formations", async (req, res) => {
    const formations = await dbRead.getAllFormations()
    res.send(formations)
})

// Get a json struct of a single formation's data
app.get("/formations/:id", async (req, res) => {
    const id = req.params.id
    const formation = await dbRead.getFormation(id)
    res.send(formation)
})

// Get a json struct of all formation data
app.get("/leagues", async (req, res) => {
    const leagues = await dbRead.getAllLeagues()
    res.send(leagues)
})

// Get a json struct of a single formation's data
app.get("/leagues/:id", async (req, res) => {
    const id = req.params.id
    const league = await dbRead.getLeague(id)
    res.send(league)
})

// Get a json struct of a single player's stats
app.get("/players/:id/stats/full", async (req, res) => {
    const id = req.params.id
    const player_stats = await dbRead.getFullPlayerStats(id)
    res.send(player_stats)
})

// Get a json struct of a single player's goal count
app.get("/players/:id/stats/goals", async (req, res) => {
    const id = req.params.id
    const player_goals = await dbRead.getPlayerGoals(id)
    res.send(player_goals)
})

// Get a json struct of a single player's assist count
app.get("/players/:id/stats/assists", async (req, res) => {
    const id = req.params.id
    const player_assists = await dbRead.getPlayerAssists(id)
    res.send(player_assists)
})

// Get a json struct of a single player's tackle count
app.get("/players/:id/stats/tackles", async (req, res) => {
    const id = req.params.id
    const player_tackles = await dbRead.getPlayerTackles(id)
    res.send(player_tackles)
})

// Get a json struct of a single player's save count
app.get("/players/:id/stats/saves", async (req, res) => {
    const id = req.params.id
    const player_saves = await dbRead.getPlayerSaves(id)
    res.send(player_saves)
})

/* 
    DB WRITES
*/

// Create a new team in the teams table
// Will return a json struct of the new team
app.post("/teams", async (req, res) => {
    const { teamName, formation, league } = req.body
    const team = await dbWrite.createNewTeam(teamName, formation, league)
    res.status(201).send(team)
})

// Create a new coach in the coaches table
// Will return a json struct of the new coach
app.post("/coaches", async (req, res) => {
    const { firstName, lastName, team } = req.body
    const coach = await dbWrite.createNewCoach(firstName, lastName, team)
    res.status(201).send(coach)
})

/* 
    DB SORTS
*/

// Get a json struct of all players sorted by last name
app.get("/players/sort/bylastname", async (req, res) => {
    const players_sorted = await dbSort.sortPlayersByLastName()
    res.send(players_sorted)
})

// Get a json struct of all players sorted by last name in desc order
app.get("/players/sort/bylastname/desc", async (req, res) => {
    const players_sorted = await dbSort.sortPlayersByDESCLastName()
    res.send(players_sorted)
})

/*
// Get a json struct of all players sorted by desired stat
// stat_type parameter: 'goals', 'assists', 'tackles', or 'saves'
app.get("/players/sort/bystat", async (req, res) => {
    const { stat_type } = req.body
    const players_sorted = await dbSort.sortPlayersByStat(stat_type)
    res.send(players_sorted)
})

// Get a json struct of all players sorted by desired stat
// stat_type parameter: 'goals', 'assists', 'tackles', or 'saves'
app.get("/players/sort/bystat/desc", async (req, res) => {
    const { stat_type } = req.body
    const players_sorted = await dbSort.sortPlayersByDESCStat(stat_type)
    res.send(players_sorted)
})
*/

// Get a json struct of all players sorted by last name
app.get("/players/sort/byrating", async (req, res) => {
    const { order } = req.body
    const players_sorted = await dbSort.sortPlayersByRating(order)
    res.send(players_sorted)
})

// Get a json struct of all players sorted by last name in desc order
app.get("/players/sort/byrating/desc", async (req, res) => {
    const players_sorted = await dbSort.sortPlayersByDESCRating()
    res.send(players_sorted)
})

// Get a json struct of all players sorted by desired position
// position_id parameter: int from 0-3
app.get("/players/sort/byposition", async (req, res) => {
    const position_id = req.query.position_id;
    const players_sorted = await dbSort.sortPlayersByPosition(position_id)
    res.send(players_sorted)
})

// Get a json struct of all teams sorted by name
app.get("/teams/sort/byname", async (req, res) => {
    const teams_sorted = await dbSort.sortTeamsByName()
    res.send(teams_sorted)
})

// Get a json struct of all teams sorted by name in desc order
app.get("/teams/sort/byname/desc", async (req, res) => {
    const teams_sorted = await dbSort.sortTeamsByDESCName()
    res.send(teams_sorted)
})

/*
// Get a json struct of all teams sorted by desired stat
// stat_type parameter: 'Total Goals', 'Total Assists', 'Total Tackles', or 'Total Saves'
app.get("/teams/sort/bystat", async (req, res) => {
    const { stat_type} = req.body
    console.log(stat_type)
    const teams_sorted = await dbSort.sortTeamsByStat(stat_type)
    res.send(teams_sorted)
})
*/

// Get a json struct of all teams sorted by rating
app.get("/teams/sort/byrating", async (req, res) => {
    const teams_sorted = await dbSort.sortTeamsByRating()
    res.send(teams_sorted)
})

// Get a json struct of all teams sorted by rating in desc order
app.get("/teams/sort/byrating/desc", async (req, res) => {
    const teams_sorted = await dbSort.sortTeamsByDESCRating()
    res.send(teams_sorted)
})

// Basic error handling
app.use((err, req, res, next) => {
    console.error(err.stack)
    res.status(500).send('Something went wrong...')
})

// Listen loop
const port = process.env.PORT || 3000
app.listen(port, ()=> console.log(`Listening on port ${port}...`));