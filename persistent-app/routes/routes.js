const express = require("express");
const router = express.Router();
const { list, add } = require("../controllers/tasks-controller");
router.get("/count", list);
router.post("/save", add);

module.exports = router;
