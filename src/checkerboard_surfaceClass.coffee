# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.CheckerboardSurface extends rt.Surface
	constructor: ->
		@roughness = 150

	IsValid: ->
		return rt.MathLibrary.IsValid( @roughness )

	Reflect: ( position ) ->
		if position? 
			if not position.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		if ( ( Math.floor( position.z ) + Math.floor( position.x ) ) % 2 isnt 0 )
			return 0.1
		else
			return 0.7

	Diffuse: ( position ) ->
		if position? 
			if not position.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		if ( ( Math.floor( position.z ) + Math.floor( position.x ) ) % 2 isnt 0 )
			return rt.RGBColors.white
		else
			return rt.RGBColors.black

	Specular: ( position ) ->
		if position? 
			if not position.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		return rt.RGBColors.white