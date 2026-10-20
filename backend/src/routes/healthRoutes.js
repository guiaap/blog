import express from "express";
import pool from "../config/database.js";

const router = express.Router();

router.get("/db", async (req, res) => {

    try {

        const result = await pool.query("SELECT NOW()");

        res.status(200).json({
            message: "Conectado ao PostgreSQL",
            time: result.rows[0].now
        });
        
    } catch (error) {

        console.error("Erro de conexão com o banco de dados:", error);

        res.status(500).json({
            error: "Erro de conexão com o banco de dados."
        });
    }
});

export default router;

