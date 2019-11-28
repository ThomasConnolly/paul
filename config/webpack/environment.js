const { environment } = require('@rails/webpacker')

const webpack = require("webpack")

// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.append(
  'Provide', 
  new webpack.ProvidePlugin({
    $: 'jquery',
    JQuery: 'jquery',
    jquery: 'jquery',
    Popper: ['popper.js', 'default'], // for Bootstrap 4
    Rails: ['@rails/ujs']
  })
)

module.exports = environment
