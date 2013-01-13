# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.Object
	IsValid: ->
		return false