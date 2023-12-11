import React, { useState } from "react";
import Header from "./Navbar";
// import axios from 'axios';

function Recipie() {
  const [showPassword, setShowPassword] = useState(false);
  const togglePassword = () => {
    setShowPassword(!showPassword);
  };
  return (
  <div>
    
      <div>
        <Header />
      </div>
      
      <div className="reg">
      <div className="row">
      <div className="vw-100 vh-100 d-flex align-items-center justify-content-center">
        {/* <div className="jumbotron jumbotron-fluid bg-transparent"> */}
           
  
        {/* <div className="container"> */}
        <div className="col-sm-6">
      <center>
        <h1 className="display-2 justify-center head">URL Shortner</h1>
        <h4 className="head">
          <center> All types of URLs are shortened Here </center>
        </h4>
      </center>
      </div>
      <div className="col-sm-4">
        <form method="POST" action="/users">
        <div className="row">
              <div className="col-6">
        <input
            className="form-control log"
            type="text"
            name="user[username]"
            placeholder="Enter the Username"
          />
          </div>
              <div className="col-6">
          <input
            className="form-control log"
            type="email"
            name="user[email]"
            placeholder="Example@gmail.com"
          />
          </div>
          </div>
          <br></br>
          <div className="row">
              <div className="col-6">
          <input
            className="form-control log"
            type={showPassword ? "text" : "password"}
            name="user[password]"
            placeholder="***********"
          />
           </div>
              <div className="col-6">
          <input
            className="form-control log"  
            type={showPassword ? "text" : "password"}
            name="user[password_confirmation]"
            placeholder="***********"
          />
          </div>
          </div>
        
          <br></br>
          <input type="checkbox" onChange={togglePassword} /> <span className="head"> Show Password</span>
          <br></br>
          <br />
          <center>
            <button className=" btn-primary1 form-control" tupe="submit">
              Register
            </button>
          </center>
        </form>
        </div>
        </div>
        </div>
     
        </div>
        // </div>
  
    
  
  );
}

export default Recipie;
