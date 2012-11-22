# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.RGBColor
	constructor: ( red, green, blue ) ->
		if red? and not rt.MathLibrary.IsValid( red ) or green? and not rt.MathLibrary.IsValid( green ) or blue? and not rt.MathLibrary.IsValid( blue )
			throw new TypeError
		else
			@red = rt.MathLibrary.ClampScalar( red, 0.0, 1.0 ) ? 0.0
			@green = rt.MathLibrary.ClampScalar( green, 0.0, 1.0 ) ? 0.0
			@blue = rt.MathLibrary.ClampScalar( blue, 0.0, 1.0 ) ? 0.0

	IsValid: ->
		return rt.MathLibrary.IsValid( @.red ) and rt.MathLibrary.IsValid( @.green ) and rt.MathLibrary.IsValid( @.blue )

	Add: ( color ) ->
		if color? 
			if not color.IsValid?()
				throw new TypeError
		else
			throw new TypeError
		
		@red = rt.MathLibrary.ClampScalar( @red + color.red, 0.0, 1.0 )
		@green = rt.MathLibrary.ClampScalar( @green + color.green, 0.0, 1.0 )
		@blue = rt.MathLibrary.ClampScalar( @blue + color.blue, 0.0, 1.0 )

		return @

	Scale: ( scalar ) ->
		if not scalar? or not rt.MathLibrary.IsValid( scalar )
			throw new TypeError

		@red = rt.MathLibrary.ClampScalar( scalar * @red, 0.0, 1.0 )
		@green = rt.MathLibrary.ClampScalar( scalar * @green, 0.0, 1.0 )
		@blue = rt.MathLibrary.ClampScalar( scalar * @blue, 0.0, 1.0 )

		return @

	Multiply: ( color ) ->
		if color? 
			if not color.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		@red = rt.MathLibrary.ClampScalar( @red * color.red, 0.0, 1.0 )
		@green = rt.MathLibrary.ClampScalar( @green * color.green, 0.0, 1.0 )
		@blue = rt.MathLibrary.ClampScalar( @blue * color.blue, 0.0, 1.0 )

		return @

	getDrawingColor: ->
		return { 
			'red': Math.floor( rt.MathLibrary.ClampScalar( @red, 0.0, 1.0 ) * 255 ),
			'green': Math.floor( rt.MathLibrary.ClampScalar( @green, 0.0, 1.0 ) * 255 ),
			'blue': Math.floor( rt.MathLibrary.ClampScalar( @blue, 0.0, 1.0 ) * 255 )
		}

class rt.RGBColors
	@white = new rt.RGBColor( 1.0, 1.0, 1.0 )
	@grey = new rt.RGBColor( 0.5, 0.5, 0.5 )
	@black = new rt.RGBColor( 0.0, 0.0, 0.0 )
	@background = @black
	@default = @black