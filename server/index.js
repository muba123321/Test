const express = require("express");
const mongoose = require("mongoose");

const authRouter = require("./routes/auth");

const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://mubarak:qazxsw123@cluster0.lpimbmj.mongodb.net/?retryWrites=true&w=majority";

app.use(express.json());
app.use(authRouter);

// API creating requires Get, Put, Post, Delete, Update -> Crud
mongoose
  .connect(DB)
  .then(() => {
    console.log("connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
