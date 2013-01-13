rt: exports? and exports or @rt or @rt = {}

describe 'RGBColor', ->
	rgb_color = null

	beforeEach ->
		rgb_color = new rt.RGBColor( 0.1, 0.3, 0.8 )

		return

	it 'is an object', ->
		expect( rgb_color instanceof rt.Object ).toBe true

	it 'can be initialized', ->
		expect( rgb_color.red ).toBe 0.1
		expect( rgb_color.green ).toBe 0.3
		expect( rgb_color.blue ).toBe 0.8

	it 'can be validated', ->
		valid_rgb_color = rgb_color.IsValid()

		expect( valid_rgb_color ).toBe true

	it 'can be added', ->
		rgb_color.Add( new rt.RGBColor( 0.4, 0.5, 0.6 ) )

		expect( rgb_color.red ).toBe 0.5
		expect( rgb_color.green ).toBe 0.8
		expect( rgb_color.blue ).toBe 1.0

	it 'can be scaled by a scalar', ->
		rgb_color.Scale( 2 )

		expect( rgb_color.red ).toBe 0.2
		expect( rgb_color.green ).toBe 0.6
		expect( rgb_color.blue ).toBe 1.0

	it 'can be multiplied', ->
		rgb_color.Multiply( new rt.RGBColor( 0.2, 0.5, 0.9 ) )

		expect( rgb_color.red ).toBe 0.020000000000000004
		expect( rgb_color.green ).toBe 0.15
		expect( rgb_color.blue ).toBe 0.7200000000000001

	it 'can calculate discrete RGB values', ->
		discrete_rgb_color = rgb_color.getDrawingColor()

		expect( discrete_rgb_color.red ).toBe 25
		expect( discrete_rgb_color.green ).toBe 76
		expect( discrete_rgb_color.blue ).toBe 204

describe 'RGBColors', ->
	it 'has the color white', ->
		expect( rt.RGBColors.white.red ).toBe 1.0
		expect( rt.RGBColors.white.green ).toBe 1.0
		expect( rt.RGBColors.white.blue ).toBe 1.0

	it 'has the color grey', ->
		expect( rt.RGBColors.grey.red ).toBe 0.5
		expect( rt.RGBColors.grey.green ).toBe 0.5
		expect( rt.RGBColors.grey.blue ).toBe 0.5

	it 'has the color black', ->
		expect( rt.RGBColors.black.red ).toBe 0.0
		expect( rt.RGBColors.black.green ).toBe 0.0
		expect( rt.RGBColors.black.blue ).toBe 0.0

	it 'has a background color', ->
		expect( rt.RGBColors.background_color.red ).toBe 0.0
		expect( rt.RGBColors.background_color.green ).toBe 0.0
		expect( rt.RGBColors.background_color.blue ).toBe 0.0

	it 'has a default color', ->
		expect( rt.RGBColors.default_color.red ).toBe 0.0
		expect( rt.RGBColors.default_color.green ).toBe 0.0
		expect( rt.RGBColors.default_color.blue ).toBe 0.0