import express from "express";
import "dotenv/config";
import healthRoutes from "./routes/healthRoutes.js";
import postRoutes from "./routes/postRoutes.js";

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.use("/health", healthRoutes);
app.use("/posts", postRoutes);

app.listen(PORT, () => {
    console.log(`Servidor inicializado em http://localhost:${PORT}`);
});