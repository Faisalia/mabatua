import express from "express";
import multer from "multer";
import { restoranModel } from "../model/Restoran.js";

const upload = multer();

const dummyData = [
  {
    nama: "Alvin Jaya",
  },
  {
    nama: "Chick n Tea",
  },
  {
    nama: "Tedung",
  },
];

const router = express.Router();

router.get("/", async (req, res) => {
  try {
    const result = await restoranModel.find();
    res.send(result);
  } catch (error) {
    res.send(error);
  }
});

router.get("/:id", async (req, res) => {
  try {
    const result = await restoranModel.findById(req.params.id);
    res.send(result);
  } catch (error) {
    res.send(error);
  }
});

router.post("/", upload.single(), async (req, res) => {
  try {
    const newRestoran = new restoranModel(req.body);
    const result = await newRestoran.save();
    console.log(result);
    res.send(result);
  } catch (error) {
    res.send(error);
  }
});

router.post("/fill", async (req, res) => {
  try {
    dummyData.map(async (data) => {
      const newRestoran = new restoranModel(data);
      await newRestoran.save();
    });
    const result = "ok";
    res.send(result);
  } catch (error) {
    res.send(error);
  }
});

export default router;
