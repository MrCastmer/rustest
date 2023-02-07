// Ветка изучений РнД
/datum/techweb_node/triglavian
	id = "triglavian"
	display_name = "Технологии Триглава"
	description = "Не изученные до конца новые технологии Триглава."
	prereq_ids = list("biotech","engineering")
	boost_item_paths = list(/obj/item/stack/sheet/mineral/triglavian)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 50000)
	export_price = 200000
	hidden = TRUE
	design_ids = list("triglavianalloy")

// То что можно сделать в протолате и импринтере
/datum/design/triglavianalloy
	name = "сплав триглава"
	desc = "Очень крепкий сплав разработанный Триглавом во время Разрыва."
	id = "triglavianalloy"
	build_type = PROTOLATHE | SMELTER
	materials = list(/datum/material/iron = 1000, /datum/material/diamond = 10000)
	build_path = /obj/item/stack/sheet/mineral/triglavian
	category = list("Stock Parts","Imported")

/*
 * Триглавский сплав
 */
/obj/item/stack/sheet/mineral/triglavian
	name = "кусок сплава"
	icon = 'icons/obj/abductor.dmi'
	icon_state = "sheet-abductor"
	item_state = "sheet-abductor"
	singular_name = "кусок сплава"
	sheettype = "abductor"
	merge_type = /obj/item/stack/sheet/mineral/triglavian

GLOBAL_LIST_INIT(triglavian_recipes, list ( \
	new/datum/stack_recipe("alien bed", /obj/structure/bed/abductor, 2, one_per_turf = 1, on_floor = 1), \
	new/datum/stack_recipe("alien locker", /obj/structure/closet/abductor, 2, time = 15, one_per_turf = 1, on_floor = 1), \
	new/datum/stack_recipe("alien table frame", /obj/structure/table_frame/abductor, 1, time = 15, one_per_turf = 1, on_floor = 1), \
	new/datum/stack_recipe("alien airlock assembly", /obj/structure/door_assembly/door_assembly_abductor, 4, time = 20, one_per_turf = 1, on_floor = 1), \
	null, \
	new/datum/stack_recipe("alien floor tile", /obj/item/stack/tile/mineral/abductor, 1, 4, 20), \
	))

/obj/item/stack/sheet/mineral/triglavian/get_main_recipes()
	. = ..()
	. += GLOB.triglavian_recipes

/turf/closed/wall/mineral/triglavian
	name = "стена из странного сплава"
	desc = "Стена которая похожа на металическую, но в ней есть что-то... странное."
	icon = 'lambda/sanecman/icons/turf/walls/triglavian_wall.dmi'
	icon_state = "triglavian_wall-0"
	base_icon_state = "triglavian_wall"
	sheet_type = /obj/item/stack/sheet/mineral/triglavian
	slicing_duration = 1000   // триглавская стена требует в 10 раз дольше времени разрезания
	explosion_block = 10 // Защищает от взрыва
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS
	smoothing_groups = list(SMOOTH_GROUP_CLOSED_TURFS, SMOOTH_GROUP_WALLS, SMOOTH_GROUP_TRIGLAVIAN_WALLS)
	canSmoothWith = list(SMOOTH_GROUP_TRIGLAVIAN_WALLS)
