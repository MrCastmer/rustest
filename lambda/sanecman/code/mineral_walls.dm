/turf/closed/wall/mineral/triglavian
	name = "стена из странного сплава"
	desc = "Стена которая похожа на металическую, но в ней есть что-то... странное."
	icon = 'lambda/sanecman/icons/turf/walls/triglavian_wall.dmi'
	icon_state = "triglavian_wall-0"
	base_icon_state = "triglavian_wall"
	sheet_type = /obj/item/stack/sheet/mineral/abductor
	slicing_duration = 200   //alien wall takes twice as much time to slice
	explosion_block = 3
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS
	smoothing_groups = list(SMOOTH_GROUP_CLOSED_TURFS, SMOOTH_GROUP_WALLS, SMOOTH_GROUP_TRIGLAVIAN_WALLS)
	canSmoothWith = list(SMOOTH_GROUP_TRIGLAVIAN_WALLS)
