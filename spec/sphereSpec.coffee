rt: exports? and exports or @rt or @rt = {}

describe 'Sphere', ->
	center = null
	radius = null
	surface = null
	sphere = null

	beforeEach ->
		center = new rt.Vector3D( 0.0, 1.0, -5.0 )
		radius = 1.0
		surface = new rt.ReflectiveSurface()

		sphere = new rt.Sphere( center, radius, surface )

		return
	
	it 'is an object', ->
		expect( sphere instanceof rt.Object ).toBe true

	it 'is a geometric object', ->
		expect( sphere instanceof rt.GeometricObject ).toBe true

	it 'can be validated', ->
		valid_sphere = sphere.IsValid()

		expect( valid_sphere ).toBe true

	it 'can calculate a normal', ->
		position = new rt.Vector3D( 3.0, 1.0, 0.0 )

		normal = sphere.Normal( position )

		expect( normal.x ).toBe 0.5144957554275265
		expect( normal.y ).toBe 0.0
		expect( normal.z ).toBe 0.8574929257125441

	it 'can calculate an intersection', ->
		origin = new rt.Vector3D( 0.0, 0.0, 0.0 )
		direction = new rt.Vector3D( 0.0, 0.0, -1.0 )
		ray = new rt.Ray( origin, direction )

		intersection = sphere.Intersect( ray )

		expect( intersection instanceof rt.Intersection ).toBe true