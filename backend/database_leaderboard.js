import mysql from 'mysql2';
import dotenv from 'dotenv';

dotenv.config();

const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
}).promise();

export async function sortPlayersByAlphabeticalOrder() {}

export async function sortPlayersByDescAlphabeticalOrder() {}

export async function sortPlayersByStat(stat_type) {}

export async function sortPlayersByDescStat(stat_type) {}

export async function showPlayersByPosition(positon_id) {}