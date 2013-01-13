rt: exports? and exports or @rt or @rt = {}

describe 'Vector3D', ->
	vector3d = null

	beforeEach ->
		vector3d = new rt.Vector3D( 2, 3, 4 )

		return

	it 'is an object', ->
		expect( vector3d instanceof rt.Object ).toBe true

	it 'can be initialized', ->
		expect( vector3d.x ).toBe 2
		expect( vector3d.y ).toBe 3
		expect( vector3d.z ).toBe 4

	it 'can be validated', ->
		valid_vector3d = vector3d.IsValid()

		expect( valid_vector3d ).toBe true

	it 'can be re-set', ->
		vector3d.Set( 3, 5, 7 )

		expect( vector3d.x ).toBe 3
		expect( vector3d.y ).toBe 5
		expect( vector3d.z ).toBe 7
	
	it 'can be negative', ->
		neg_vector3d = vector3d.Negative()

		expect( neg_vector3d.x ).toBe -2
		expect( neg_vector3d.y ).toBe -3
		expect( neg_vector3d.z ).toBe -4

	it 'can be copied', ->
		copy_vector3d = vector3d.Copy()

		expect( copy_vector3d.x ).toBe 2
		expect( copy_vector3d.y ).toBe 3
		expect( copy_vector3d.z ).toBe 4

	it 'can be added', ->
		vector3d.Add( new rt.Vector3D( 1, 2, 3 ) )

		expect( vector3d.x ).toBe 3
		expect( vector3d.y ).toBe 5
		expect( vector3d.z ).toBe 7

	it 'can be subtracted', ->
		vector3d.Subtract( new rt.Vector3D( 1, 2, 3 ) )

		expect( vector3d.x ).toBe 1
		expect( vector3d.y ).toBe 1
		expect( vector3d.z ).toBe 1

	it 'can be scaled by a scalar', ->
		vector3d.Scale( 3 )

		expect( vector3d.x ).toBe 6
		expect( vector3d.y ).toBe 9
		expect( vector3d.z ).toBe 12

	it 'can be normalized', ->
		magnitude = vector3d.Normalize().Magnitude()

		expect( magnitude ).toBe 1

	it 'can calculate the dot product', ->
		dot_product = vector3d.Dot( new rt.Vector3D( 4, 5, 6 ) )

		expect( dot_product ).toBe 47

	it 'can calculate the cross product', ->
		cross_product = vector3d.Cross( new rt.Vector3D( 4, 5, 6 ) )

		expect( cross_product.x ).toBe -2
		expect( cross_product.y ).toBe 4
		expect( cross_product.z ).toBe -2