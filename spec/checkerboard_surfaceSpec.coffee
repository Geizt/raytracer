rt: exports? and exports or @rt or @rt = {}

describe 'CheckerboardSurface', ->
	position_1 = null
	position_2 = null
	checkerboard_surface = null

	beforeEach ->
		position_1 = new rt.Vector3D( 2.0, 3.0, 4.0 )
		position_2 = new rt.Vector3D( 4.5, 6.0, 7.8 )
		checkerboard_surface = new rt.CheckerboardSurface()

		return
	
	it 'is an object', ->
		expect( checkerboard_surface instanceof rt.Object ).toBe true

	it 'is a surface', ->
		expect( checkerboard_surface instanceof rt.Surface ).toBe true

	it 'can be validated', ->
		valid_checkerboard_surface = checkerboard_surface.IsValid()

		expect( valid_checkerboard_surface ).toBe true

	it 'has a roughness', ->
		expect( checkerboard_surface.roughness ).toBe 150

	it 'can reflect', ->
		reflection_1 = checkerboard_surface.Reflect( position_1 )
		reflection_2 = checkerboard_surface.Reflect( position_2 )

		expect( reflection_1 ).toBe 0.7
		expect( reflection_2 ).toBe 0.1

	it 'has a diffuse reflection', ->
		diffuse_reflection_1 = checkerboard_surface.Diffuse( position_1 )
		diffuse_reflection_2 = checkerboard_surface.Diffuse( position_2 )

		expect( diffuse_reflection_1.red ).toBe 0.0
		expect( diffuse_reflection_1.green ).toBe 0.0
		expect( diffuse_reflection_1.blue ).toBe 0.0

		expect( diffuse_reflection_2.red ).toBe 1.0
		expect( diffuse_reflection_2.green ).toBe 1.0
		expect( diffuse_reflection_2.blue ).toBe 1.0

	it 'has a specular reflection', ->
		specular_reflection = checkerboard_surface.Specular( position_1 )

		expect( specular_reflection.red ).toBe 1.0
		expect( specular_reflection.green ).toBe 1.0
		expect( specular_reflection.blue ).toBe 1.0