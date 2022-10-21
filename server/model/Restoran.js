import mongoose from "mongoose";
import { makananSchema } from "./Makanan.js";

const restoranSchema = mongoose.Schema({
  nama: String,
  makanan: makananSchema,
});

export const restoranModel = mongoose.model("Restoran", restoranSchema);
