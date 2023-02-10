/obj/structure/alien/weeds/xen
	name = "трава Зена"
	desc = "Похожа на виноградную лозу."
	color = "#ac3b06"

/obj/structure/spacevine/xen
	name = "лоза Зена"
	color = "#ac3b06"

/obj/structure/spacevine/xen/Initialize(mapload)
	. = ..()
	add_atom_colour("#ac3b06", FIXED_COLOUR_PRIORITY)

/obj/structure/spacevine/xen/thick
	name = "толстая органическая лоза Зена"
	color = "#ac3b06"
	opacity = TRUE

/obj/structure/mineral_door/xen
	name = "органическая дверь Зена"
	color = "#ff8d58"
	icon = 'lambda/sanecman/icons/black_mesa/xen_door.dmi'
	icon_state = "resin"
	openSound = 'lambda/sanecman/sound/black_mesa/xen_door.ogg'
	closeSound = 'lambda/sanecman/sound/black_mesa/xen_door.ogg'

/obj/machinery/door/keycard/xen
	name = "герметичая органическая дверь Зена"
	desc = "На удивление прочная, органично выглядящая дверь."
	icon = 'lambda/sanecman/icons/black_mesa/xen_door.dmi'
	icon_state = "resin"
	puzzle_id = "xen"

/obj/item/keycard/xen
	name = "органический ключ Зена"
	desc = "Открывает что-то явно органическое."
	color = "#ac3b06"
	puzzle_id = "xen"

/obj/structure/marker_beacon/green
	picked_color = "Lime"
	// set icon_state to make it clear for mappers
	icon_state = "markerlime-on"

/obj/structure/pod
	name = "supply pod"
	desc = "Someone must have sent this a long way."
	icon = 'lambda/sanecman/icons/black_mesa/structures.dmi'
	icon_state = "pod"
	pixel_x = -16
	anchored = TRUE

