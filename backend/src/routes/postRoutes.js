import express from "express";
import pool from "../config/database.js";

const router = express.Router();

router.get("/", async (req, res) => {

    try {

        const result = await pool.query(`
            SELECT id, title, description, author, created_at 
            FROM posts 
            ORDER BY created_at DESC, id DESC
        `);
        
        res.status(200).json({
            posts: result.rows
        });

    } catch (error) {

        console.error("Erro ao consultar o banco de dados:", error);

        res.status(500).json({
            error: "Não possível buscar os posts."
        });
    }
});

router.get("/:id", async (req, res) => {

    try {

        const { id } = req.params;

        const result = pool.query(`
            SELECT id, title, description, author, created_at
            FROM posts
            WHERE id = $1
        `, [id]);

        res.status(200).json({
            post: result.rows[0]
        });
        
    } catch (error) {

        console.error("Erro ao consultar o banco de dados:", error);

        res.status(500).json({
            error: "Não possível buscar os post."
        });
    }
});

export default router;