import React, { useState } from "react";
import { Link } from "react-router-dom";
import Header from "./Navbar";

const Logins = () => {
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
        <form method="POST" action="/session">
        <div className="row">
             
              <div>
          <input
            className="form-control log"
            type="email"
            name="login[email]"
            placeholder="Example@gmail.com"
          />
          </div>
          </div>
          <br></br>
         
              <div>
          <input
            className="form-control log"
            type={showPassword ? "text" : "password"}
            name="login[password]"
            placeholder="***********"
          />
           </div>
      
        
          <br></br>
          <input type="checkbox" onChange={togglePassword} /> <span className="head"> Show Password</span>
          <br></br>
          <br />
          <center>
            <button className=" btn-primary1 form-control" type="submit">
              Register
            </button>
           
          </center>
          <div className="create">
            <Link to="/recipie">
               <h5 className="head">Create a New account ? </h5>
            </Link>
            </div>


        </form>
        </div>
        </div>
        </div>

      </div>
      </div>
        
  );
};

export default Logins;































      
{/*      
      <div className="reg">
      <div className="row">
      <div className="vw-200 vh-100 d-flex align-items-center justify-content-center">
        {/* <div className="jumbotron jumbotron-fluid bg-transparent"> */}
     {/* <div className="container"> */}
        
     
        {/* <div className="col-sm-6">
        <center>
        <h1 className="display-2 justify-center head">URL Shortner</h1>
        <h4 className="head">
          <center> All types of URLs are shortened Here </center>
        </h4>
      
      </center>
      </div>
      

      <div className="col-sm-6">

      {/* <div className="login-form">   */}
        {/* <form method="post" action="/session">
          <div className="row">
          <div className="col-6">
          <input
            className="form-control log1"
            type="email"
            name="login[email]"
            placeholder="Email"
          />
          </div>
          <br></br>
          <div className="col-6">
          <input
            className="form-control log1"
            id="pass"
            type={showPassword ? "text" : "password"}
            name="login[password]"
            placeholder="Password"
          />
          </div>
          <br></br>
          <input type="checkbox" onChange={togglePassword} /><span className="head"> Show Password</span>
          <br></br>
          <br />
          
            <input  className=" btn-primary1 form-control logbtn" type="submit" value="Login" />        
         
          <br></br>
          <div className="create">
          <Link to="/recipie">
               <h5 className="head">Create a New account ? </h5>
            </Link>
            </div>
            </div>
        </form>
        </div> */}
      {/* </div> */} 
    {/* //   </div> */}
    {/* // </div> */}
    {/* // </div> */}
  //  {/* </div> */}
    {/* // </div> */} 

  
//   );
// };

// export default Logins;
