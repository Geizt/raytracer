rt: exports? and exports or @rt or @rt = {}

describe 'GeometricObject', ->
	geometric_object = null

	beforeEach ->
		geometric_object = new rt.GeometricObject()

		return
	
	it 'is an object', ->
		expect( geometric_object instanceof rt.Object ).toBe true

	it 'is an interface', ->
		expect( typeof geometric_object.IsValid ).toBe "function"
		expect( geometric_object.IsValid() ).toBe false

		expect( typeof geometric_object.Normal ).toBe "function"
		expect( geometric_object.Normal() ).toBeNull()

		expect( typeof geometric_object.Intersect ).toBe "function"
		expect( geometric_object.Intersect() ).toBeNull()