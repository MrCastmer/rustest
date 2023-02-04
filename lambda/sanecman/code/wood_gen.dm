/obj/item/circuitboard/machine/pacman/wood
	name = "поративный генератор внутренего сгорания (Оборудование)"
	icon = 'lambda/sanecman/icons/obj/module.dmi'
	icon_state = "yellow_card"
	build_path = /obj/machinery/power/port_gen/pacman/wood

/obj/machinery/power/port_gen/pacman/wood
	icon = 'lambda/sanecman/icons/obj/wood_engine.dmi'
	name = "портативный генератор внутреннего сгорания"
	desc = "Поративный генератор сжигающий дерево и превращающий его в энергию."
	icon_state = "icg1"
	base_icon = "icg"
	circuit = /obj/item/circuitboard/machine/pacman/wood
	sheet_path = /obj/item/stack/sheet/mineral/wood
	power_gen = 2000
	max_sheets = 1000
	time_per_sheet = 300

/obj/machinery/power/port_gen/pacman/wood/overheat()
	. =..()
	explosion(src.loc, 0, 1, 0, -1)
