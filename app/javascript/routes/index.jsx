import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "../components/Home";
import Recipie from "../components/Recipie";
import Logins from "../components/Logins";
// import Urlshortener from "../components/Urlshortener";
import About from "../components/About";
// import Urlshortener from "../components/Urlshortener"

export default (
  <Router>
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/recipie" element={<Recipie />} />
      <Route path="logins" element={<Logins />} />
      <Route path="/about" element={<About />} />
    </Routes>
  </Router>
);
