rt: exports? and exports or @rt or @rt = {}

describe 'RayTracer', ->
	sphere = null
	plane = null
	relective_surface = null
	checkerboard_surface = null
	camera = null
	scene = null
	ray_tracer = null

	beforeEach ->
		ray_tracer = new rt.RayTracer( 5 )

		return

