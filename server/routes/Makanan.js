import express from "express";
import multer from "multer";
import { makananModel } from "../model/Makanan.js";
import { restoranModel } from "../model/Restoran.js";

const upload = multer();

const dummyData = [
  {
    nama: "Ayam Geprek",
    harga: 15000,
    deskripsi: "Ayam digeprek + Sambal + Nasi",
    restoran: "6350cb851e8a1f4caafd5a57",
  },
  {
    nama: "Warteg",
    harga: 10000,
    deskripsi: "warteg",
    restoran: "6350cb851e8a1f4caafd5a57",
  },
  {
    nama: "Mie ayam",
    harga: 10000,
    deskripsi: "Mie ayam",
    restoran: "6350cb851e8a1f4caafd5a57",
  },
];

const router = express.Router();

router.get("/", async (req, res) => {
  try {
    const result = await makananModel.find();
    res.send(result);
  } catch (error) {
    res.send(error);
  }
});

router.get("/rekomendasi", async (req, res) => {
  try {
    const budget = parseInt(req.query.budget);
    const hari = parseInt(req.query.hari);

    const rekomendasiPengeluaranPerMakanan = parseInt(budget / (3 * hari));

    const rekomendasiMakanan = (await makananModel.find()).filter(
      (makanan) => makanan.harga <= rekomendasiPengeluaranPerMakanan
    );

    res.send({ rekomendasiPengeluaranPerMakanan, rekomendasiMakanan });
  } catch (error) {
    res.send(error);
  }
});

router.get("/:id", async (req, res) => {
  try {
    const result = await makananModel.findById(req.params.id);
    res.send(result);
  } catch (error) {
    res.send(error);
  }
});

router.get("/:id/foto", async (req, res) => {
  try {
    const post = await makananModel.findById(req.params.id);
    res.contentType("image/jpeg");
    res.send(post.foto);
  } catch (error) {
    res.send(error);
  }
});

router.post("/", upload.single("foto"), async (req, res) => {
  try {
    const restoranMakanan = await restoranModel.findById(req.body.restoran);

    if (!restoranMakanan) {
      throw new Error("Restoran tidak ada");
    }
    const newMakanan = new makananModel({
      nama: req.body.nama,
      harga: req.body.harga,
      deskripsi: req.body.deskripsi,
      restoran: restoranMakanan.id,
      foto: req.file.buffer,
    });

    await restoranMakanan.updateOne({
      $addToSet: { makanan: newMakanan },
    });

    const result = await newMakanan.save();
    res.send(result);
  } catch (error) {
    res.send({ error: error.message });
  }
});

router.post("/fill", async (req, res) => {
  try {
    dummyData.map(async (data) => {
      const restoran = restoranModel.findById(data.restoran);
      if (!restoran) {
        throw new Error("Restoran tidak ada");
      }

      const newMakanan = new makananModel(data);
      await newMakanan.save();
    });
    const result = "ok";
    res.send(result);
  } catch (error) {
    res.send(error);
  }
});

export default router;
