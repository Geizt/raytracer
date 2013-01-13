rt: exports? and exports or @rt or @rt = {}

describe 'Surface', ->
	surface = null

	beforeEach ->
		surface = new rt.Surface()

		return
	
	it 'is an object', ->
		expect( surface instanceof rt.Object ).toBe true

	it 'is an interface', ->
		expect( typeof surface.roughness ).toBe "number"
		expect( surface.roughness ).toEqual 0

		expect( typeof surface.IsValid ).toBe "function"
		expect( surface.IsValid() ).toBe false

		expect( typeof surface.Diffuse ).toBe "function"
		expect( surface.Diffuse() ).toBeNull()

		expect( typeof surface.Specular ).toBe "function"
		expect( surface.Specular() ).toBeNull()

		expect( typeof surface.Reflect ).toBe "function"
		expect( surface.Reflect() ).toBeNull()