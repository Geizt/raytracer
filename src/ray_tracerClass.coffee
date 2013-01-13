# Create a namespace to export public methods
rt: exports? and exports or @rt or @rt = {}

class rt.RayTracer
	constructor: ( max_depth ) ->
		if max_depth? and not rt.MathLibrary.IsValid( max_depth )
			throw new TypeError
		else
			@max_depth =  max_depth ? 0

	@Intersections: ( ray, scene ) ->
		if ray? and scene? 
			if not ray.IsValid?() or not scene.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		closest = +Infinity
		closest_intersection = null

		for scene_object in scene.objects
			intersection = scene_object.intersect( ray )

			if intersection? and intersection.distance < closest
				closest_intersection = intersection
				closest = intersection.distance

		return closest_intersection

	@getRayDistance: ( ray, scene ) ->
		if ray? and scene? 
			if not ray.IsValid?() or not scene.IsValid?()
				throw new TypeError
		else
			throw new TypeError

		intersection = @Intersections( ray, scene )

		if intersection?
			return intersection.distance
		else
			return +Infinity

	@TraceRay: ( ray, scene, depth ) ->
		if ray? and scene? and depth?
			if not ray.IsValid?() or not scene.IsValid?() or not rt.MathLibrary.IsValid( depth )
				throw new TypeError
		else
			throw new TypeError

		intersection = @Intersections( ray, scene )

		if intersection?
			return @Shade( intersection, scene, depth )
		else
			return rt.RGBColors.background_color
###
  @getReflectionColor: ( intersection_object, position, normal, reflection_direction, scene, depth ) ->
    if intersection_object? and position? and normal? and reflection_direction? and scene? and depth?
      if not intersection_object.IsValid?() or not position.IsValid?() or not normal.IsValid?() or not reflection_direction.IsValid?() or not scene.IsValid?() or not rt.MathLibrary.IsValid( depth )
        throw new TypeError
    else
      throw new TypeError

    reflected_ray = new Ray( position, reflection_direction )
    reflected_ray_color = @TraceRay( reflected_ray, scene, ( depth + 1 ) )

    return reflected_ray_color.Scale( intersection_object.surface.reflect( position ) )

  @getNaturalColor: ( intersection_object, position, normal, reflection_direction, scene ) ->
    AddLight: ( previous_light, current_light ) ->
      light_vector = rt.MathLibrary.VectorSubtraction( current_light.position, position )
      light_direction = rt.MathLibrary.VectorNormalization( light_vector )

      light_ray = new rt.Ray( position, light_direction )
      light_ray_distance = @getRayDistance( current_light, scene )

      if ( light_ray_distance == Infinity ) 
        ray_in_shadow = false
      else
        ray_in_shadow = ( light_ray_distance <= light_vector.Magnitude() )

      if ( ray_in_shadow )
        return previous_value
      else
        light_color = current_light.color
        illumination = light_direction.Dot( normal )

        if ( illumination > 0 ) 
          light_color.Scale( illumination )
        else
          light_color = rt.RGBColors.default_color

        specular_color = current_light.color
        specular_light = light_direction.Dot( VectorNormalization( reflection_direction ) )

        if ( specular_light > 0 )
          specular_color.Scale( Math.pow( specular_light, intersection_object.surface.roughness ) )
        else
          specular_color = rt.RGBColors.default_color

        return previous_light.Add( light_color.Multiply( intersection_object.surface.diffuse( position ).Add( specular_color.Multiply( intersection_object.surface ) ) ) )

    return scene.lights.reduce( AddLight, rt.RGBColors.default_color )

  @Shade: ( intersection, scene, depth ) ->
		if intersection? and scene? and depth?
			if not intersection.IsValid?() or not scene.IsValid?() or not rt.MathLibrary.IsValid( depth )
				throw new TypeError
		else
			throw new TypeError

		direction = intersection_object.ray.direction
		position = rt.MathLibrary.VectorScaling( intersection_object.distance, direction ).Add( intersection.ray.origin )
		normal = intersection.object.Normal( position )
		reflection_direction = rt.MathLibrary.VectorSubtraction( direction, rt.MathLibrary.VectorScaling( normal.Dot( direction ), normal ).Scale( 2 ) )

		natural_color = new RGBColor( rt.RGBColors.background_color.red, rt.RGBColors.background_color.green, rt.RGBColors.background_color.blue )
		natural_color.Add( @getNaturalColor( intersection.object, position, normal, reflection_direction, scene ) )
		
		if ( depth >= @max_depth )
			reflected_color = rt.RGBColors.grey
		else
			reflected_color = @getReflectionColor( intersection.object, position, normal, reflection_direction, scene, depth )

  @Render: ( scene, context ) ->
    getPoint: ( x, y, camera ) ->
      scaleX: ( x ) ->
        return ( x - ( screen_width / 2.0 ) ) / 2.0 / screen_width

      scaleY: ( y ) ->
        return -( y - ( screen_height / 2.0 ) ) / 2.0 / screen_height

      return rt.MathLibrary.VectorAddition( camera.forward, rt.MathLibrary.VectorScaling( scaleX( x ), camera.right ).Add( rt.MathLibrary.VectorScaling( scaleY( y ), camera.up ) ) ).Normalize()

    setPixel: ( x, y, color ) ->
      index = ( x + y * screen_width ) * 4

      image_data[ index + 0 ] = color.red
      image_data[ index + 1 ] = color.green
      image_data[ index + 2 ] = color.blue

      # Alpha-value
      image_data[ index + 3 ] = 255

      return
    screen_width = context.canvas.width
    screen_height = context.canvas.height

    image_data = context.createImageData( screen_width, screen_height )
    image_size = image_data.width * image_data.height;

    for x in [0..screen_width]
      for y in [0..screen_height]
        setPixel( x, y, @TraceRay( new rt.Ray( scene.camera.origin, getPoint( x, y, scene.camera ) ), scene, 0 ).getDrawingColor() )

    context.putImageData( image_data, 0, 0 )

    return
###