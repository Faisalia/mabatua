import mongoose from "mongoose";

export const makananSchema = mongoose.Schema({
  nama: String,
  harga: Number,
  deskripsi: String,
  foto: { type: Buffer, default: null },
  restoran: { type: mongoose.Schema.Types.ObjectId, ref: "Restoran" },
});

makananSchema.methods.toJSON = function () {
  const result = this.toObject();
  delete result.foto;
  return result;
};

export const makananModel = mongoose.model("Makanan", makananSchema);
