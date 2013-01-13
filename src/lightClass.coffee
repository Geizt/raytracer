# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.Light extends rt.Object
	constructor: ( position, color ) ->
		if position? and color? 
			if not position.IsValid?() or not color.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		@position = new rt.Vector3D( position.x, position.y, position.z )
		@color = new rt.RGBColor( color.red, color.green, color.blue )

	IsValid: ->
		return @position.IsValid() && @color.IsValid()