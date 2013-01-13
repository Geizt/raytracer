rt: exports? and exports or @rt or @rt = {}

describe 'Intersection', ->
	center = null
	radius = null
	surface = null
	sphere = null

	ray = null
	distance = null
	intersection = null

	beforeEach ->
		center = new rt.Vector3D( 0.0, 1.0, -5.0 )
		radius = 1.0
		surface = new rt.ReflectiveSurface()

		sphere = new rt.Sphere( center, radius, surface )

		ray = new rt.Ray( new rt.Vector3D( 0.0, 0.0, 0.0 ), new rt.Vector3D( 0.0, 0.0, -1.0 ) )
		distance = 5.5
		intersection = new rt.Intersection( sphere, ray, distance )

		return
	
	it 'is an object', ->
		expect( intersection instanceof rt.Object ).toBe true
	
	it 'is an intersection', ->
		expect( intersection instanceof rt.Intersection ).toBe true
	
	it 'can be validated', ->
		valid_intersection = intersection.IsValid()

		expect( valid_intersection ).toBe true