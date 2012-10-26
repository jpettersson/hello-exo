//= require_tree './_example_app'

class ExampleApp extends Exo.Spine.Controller

	prepare: ->
		console.log "ExampleApp!"

new ExampleApp
	el: ($ 'body')