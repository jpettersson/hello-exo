//= require 'vendor/_jquery-1.8.2.min'

# hamlcoffee gives us HAML JST templates.
//= require 'hamlcoffee'

# CommonJs gives us nice module imports.
//= require 'sprockets/commonjs'

# Using the CoffeeScript source of Spine, directly from the symlinked spine submodule.
//= require 'vendor/_spine/spine'
//= require 'vendor/_spine/route'
//= require 'vendor/_spine/local'

# Pull in the exo.js coffeescript source from the symlinked exo submodule.
//= require 'vendor/_exo/exo.module'

# Using TweenMax for nice & easy animations.
//= require 'vendor/_TweenMax.min'

Exo = require 'vendor/_exo/exo'