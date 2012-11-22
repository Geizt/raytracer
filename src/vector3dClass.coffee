# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.Vector3D
	constructor: ( x, y, z ) ->
		if x? and not rt.MathLibrary.IsValid( x ) or y? and not rt.MathLibrary.IsValid( y ) or z? and not rt.MathLibrary.IsValid( z )
			throw new TypeError
		else
			@x = x ? 0.0
			@y = y ? 0.0
			@z = z ? 0.0

	IsValid: ->
		return rt.MathLibrary.IsValid( @.x ) and rt.MathLibrary.IsValid( @.y ) and rt.MathLibrary.IsValid( @.z )

	SetZero: -> 
		@x = 0.0
		@y = 0.0
		@z = 0.0

		return @

	Set: ( x, y, z ) -> 
		if not x? or not rt.MathLibrary.IsValid( x ) or not y? or not rt.MathLibrary.IsValid( y ) or not z? or not rt.MathLibrary.IsValid( z )
			throw new TypeError
		else
			@x = x
			@y = y
			@z = z

		return @

	SetV: ( vector ) -> 
		if vector? 
			if not vector.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		@x = vector.x
		@y = vector.y
		@z = vector.z

		return @

	Negative: -> 
		return new rt.Vector3D( -@x, -@y, -@z )

	Copy: ->
		return new rt.Vector3D( @x, @y, @z )

	Add: ( vector ) ->
		if vector? 
			if not vector.IsValid?()
				throw new TypeError
		else
			throw new TypeError
		
		@x += vector.x
		@y += vector.y
		@z += vector.z

		return @

	Subtract: ( vector ) ->
		if vector? 
			if not vector.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		@x -= vector.x
		@y -= vector.y
		@z -= vector.z

		return @

	Scale: ( scalar ) ->
		if not scalar? or not rt.MathLibrary.IsValid( scalar )
			throw new TypeError
		
		@x *= scalar
		@y *= scalar
		@z *= scalar

		return @

	Magnitude: ->
		return Math.sqrt( @.x * @.x + @.y * @.y + @.z * @.z )

	Normalize: ->
		magnitude = @.Magnitude()

		if magnitude <= Number.MIN_VALUE
			invLength = Infinity
		else
			invLength = 1.0 / magnitude

		return @.Scale( invLength )

	Dot: ( vector ) ->
		if not vector? or not vector.IsValid()
			throw new TypeError
		
		return @.x * vector.x + @.y * vector.y + @.z * vector.z

	Cross: ( vector ) ->
		if not vector? or not vector.IsValid()
			throw new TypeError

		x = @.y * vector.z - @.z * vector.y
		y = @.z * vector.x - @.x * vector.z
		z = @.x * vector.y - @.y * vector.x

		return new rt.Vector3D( x, y, z )