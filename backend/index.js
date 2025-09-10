const express = require("express");
const mysql = require("mysql2");
const dotenv = require("dotenv");

dotenv.config({
  path: `.env.${process.env.NODE_ENV || "dev"}`,
  path: `.env.${process.env.NODE_ENV || "prod"}`
});

const app = express();
app.use(express.json());

const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME
});

// Test DB connection
db.connect(err => {
  if (err) {
    console.error("Database connection failed:", err);
  } else {
    console.log("! Connected to MySQL database !");
  }
});

// Example route
app.get("/", (req, res) => {
  res.json({ message: "! SQLibrary API is running !" });
});

const PORT = process.env.DB_PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});

// This tests if environment variables are loaded correctly
console.log("ENV settings:", process.env.DB_HOST, process.env.DB_USER, process.env.DB_NAME, process.env.DB_PORT);
