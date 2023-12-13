/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/components/Urlshortener.jsx");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/components/Urlshortener.jsx":
/*!****************************************************!*\
  !*** ./app/javascript/components/Urlshortener.jsx ***!
  \****************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

// import React, { useState } from "react";
// import Header from "./Navbar";
// // import Header11 from "./navbarlogin";

// function Urlshortener() {
//   return (
// <div>
//       <div>
//         <Header />
//       </div>
//       <center>
//          <h1 className="display-2 justify-center">URL Shortner</h1>
//          <p className="lead">
//            <center> All types of URLs are shortened Here </center>
//          </p>
//      </center>
//      <br></br>
//      <div className="container">
//      <h4>URL Shortner is a free tool to shorten URLs and generate short links
//         URL shortener allows to create a shortened link making it easy to share</h4>

//     <br></br>
//         <div className="about">
//         <h2><u>Simple and fast URL shortener!</u></h2>

//         </div>
//         <br></br>
//         <p>ShortURL allows to shorten long links from Instagram, Facebook, YouTube, Twitter, Linked In, WhatsApp, TikTok, blogs and sites. Just paste the long URL and click the Shorten URL button. On the next page, copy the shortened URL and share it on sites, chat and emails. After shortening the URL, check how many clicks it received.</p>

//         <br></br>
//         <div className="about">
//         <h2><u>Shorten, share and track</u></h2>

//         </div>
//         <br></br>
//         <p>You can Shorten any url you like and can dowload the shortened url and the original url in <span className="red"> pdf format </span> and you can copy the shortened Urls for further purposes. You can shorten <a href="/upload">single link, multiple link</a>   and even liks in a <span className="red">CSV format </span> </p> 

//      </div>

//       </div>

// //     <div>
// //       <div>  
// //         <Header11 />
// //       </div>

// //       <center>
// //         <h1 className="display-2 justify-center">URL Shortner</h1>
// //         <p className="lead">
// //           <center> All types of URLs are shortened Here </center>
// //         </p>
// //       </center>
// //       <div className="container login-form">
// //       <form method="POST" action="/urls">
// //         <div className="row">
// //           <div className="col-8">
// //             <label><p>Add URLS Here</p></label>

// //             <input type="text" name="url[original_url]" className="form-control urlsinput "></input>
// //           </div>
// //           <div className="col-4">
// //             <button className="btn-url" type="submit">Create </button>
// //           </div>
// //         </div>
// //         </form>
// //         <br></br>
// //         <p>When adding multiple urls please separate it by  (,)  commas </p>

// //           <br></br>
// //           <form method="POST"  action="create">
// //         <div className="file">
// //         <div className="row">
// //           <div className="col-8">
// //           <label><p>Please upload a document:</p></label>
// //             <input type="file" id=" fileInput" name="url[pdf_file]" className="form-control urlsinput"  />
// //             </div>
// //             <div className="col-4">
// //             <button className="btn-url">submit </button>
// //             </div>

// //         </div>
// //         </div>
// //         </form>

// //       </div>
// //     </div>
//   );
// }

// export default Urlshortener;

/***/ })

/******/ });
//# sourceMappingURL=Urlshortener-d3e8c80407cae70c7527.js.map