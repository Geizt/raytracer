rt: exports? and exports or @rt or @rt = {}

describe 'MathLibrary', ->
	vector_1 = null
	vector_2 = null

	beforeEach ->
		vector_1 = new rt.Vector3D( 2, 3, 4 )
		vector_2 = new rt.Vector3D( 4, 5, 6 )

		return

	it 'can clamp a scalar', ->
		scalar = 10
		lower_limit = 0
		upper_limit = 5

		low_pass = rt.MathLibrary.ClampScalar( scalar, lower_limit, upper_limit )

		expect( low_pass ).toBe 5

		scalar = 5
		lower_limit = 0
		upper_limit = 10

		pass = rt.MathLibrary.ClampScalar( scalar, lower_limit, upper_limit )

		expect( pass ).toBe 5

		scalar = 1
		lower_limit = 5
		upper_limit = 10

		high_pass = rt.MathLibrary.ClampScalar( scalar, lower_limit, upper_limit )

		expect( high_pass ).toBe 5

	it 'can add vectors', ->
		vector3d = rt.MathLibrary.VectorAddition( vector_1, vector_2 )

		expect( vector3d.x ).toBe 6
		expect( vector3d.y ).toBe 8
		expect( vector3d.z ).toBe 10

	it 'can subtract vectors', ->
		vector3d = rt.MathLibrary.VectorSubtraction( vector_1, vector_2 )

		expect( vector3d.x ).toBe -2
		expect( vector3d.y ).toBe -2
		expect( vector3d.z ).toBe -2

	it 'can scale a vector', ->
		vector3d = rt.MathLibrary.VectorScaling( 0.5, vector_1 )

		expect( vector3d.x ).toBe 1
		expect( vector3d.y ).toBe 1.5
		expect( vector3d.z ).toBe 2

	it 'can normalize a vector', ->
		vector3d = rt.MathLibrary.VectorNormalization( vector_1 )

		expect( vector3d.x ).toBe 0.3713906763541037
		expect( vector3d.y ).toBe 0.5570860145311556
		expect( vector3d.z ).toBe 0.7427813527082074