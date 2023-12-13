// process.env.NODE_ENV = process.env.NODE_ENV || 'production'

// const environment = require('./environment')


const path = require('path');

module.exports = {
  mode: 'production',
  node: {
    __dirname: false, // Controls whether __dirname should be available
    __filename: false, // Controls whether __filename should be available
    global: true, // Controls whether the 'global' variable should be available
  },
  entry: {
    
    // main: '.app/javascript/application.js',
  },
  output: {
    // Output configuration
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js',
  },
  // Other webpack configurations specific to production...
};
  

// module.exports = environment.toWebpackConfig()
