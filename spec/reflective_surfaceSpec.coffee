rt: exports? and exports or @rt or @rt = {}

describe 'ReflectiveSurface', ->
	position = null
	reflective_surface = null

	beforeEach ->
		position = new rt.Vector3D( 2.0, 3.0, 4.0 )
		reflective_surface = new rt.ReflectiveSurface()

		return
	
	it 'is an object', ->
		expect( reflective_surface instanceof rt.Object ).toBe true

	it 'is a surface', ->
		expect( reflective_surface instanceof rt.Surface ).toBe true

	it 'can be validated', ->
		valid_reflective_surface = reflective_surface.IsValid()

		expect( valid_reflective_surface ).toBe true

	it 'has a roughness', ->
		expect( reflective_surface.roughness ).toBe 250

	it 'can reflect', ->
		reflection = reflective_surface.Reflect( position )

		expect( reflection ).toBe 0.7

	it 'has a diffuse reflection', ->
		diffuse_reflection = reflective_surface.Diffuse( position )

		expect( diffuse_reflection.red ).toBe 1.0
		expect( diffuse_reflection.green ).toBe 1.0
		expect( diffuse_reflection.blue ).toBe 1.0

	it 'has a specular reflection', ->
		specular_reflection = reflective_surface.Specular( position )

		expect( specular_reflection.red ).toBe 0.5
		expect( specular_reflection.green ).toBe 0.5
		expect( specular_reflection.blue ).toBe 0.5