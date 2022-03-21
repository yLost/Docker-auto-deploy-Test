const express = require("express");
const app = express();

app.get("/", (req, res) => {
  console.log("Works", process.env.ENV_TEST);
  res.send("AEEE POHAAA! env_status:" + process.env.ENV_TEST);
});

app.listen(3000, () => {
  console.log("Service started");
});
