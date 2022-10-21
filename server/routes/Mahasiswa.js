import express from "express";
import multer from "multer";
import { mahasiswaModel } from "../model/Mahasiswa.js";

const upload = multer();

const dummyData = [
  {
    namaDepan: "Renny",
    namaBelakang: "Atikasari",
    loc: "123",
  },
  {
    namaDepan: "Faisal",
    namaBelakang: "Ibrahim",
    loc: "123",
  },
  {
    namaDepan: "Antonius",
    namaBelakang: "Anre",
    loc: "123",
  },
  {
    namaDepan: "Bobby",
    namaBelakang: "Williams",
    loc: "123",
  },
  {
    namaDepan: "Kreshna",
    namaBelakang: "Bayu",
    loc: "123",
  },
];

const router = express.Router();

router.get("/", async (req, res) => {
  try {
    const result = await mahasiswaModel.find();
    res.send(result);
  } catch (error) {
    res.send(error);
  }
});

router.get("/:id", async (req, res) => {
  try {
    const result = await mahasiswaModel.findById(req.params.id);
    res.send(result);
  } catch (error) {
    res.send(error);
  }
});

router.post("/", upload.single(), async (req, res) => {
  try {
    const newMahasiswa = new mahasiswaModel(req.body);
    const result = await newMahasiswa.save();
    res.send(result);
  } catch (error) {
    res.send(error);
  }
});

router.post("/fill", async (req, res) => {
  try {
    dummyData.map(async (data) => {
      const newMahasiswa = new mahasiswaModel(data);
      await newMahasiswa.save();
    });
    const result = "ok";
    res.send(result);
  } catch (error) {
    res.send(error);
  }
});

export default router;
