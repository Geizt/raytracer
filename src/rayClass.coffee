# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.Ray extends rt.Object
	constructor: ( origin, direction ) ->
		if origin? and direction? 
			if not origin instanceof rt.Vector3D or not origin.IsValid?() or not direction instanceof rt.Vector3D or not direction.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		@origin = new rt.Vector3D( origin.x, origin.y, origin.z )
		@direction = new rt.Vector3D( direction.x, direction.y, direction.z )

	IsValid: ->
		return @origin.IsValid() and @direction.IsValid()