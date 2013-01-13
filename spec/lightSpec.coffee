rt: exports? and exports or @rt or @rt = {}

describe 'Light', ->
	light = null

	beforeEach ->
		position = new rt.Vector3D( 2.0, 3.0, 4.0 )
		color = new rt.RGBColor( 0.1, 0.3, 0.8 )
		light = new rt.Light( position, color )

		return
	
	it 'is an object', ->
		expect( light instanceof rt.Object ).toBe true

	it 'can be initialized', ->
		expect( light.position.x ).toBe 2.0
		expect( light.position.y ).toBe 3.0
		expect( light.position.z ).toBe 4.0

		expect( light.color.red ).toBe 0.1
		expect( light.color.green ).toBe 0.3
		expect( light.color.blue ).toBe 0.8

	it 'can be validated', ->
		valid_light = light.IsValid()

		expect( valid_light ).toBe true