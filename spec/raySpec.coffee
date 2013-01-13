rt: exports? and exports or @rt or @rt = {}

describe 'Ray', ->
	ray = null

	beforeEach ->
		origin = new rt.Vector3D( 2.0, 3.0, 4.0 )
		direction = new rt.Vector3D( 1.0, 0.0, 0.0 )
		ray = new rt.Ray( origin, direction )

		return
	
	it 'is an object', ->
		expect( ray instanceof rt.Object ).toBe true

	it 'can be initialized', ->
		expect( ray.origin.x ).toBe 2.0
		expect( ray.origin.y ).toBe 3.0
		expect( ray.origin.z ).toBe 4.0

		expect( ray.direction.x ).toBe 1.0
		expect( ray.direction.y ).toBe 0.0
		expect( ray.direction.z ).toBe 0.0

	it 'can be validated', ->
		valid_ray = ray.IsValid()

		expect( valid_ray ).toBe true