import mysql from 'mysql2';
import dotenv from 'dotenv';

dotenv.config();

const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
}).promise();

export async function sortPlayersByLastName() {
    const [rows] = await pool.query(`SELECT * 
    FROM lineupbuilder.player_named_stats
    ORDER BY lastname`)
    return rows
}

export async function sortPlayersByDESCLastName() {
    const [rows] = await pool.query(`SELECT * 
    FROM lineupbuilder.player_named_stats
    ORDER BY lastname DESC`)
    return rows
}

/*
// stat_type parameter: 'goals', 'assists', 'tackles', or 'saves'
export async function sortPlayersByStat(stat_type) {
    const [rows] = await pool.query(`SELECT *
    FROM lineupbuilder.player_named_stats
    ORDER BY ?`, [stat_type])
    return rows
}

// stat_type parameter: 'goals', 'assists', 'tackles', or 'saves'
export async function sortPlayersByDESCStat(stat_type) {
    const [rows] = await pool.query(`SELECT *
    FROM lineupbuilder.player_named_stats
    ORDER BY ? DESC`, [stat_type])
    return rows
}
*/

export async function sortPlayersByRating() {
    const [rows] = await pool.query(`SELECT * 
    FROM lineupbuilder.players
    ORDER BY rating`)
    return rows
}

export async function sortPlayersByDESCRating() {
    const [rows] = await pool.query(`SELECT * 
    FROM lineupbuilder.players
    ORDER BY rating DESC`)
    return rows
}

// position_id parameter: int from 0-3
export async function sortPlayersByPosition(position_id) {
    const [rows] = await pool.query(`SELECT *
    FROM lineupbuilder.player_named_stats
    WHERE position = ?`, [position_id])
    return rows
}

export async function sortTeamsByName() {
    const [rows] = await pool.query(`SELECT * 
    FROM lineupbuilder.team_stats
    ORDER BY \`Team Name\``)
    return rows
}

export async function sortTeamsByDESCName() {
    const [rows] = await pool.query(`SELECT * 
    FROM lineupbuilder.team_stats
    ORDER BY \`Team Name\` DESC`)
    return rows
}

/*
// stat_type parameter: 'Total Goals', 'Total Assists', 'Total Tackles', or 'Total Saves'
export async function sortTeamsByStat(stat_type) {
    const [rows] = await pool.query(`SELECT *
    FROM lineupbuilder.team_stats
    ORDER BY ?`, [stat_type])
    return rows
}
*/

export async function sortTeamsByRating() {
    const [rows] = await pool.query(`SELECT * 
    FROM lineupbuilder.team_ratings
    ORDER BY \`Team Rating\``)
    return rows
}

export async function sortTeamsByDESCRating() {
    const [rows] = await pool.query(`SELECT * 
    FROM lineupbuilder.team_ratings
    ORDER BY \`Team Rating\` DESC`)
    return rows
}
