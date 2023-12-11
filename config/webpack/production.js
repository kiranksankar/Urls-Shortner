process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()
module.exports = {
    mode: 'production',
    entry: {
      main: './app/javascript/packs/application.js', 
      // Example single entry point
      // If you have multiple entry points, you can define them like this:
    //   admin: './src/admin.js',
    //   dashboard: ['./src/dashboard.js', './src/dashboardStyles.css'],
    },
    output: {
        filename: '[name].bundle.js',
        path: __dirname + '/dist',
      },
      // 
}
