# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.Surface extends rt.Object
	constructor: ->
		@roughness = 0

	IsValid: ->
		return false

	Diffuse: ->
		return null

	Specular: ->
		return null

	Reflect: ->
		return null