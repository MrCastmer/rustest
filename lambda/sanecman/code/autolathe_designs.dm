//Маяк поддержки
/datum/design/spawnshit
	name = "Маяк поддержки"
	id = "spawnshit"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 50000, /datum/material/glass = 1000, /datum/material/gold = 1000)
	build_path = /obj/item/choice_beacon/spawnshit
	category = list("initial", "Exotic")

//Дрон
/datum/design/dronespawn
	name = "Обслуживающий дрон"
	id = "dronespawn"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 1000)
	build_path = /obj/effect/mob_spawn/drone
	category = list("initial", "Exotic")
