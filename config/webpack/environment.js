const { environment } = require('@rails/webpacker')
const jquery = require('./plugins/jquery')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const eslint = require('./loaders/eslint')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.loaders.append('eslint', eslint)
environment.plugins.prepend('jquery', jquery)
module.exports = environment
