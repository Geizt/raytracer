rt: exports? and exports or @rt or @rt = {}

describe 'Object', ->
	object = null

	beforeEach ->
		object = new rt.Object()

		return

	it 'is an interface', ->
		expect( typeof object.IsValid ).toBe "function"
		expect( object.IsValid() ).toBe false