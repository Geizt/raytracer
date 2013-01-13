rt: exports? and exports or @rt or @rt = {}

describe 'Plane', ->
	normal = null
	offset = null
	surface = null
	plane = null

	beforeEach ->
		normal = new rt.Vector3D( 0.0, 1.0, 0.0 )
		offset = 1.0
		surface = new rt.CheckerboardSurface()

		plane = new rt.Plane( normal, offset, surface )

		return
	
	it 'is an object', ->
		expect( plane instanceof rt.Object ).toBe true

	it 'is a geometric object', ->
		expect( plane instanceof rt.GeometricObject ).toBe true

	it 'can be validated', ->
		valid_plane = plane.IsValid()

		expect( valid_plane ).toBe true

	it 'can calculate a normal', ->
		position = new rt.Vector3D( 1.0, 0.0, 0.0 )

		normal = plane.Normal( position )

		expect( normal.x ).toBe 0.0
		expect( normal.y ).toBe 1.0
		expect( normal.z ).toBe 0.0

	it 'can calculate an intersection', ->
		origin = new rt.Vector3D( 2.0, 3.0, 4.0 )
		direction = new rt.Vector3D( 0.0, -1.0, -1.0 )
		ray = new rt.Ray( origin, direction )

		intersection = plane.Intersect( ray )

		expect( intersection instanceof rt.Intersection ).toBe true