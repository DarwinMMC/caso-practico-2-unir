const express = require("express");
const morgan = require("morgan");
const router = require("./routes/routes");
const app = express();
const path = require("path");

//middlewares
app.use(express.json());
app.use(morgan("dev"));
app.use(router);

app.use((err, req, res, next) => {
  res.status(500);
  res.send(err.message);
});

module.exports = app;
