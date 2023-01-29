///Returns the src and all recursive contents as a list.
/atom/proc/get_all_contents(ignore_flag_1)
	. = list(src)
	var/i = 0
	while(i < length(.))
		var/atom/checked_atom = .[++i]
		if(checked_atom.flags_1 & ignore_flag_1)
			continue
		. += checked_atom.contents

///identical to get_all_contents but returns a list of atoms of the type passed in the argument.
/atom/proc/get_all_contents_type(type)
	var/list/processing_list = list(src)
	. = list()
	while(length(processing_list))
		var/atom/checked_atom = processing_list[1]
		processing_list.Cut(1, 2)
		processing_list += checked_atom.contents
		if(istype(checked_atom, type))
			. += checked_atom

///Like get_all_contents_type, but uses a typecache list as argument
/atom/proc/get_all_contents_ignoring(list/ignore_typecache)
	if(!length(ignore_typecache))
		return get_all_contents()
	var/list/processing = list(src)
	. = list()
	var/i = 0
	while(i < length(processing))
		var/atom/checked_atom = processing[++i]
		if(ignore_typecache[checked_atom.type])
			continue
		processing += checked_atom.contents
		. += checked_atom

/**
 * Finds the distance between two atoms, in pixels
 * centered = FALSE counts from turf edge to edge
 * centered = TRUE counts from turf center to turf center
 * of course mathematically this is just adding world.icon_size on again
**/
/proc/get_pixel_distance(atom/start, atom/end, centered = TRUE)
	if(!istype(start) || !istype(end))
		return 0
	. = bounds_dist(start, end) + sqrt((((start.pixel_x + end.pixel_x) ** 2) + ((start.pixel_y + end.pixel_y) ** 2)))
	if(centered)
		. += world.icon_size

/**
 * Check if there is already a wall item on the turf loc
 * floor_loc = floor tile in front of the wall
 * dir_toward_wall = direction from the floor tile in front of the wall towards the wall
 * check_external = truthy if we should be checking against items coming out of the wall, rather than visually on top of the wall.
**/
/proc/check_wall_item(floor_loc, dir_toward_wall, check_external = 0)
	var/wall_loc = get_step(floor_loc, dir_toward_wall)
	for(var/obj/checked_object in floor_loc)
		if(is_type_in_typecache(checked_object, GLOB.WALLITEMS_INTERIOR) && !check_external)
			//Direction works sometimes
			if(checked_object.dir == dir_toward_wall)
				return TRUE

			//Some stuff doesn't use dir properly, so we need to check pixel instead
			//That's exactly what get_turf_pixel() does
			if(get_turf_pixel(checked_object) == wall_loc)
				return TRUE

		if(is_type_in_typecache(checked_object, GLOB.WALLITEMS_EXTERIOR) && check_external)
			if(checked_object.dir == dir_toward_wall)
				return TRUE

	//Some stuff is placed directly on the wallturf (signs).
	//If we're only checking for external entities, we don't need to look though these.
	if (check_external)
		return FALSE
	for(var/obj/checked_object in wall_loc)
		if(is_type_in_typecache(checked_object, GLOB.WALLITEMS_INTERIOR))
			if(checked_object.pixel_x == 0 && checked_object.pixel_y == 0)
				return TRUE
	return FALSE

/**
 * Compare source's dir, the clockwise dir of source and the anticlockwise dir of source
 * To the opposite dir of the dir returned by get_dir(target,source)
 * If one of them is a match, then source is facing target
**/
/proc/is_source_facing_target(atom/source,atom/target)
	if(!istype(source) || !istype(target))
		return FALSE
	if(isliving(source))
		var/mob/living/source_mob = source
		if(source_mob.body_position == LYING_DOWN)
			return FALSE
	var/goal_dir = get_dir(source, target)
	var/clockwise_source_dir = turn(source.dir, -45)
	var/anticlockwise_source_dir = turn(source.dir, 45)

	if(source.dir == goal_dir || clockwise_source_dir == goal_dir || anticlockwise_source_dir == goal_dir)
		return TRUE
	return FALSE

/proc/view_or_range(distance = world.view , center = usr , type)
	switch(type)
		if("view")
			. = view(distance,center)
		if("range")
			. = range(distance,center)
	return
