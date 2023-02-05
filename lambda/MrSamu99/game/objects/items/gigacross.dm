/obj/item/gigacross
	name = "Святой крест"
	icon = 'lambda/icons/holy_eblo.dmi'
	icon_state = "krestik"
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BACK
	force = 10
	throwforce = 10
	block_chance = 50
	item_state = "krestik"
	//lefthand_file = 'icons/mob/inhands/equipment/mining_lefthand.dmi'
	//righthand_file = 'icons/mob/inhands/equipment/mining_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	custom_materials = list(/datum/material/gold=4000) //two sheet, but where can you make them?
	tool_behaviour = TOOL_MINING
	toolspeed = 0.5
	usesound = list('sound/effects/picaxe1.ogg', 'sound/effects/picaxe2.ogg', 'sound/effects/picaxe3.ogg')
	attack_verb = list("ударил со святой силой", "проткнул со святой", "разрубил со святой силой", "атаковал со святой силой")

/obj/item/gigacross/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=10, force_wielded=25)
