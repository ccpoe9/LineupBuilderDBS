import mysql from 'mysql2';
import dotenv from 'dotenv';
import * as dbRead from './database_reads.js';

dotenv.config();

const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
}).promise();

export async function createNewTeam(teamName, formation, league) {
    const [result] = await pool.query(`
    INSERT INTO teams (name, formation, league)
    VALUES (?, ?, ?)
    `, [teamName, formation, league])
    const id = result.insertId
    return dbRead.getTeam(id)
}

export async function createNewCoach(firstName, lastName, team) {
    const [result] = await pool.query(`
    INSERT INTO coaches (firstname, lastname, team)
    VALUES (?, ?, ?)
    `, [firstName, lastName, team])
    const id = result.insertId
    return dbRead.getCoach(id)
}

export async function updatePlayerTeam(player_id, team) {
    await pool.query(`
    UPDATE players
    SET team = ?
    WHERE player_id = ?
    `, [team, player_id])
    return dbRead.getPlayer(player_id)
}

export async function updateCoachTeam(coachid, team) {
    await pool.query(`
    UPDATE coaches
    SET team = ?
    WHERE coachid = ?
    `, [team, coachid])
    return dbRead.getCoach(coachid)
}