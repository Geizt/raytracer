# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.Camera
	constructor: ( position, direction ) ->
		if position? and direction? 
			if not position.IsValid?() or not direction.IsValid?()
				throw new TypeError
		else
			throw new TypeError
		
		down = new rt.Vector3D( 0.0, -1.0, 0.0 )

		@position = new rt.Vector3D( position.x, position.y, position.z )

		@direction = new rt.Vector3D()
		@direction.SetV( @position ).Add( direction ).Normalize()

		@right = new rt.Vector3D()
		@right.SetV( @direction.Cross( down ).Normalize() ).Scale( 1.5 )

		@up = new rt.Vector3D()
		@up.SetV( @direction.Cross( @right ).Normalize() ).Scale( 1.5 )