# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.MathLibrary
	@IsValid: ( scalar ) ->
		return not isNaN( scalar )

	@ClampScalar: ( scalar, lower_limit, upper_limit ) ->
		return Math.max( lower_limit, Math.min( scalar, upper_limit ) )