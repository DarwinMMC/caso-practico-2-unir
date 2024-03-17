const connection = require("../connection.js");

const list = (req, res) => {
  connection.query(`SELECT * FROM counted`, (error, results, fields) => {
    if (error) {
      res.status(500);
      res.send(error.message);
    } else {
      res.status(200).json(results);
    }
  });
};

const add = (req, res) => {
  connection.query(
    `INSERT INTO counted (value) VALUES (${req.body.value})`,
    (error, results, fields) => {
      if (error) {
        res.status(500).send(error);
      } else {
        res.status(200).send("created");
      }
    }
  );
};

module.exports = {
  list,
  add,
};
