import mongoose from "mongoose";

const mahasiswaSchema = mongoose.Schema({
  namaDepan: { type: String, required: true },
  namaBelakang: { type: String, required: true },
  loc: Number,
  username: { type: String, required: true },
  password: { type: String, required: true },
});

export const mahasiswaModel = mongoose.model("Mahasiswa", mahasiswaSchema);
