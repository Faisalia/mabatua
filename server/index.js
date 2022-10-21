import express from "express";
import mongoose from "mongoose";
import mahasiswaRouter from "./routes/Mahasiswa.js";
import makananRouter from "./routes/Makanan.js";
import restoranRouter from "./routes/Restoran.js";

mongoose.connect(
  "mongodb+srv://mongodbnew:counter@cluster0.j5wi9.mongodb.net/saveKost?retryWrites=true&w=majority",
  { useNewUrlParser: true, useUnifiedTopology: true }
);

const app = express();

app.get("/", (req, res) => {
  res.send("HALO");
});

app.use("/api/mahasiswa", mahasiswaRouter);
app.use("/api/makanan", makananRouter);
app.use("/api/restoran", restoranRouter);

const port = process.env.PORT || 5000;
app.listen(port, () => {
  console.log("Listening " + port);
});
