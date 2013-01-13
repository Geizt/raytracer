# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.GeometricObject extends rt.Object
	IsValid: ->
		return false

	Normal: ( position ) ->
		return null

	Intersect: ( ray ) ->
		return null