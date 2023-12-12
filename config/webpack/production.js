process.env.NODE_ENV = process.env.NODE_ENV || 'production'

// const environment = require('./environment')

// module.exports = environment.toWebpackConfig()
module.exports = {
    mode: 'production',
    entry: './app/javascript/application.js', // Example entry path pointing to 'index.js' in the 'src' directory
    // Other webpack configuration options...
  };
