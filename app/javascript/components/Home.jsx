import React from "react";
import { Link } from "react-router-dom";
import Header from "./Navbar";

function Home() {
  return (
    <div>
      <div>
        <Header />
      </div>
     <div className="body">
      <div className="vw-100 vh-100 d-flex align-items-center justify-content-center">
        <div className="jumbotron jumbotron-fluid bg-transparent">
          <center className="url">
            <h1 className="display-2 head">URL Shortner</h1>
          </center>
          <h4 className="head">
            <center> All types of URLs are shortened Here </center>
          </h4>
          <center>
            <hr className="my-4 head" />

            <Link to="/recipie" role="button">
              <h3> Register</h3>
            </Link>
          </center>
          <center>
            <hr className="my-4 head " />

            <Link to="/logins" role="button">
              <h3> Log In</h3>
            </Link>
          </center>
        </div>
        {/* <%= @user.each do |i| %> */}
      </div>
    </div>
    </div>
  );
}

export default Home;
