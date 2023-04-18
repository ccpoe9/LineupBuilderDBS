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