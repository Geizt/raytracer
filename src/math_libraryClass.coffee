# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.MathLibrary
	@IsValid: ( scalar ) ->
		return not isNaN( scalar )