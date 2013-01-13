# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.MathLibrary
	@IsValid: ( scalar ) ->
		return not isNaN( scalar )

	@ClampScalar: ( scalar, lower_limit, upper_limit ) ->
		if scalar? and lower_limit? and upper_limit?
			if not @IsValid( scalar ) or not @IsValid( lower_limit ) or not @IsValid( upper_limit )
				throw new TypeError
		else
			throw new TypeError

		return Math.max( lower_limit, Math.min( scalar, upper_limit ) )

	@VectorAddition: ( vector_1, vector_2 ) ->
		if vector_1? and vector_2? 
			if not vector_1.IsValid?() or not vector_2.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		x = vector_1.x + vector_2.x
		y = vector_1.y + vector_2.y
		z = vector_1.z + vector_2.z

		return new rt.Vector3D( x, y, z )

	@VectorSubtraction: ( vector_1, vector_2 ) ->
		if vector_1? and vector_2? 
			if not vector_1.IsValid?() or not vector_2.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		x = vector_1.x - vector_2.x
		y = vector_1.y - vector_2.y
		z = vector_1.z - vector_2.z

		return new rt.Vector3D( x, y, z )

	@VectorScaling: ( scalar, vector ) ->
		if scalar? and vector? 
			if not @IsValid( scalar ) or not vector.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		x = scalar * vector.x
		y = scalar * vector.y
		z = scalar * vector.z

		return new rt.Vector3D( x, y, z )

	@VectorNormalization: ( vector ) ->
		magnitude = vector.Magnitude()

		if magnitude <= Number.MIN_VALUE
			invLength = Infinity
		else
			invLength = 1.0 / magnitude

		x = invLength * vector.x
		y = invLength * vector.y
		z = invLength * vector.z

		return new rt.Vector3D( x, y, z )