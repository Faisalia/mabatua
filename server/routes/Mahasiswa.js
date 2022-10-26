import express from "express";
import multer from "multer";
import { mahasiswaModel } from "../model/Mahasiswa.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

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
    const userExisted = await mahasiswaModel.findOne({
      username: req.body.username,
    });

    if (userExisted) {
      throw new Error("Username already existed");
    }

    if (req.body.password !== req.body.confirmPassword) {
      throw new Error("Confirm password doesnt match");
    }

    let data = req.body;
    data.password = await bcrypt.hashSync(req.body.password, 7);

    const newMahasiswa = new mahasiswaModel(data);
    const result = await newMahasiswa.save();
    res.send(result);
  } catch (error) {
    res.send({ error: error.message });
  }
});

router.post("/login", upload.single(), async (req, res) => {
  const JWT_SECRET = "APA AJA TERSERAH";
  try {
    if (req.body.username === "" || req.body.password === "") {
      throw new Error("Empty Field");
    }

    const mahasiswa = await mahasiswaModel.findOne({
      username: req.body.username,
    });

    if (
      !mahasiswa ||
      !(await bcrypt.compare(req.body.password, mahasiswa.password))
    ) {
      res.status(500).send({ error: "Wrong username/password" });
      return;
    }

    res.send({ mahasiswa });
  } catch (error) {
    if (error.details) {
      res.status(422).send({ error: error.details[0].message });
    } else {
      res.status(500).send({ error: error.message });
    }
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

router.put("/:id", upload.single(), async (req, res) => {
  try {
    const userExisted = await mahasiswaModel.findOne({ _id: req.params.id });

    if (!userExisted) {
      throw new Error("User doesnt exist");
    }

    if (req.body.password !== req.body.confirmPassword) {
      throw new Error("Confirm password doesnt match");
    }

    if (!(await bcrypt.compare(req.body.authPassword, userExisted.password))) {
      res.status(500).send({ error: "Wrong password" });
      return;
    }

    let data = req.body;
    data.password = await bcrypt.hashSync(req.body.password, 7);

    const result = await mahasiswaModel.updateOne(userExisted, data, {
      new: true,
    });

    res.send(result);
  } catch (error) {
    res.send({ error: error.message });
  }
});

router.delete("/:id", async (req, res) => {
  try {
    const user = mahasiswaModel.findOne({ _id: req.params.id });
    const result = await user.deleteOne();
    res.send(result);
  } catch (error) {
    res.send({ error });
  }
});

export default router;
