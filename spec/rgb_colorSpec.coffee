rt: exports? and exports or @rt or @rt = {}

describe 'RGBColor', ->
	rgb_color = null

	beforeEach ->
		rgb_color = new rt.RGBColor( 0.1, 0.3, 0.8 )

		return

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

describe 'RGBStaticColors', ->
	it 'has the color white', ->
		expect( rt.RGBStaticColors.white.red ).toBe 1.0
		expect( rt.RGBStaticColors.white.green ).toBe 1.0
		expect( rt.RGBStaticColors.white.blue ).toBe 1.0

	it 'has the color grey', ->
		expect( rt.RGBStaticColors.grey.red ).toBe 0.5
		expect( rt.RGBStaticColors.grey.green ).toBe 0.5
		expect( rt.RGBStaticColors.grey.blue ).toBe 0.5

	it 'has the color black', ->
		expect( rt.RGBStaticColors.black.red ).toBe 0.0
		expect( rt.RGBStaticColors.black.green ).toBe 0.0
		expect( rt.RGBStaticColors.black.blue ).toBe 0.0

	it 'has a background color', ->
		expect( rt.RGBStaticColors.background.red ).toBe 0.0
		expect( rt.RGBStaticColors.background.green ).toBe 0.0
		expect( rt.RGBStaticColors.background.blue ).toBe 0.0

	it 'has a default color', ->
		expect( rt.RGBStaticColors.default.red ).toBe 0.0
		expect( rt.RGBStaticColors.default.green ).toBe 0.0
		expect( rt.RGBStaticColors.default.blue ).toBe 0.0