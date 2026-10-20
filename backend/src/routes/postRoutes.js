import express from "express";
import pool from "../config/database.js";

const router = express.Router();

router.get("/", async (req, res) => {

    try {

        const results = await pool.query(`
            SELECT id, title, description, author, created_at 
            FROM posts 
            ORDER BY created_at DESC, id DESC
        `);
        
        res.status(200).json({
            posts: results.rows
        });

    } catch (error) {

        console.error("Erro ao consultar o banco de dados:", error);

        res.status(500).json({
            error: "Não possível buscar os posts."
        });
    }

});

export default router;