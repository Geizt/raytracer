rt: exports? and exports or @rt or @rt = {}

describe 'Camera', ->
	camera = null

	beforeEach ->
		position = new rt.Vector3D( 0.0, 0.0, 0.0 )
		direction = new rt.Vector3D( 1.0, 0.0, 0.0 )
		camera = new rt.Camera( position, direction )

		return
	
	it 'is an object', ->
		expect( camera instanceof rt.Object ).toBe true

	it 'can be initialized', ->
		expect( camera.position.x ).toBe 0.0
		expect( camera.position.y ).toBe 0.0
		expect( camera.position.z ).toBe 0.0

		expect( camera.direction.x ).toBe 1.0
		expect( camera.direction.y ).toBe 0.0
		expect( camera.direction.z ).toBe 0.0

		expect( camera.right.x ).toBe 0.0
		expect( camera.right.y ).toBe 0.0
		expect( camera.right.z ).toBe -1.5

		expect( camera.up.x ).toBe 0.0
		expect( camera.up.y ).toBe 1.5
		expect( camera.up.z ).toBe 0.0

	it 'can be validated', ->
		valid_camera = camera.IsValid()

		expect( valid_camera ).toBe true