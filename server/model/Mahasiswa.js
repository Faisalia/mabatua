import mongoose from "mongoose";

const mahasiswaSchema = mongoose.Schema({
  namaDepan: String,
  namaBelakang: String,
  loc: Number,
});

export const mahasiswaModel = mongoose.model("Mahasiswa", mahasiswaSchema);
