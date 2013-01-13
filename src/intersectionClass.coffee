# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.Intersection extends rt.Object
	constructor: ( object, ray, distance ) ->
		if object? and ray? and distance? 
			if not object instanceof rt.GeometricObject or not object.IsValid?() or not ray.IsValid?() or not rt.MathLibrary.IsValid( distance )
				throw new TypeError
		else
			throw new TypeError

		@object = object
		@ray = ray
		@distance = distance

	IsValid: ->
		return @object.IsValid() and @ray.IsValid() and rt.MathLibrary.IsValid( @distance )