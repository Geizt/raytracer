# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.Plane extends rt.GeometricObject
	constructor: ( normal, offset, surface ) ->
		if normal? and offset? and surface? 
			if not normal.IsValid?() or not rt.MathLibrary.IsValid( offset ) or not surface.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		@normal = normal
		@offset = offset
		@surface = surface

	IsValid: ->
		return @normal.IsValid() and rt.MathLibrary.IsValid( @offset ) and @surface.IsValid()

	Normal: ( position ) ->
		return @normal

	Intersect: ( ray ) ->
		projection = @normal.Dot( ray.direction )

		if ( projection >= 0 )
			return null
		else
			distance = ( @normal.Dot( ray.origin ) + @offset ) / ( -projection )

			return new rt.Intersection( @, ray, distance )