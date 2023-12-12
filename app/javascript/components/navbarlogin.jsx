import React from "react";
import { Link } from "react-router-dom"
import { Nav } from 'react-bootstrap';
import { Navbar } from "react-bootstrap";


function Header11 (){
    return (
        <Navbar bg="dark" data-bs-theme="dark">
            <div className="container-fluid">
       
            <Navbar.Brand href="/"><h2>  Url Shortner </h2></Navbar.Brand>
            </div>
            <div className="d-flex justify-content-end nav-tabs ">
            <Nav>
                <Nav.Link href="/count"><h4 className="space"> Home</h4></Nav.Link>
                <Nav.Link href="/about"><h4 className="space"> About</h4></Nav.Link>
                <Nav.Link href="/summary"><h4 className="space"> Summary</h4></Nav.Link>
                <Nav.Link href="/"><h4 className="space"> Logout </h4></Nav.Link>
                
            </Nav>
            </div>
        
        </Navbar>   
    );
  }
  export default Header11