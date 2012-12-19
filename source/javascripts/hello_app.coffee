//= require 'lib'
//= require_tree './_hello_app'

# Importing our Main controller with the CommonJS function 'require'.
Main = require '_hello_app/controllers/main'

# Creating a minimal root controller to keep a reference to the body tag.
class HelloApp extends Spine.Controller

  constructor: ->
    # it's important to call the super since we are passing in an options
    # object containing the el reference.
    super
    
    # instantiate a superstars controller
    @main = new Main

    # append it to @el, which happens to be '<body/>'   
    @append @main
    
    @routes
      '/superstars': ->
        @main.superstars()

      '/machines': ->
        @main.machines()

    @navigate '/superstars'

# Time to start the app, let jQuery kick us off. 
$ ->
  #Instantiate a new Hello controller and pass the body tag as it's element.
  new HelloApp
    el: $('body')