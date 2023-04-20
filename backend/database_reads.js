import mysql from 'mysql2';
import dotenv from 'dotenv';

dotenv.config();

const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
}).promise();

export async function getAllPlayers() {
    const [rows] = await pool.query("SELECT * FROM players")
    return rows
}

export async function getAllPlayersWithStats(orderBy, orderDir) {
    const [rows] = await pool.query(`CALL GetPlayerWithStats('${orderBy}', '${orderDir}');`)
    return rows
}

export async function getPlayer(player_id) {
    const [rows] = await pool.query(`
    SELECT * 
    FROM players
    WHERE player_id = ?
    `, [player_id])
    return rows[0]
}

export async function getAllCoaches() {
    const [rows] = await pool.query("SELECT * FROM coaches")
    return rows
}

export async function getCoach(coachid) {
    const [rows] = await pool.query(`
    SELECT * 
    FROM coaches
    WHERE coachid = ?
    `, [coachid])
    return rows[0]
}

export async function getAllTeams() {
    const [rows] = await pool.query("SELECT * FROM teams")
    return rows
}

export async function getAllTeamsWithStats() {
    const [rows] = await pool.query("CALL GetTeamsWithStats();")
    return rows
}


export async function getTeam(teamid) {
    const [rows] = await pool.query(`
    SELECT * 
    FROM teams
    WHERE teamid = ?
    `, [teamid])
    return rows[0]
}

export async function getTeamRating(teamid) {
    const [rows] = await pool.query(`
    SELECT * 
    FROM lineupbuilder.team_ratings
    WHERE teamid = ?
    `, [teamid])
    return rows[0]
}

export async function getTeamStats(teamid) {
    const [rows] = await pool.query(`
    SELECT * 
    FROM lineupbuilder.team_stats
    WHERE teamid = ?
    `, [teamid])
    return rows[0]
}

export async function getPlayersOfTeam(teamid) {
    const [rows] = await pool.query(`
    SELECT *
    FROM players
    WHERE team = ?
    ORDER BY players.position
    `, [teamid])
    return rows
}

export async function getAllFormations() {
    const [rows] = await pool.query("SELECT * FROM formations")
    return rows
}

export async function getFormation(id) {
    const [rows] = await pool.query(`
    SELECT * 
    FROM formations
    WHERE id = ?
    `, [id])
    return rows[0]
}

export async function getAllLeagues() {
    const [rows] = await pool.query("SELECT * FROM leagues")
    return rows
}

export async function getLeague(league_id) {
    const [rows] = await pool.query(`
    SELECT * 
    FROM leagues
    WHERE league_id = ?
    `, [league_id])
    return rows[0]
}

export async function getFullPlayerStats(player_id) {
    const [rows] = await pool.query(`
    SELECT * 
    FROM player_stats
    WHERE player_id = ?
    `, [player_id])
    return rows[0]
}

export async function getPlayerGoals(player_id) {
    const [rows] = await pool.query(`
    SELECT goals 
    FROM player_stats
    WHERE player_id = ?
    `, [player_id])
    return rows[0]
}

export async function getPlayerAssists(player_id) {
    const [rows] = await pool.query(`
    SELECT assists 
    FROM player_stats
    WHERE player_id = ?
    `, [player_id])
    return rows[0]
}

export async function getPlayerTackles(player_id) {
    const [rows] = await pool.query(`
    SELECT tackles 
    FROM player_stats
    WHERE player_id = ?
    `, [player_id])
    return rows[0]
}

export async function getPlayerSaves(player_id) {
    const [rows] = await pool.query(`
    SELECT saves 
    FROM player_stats
    WHERE player_id = ?
    `, [player_id])
    return rows[0]
}