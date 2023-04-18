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

export async function sortPlayersByRating() {}

export async function sortPlayersByDescRating() {}

export async function sortPlayersBySaveCount() {}

export async function sortPlayersByDescSaveCount() {}

export async function sortPlayersByTackleCount() {}

export async function sortPlayersByDescTackleCount() {}

export async function sortPlayersByAssistCount() {}

export async function sortPlayersByDescAssistCount() {}

export async function sortPlayersByGoalCount() {}

export async function sortPlayersByDescGoalCount() {}

export async function showPlayersByPosition(positon_id) {}