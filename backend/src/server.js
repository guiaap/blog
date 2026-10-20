import express from "express";
import "dotenv/config";
import healthRoutes from "./routes/healthRoutes.js";

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get("/", (req, res) => {
    res.send("Teste da API");
});

app.use("/health", healthRoutes);

app.listen(PORT, () => {
    console.log(`Servidor inicializado em http://localhost:${PORT}`);
});