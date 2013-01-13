# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.ReflectiveSurface extends rt.Surface
	constructor: ->
		@roughness = 250

	IsValid: ->
		return rt.MathLibrary.IsValid( @roughness )

	Reflect: ( position ) ->
		if position? 
			if not position.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		return 0.7

	Diffuse: ( position ) ->
		if position? 
			if not position.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		return rt.RGBColors.white

	Specular: ( position ) ->
		if position? 
			if not position.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		return rt.RGBColors.grey