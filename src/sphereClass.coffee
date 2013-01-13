# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.Sphere extends rt.GeometricObject
	constructor: ( center, radius, surface ) ->
		if center? and radius? and surface? 
			if not center.IsValid?() or not rt.MathLibrary.IsValid( radius ) or not surface.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		@center = center
		@radius_squared = radius * radius
		@surface = surface

	IsValid: ->
		return @center.IsValid() and rt.MathLibrary.IsValid( @radius_squared ) and @surface.IsValid()

	Normal: ( position ) ->
		if not position? or not position.IsValid()
			throw new TypeError

		return rt.MathLibrary.VectorSubtraction( position, @center ).Normalize()

	Intersect: ( ray ) ->
		if not ray? or not ray.IsValid()
			throw new TypeError

		direction = rt.MathLibrary.VectorSubtraction( @center, ray.origin )
		projection = direction.Dot( ray.direction )
		distance = 0

		if ( projection >= 0 )
			disc = @radius_squared - ( direction.Dot( direction ) - ( projection * projection ) )

			if ( disc >= 0 )
				distance = projection - Math.sqrt( disc )

		if ( distance == 0 )
			return null
		else
			return new rt.Intersection( @, ray, distance )