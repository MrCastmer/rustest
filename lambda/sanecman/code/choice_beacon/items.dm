/obj/item/storage/box/oreredemtionandsilo
	name = "набор карго плат"
	desc = "Содержит платы для создания собственной Каргонии."
	illustration = "scicircuit"

/obj/item/storage/box/oreredemtionandsilo/PopulateContents()
	new /obj/item/circuitboard/machine/ore_redemption(src)
	new /obj/item/circuitboard/machine/ore_silo(src)
	new /obj/item/vending_refill/mining_equipment(src)
	new /obj/item/circuitboard/machine/selling_pad(src)
	new /obj/item/circuitboard/computer/selling_pad_control(src)
	new /obj/item/circuitboard/computer/cargo/express(src)
	new /obj/item/circuitboard/machine/autolathe(src)
	new /obj/item/stock_parts/matter_bin(src)
	new /obj/item/stock_parts/matter_bin(src)
	new /obj/item/stock_parts/matter_bin(src)
	new /obj/item/stock_parts/manipulator(src)
	new /obj/item/stock_parts/subspace/amplifier(src)
	new /obj/item/stock_parts/subspace/amplifier(src)
	new /obj/item/stock_parts/subspace/transmitter(src)
	new /obj/item/stock_parts/subspace/transmitter(src)
	new /obj/item/stock_parts/subspace/crystal(src)

/obj/item/storage/box/spacecash_c10000
	name = "коробка с деньгами"
	desc = "Коробка. С деньгами."
	illustration = "spbox"

/obj/item/storage/box/spacecash_c10000/PopulateContents()
	new /obj/item/stack/spacecash/c1000(src)
	new /obj/item/stack/spacecash/c1000(src)
	new /obj/item/stack/spacecash/c1000(src)
	new /obj/item/stack/spacecash/c1000(src)
	new /obj/item/stack/spacecash/c1000(src)
	new /obj/item/stack/spacecash/c1000(src)
	new /obj/item/stack/spacecash/c1000(src)
	new /obj/item/stack/spacecash/c1000(src)
	new /obj/item/stack/spacecash/c1000(src)
	new /obj/item/stack/spacecash/c1000(src)
	
/obj/item/storage/box/tacmaid
	name = "коробка с униформой Эскадрона Смерти"
	desc = "Коробка. С формой. Не спрашивайте откуда и зачем."
	illustration = "spbox"

/obj/item/storage/box/tacmaid/PopulateContents()
	new /obj/item/clothing/under/syndicate/skirt/maid(src)
	new /obj/item/clothing/head/maidheadband/syndicate(src)
	new /obj/item/clothing/gloves/combat/maid(src)
	new /obj/item/clothing/shoes/combat/swat(src)

/obj/item/uplink/emengercy
	name = "экстренный аплинк"
	desc = "Используется для соединения с дальним маяком поддержки Синдиката."
	icon = 'lambda/sanecman/icons/items/uplink.dmi'
	icon_state = "emergency"

/obj/item/uplink/emengercy/Initialize(mapload, owner, tc_amount = 5)
	. = ..()
	var/datum/component/uplink/hidden_uplink = GetComponent(/datum/component/uplink)
	hidden_uplink.name = "экстренный аплинк"

	AddComponent(/datum/component/uplink, owner, FALSE, TRUE, null, tc_amount)

/obj/item/storage/box/copytech
	name = "платы копировальных машин"
	desc = "Содержит платы для сканирования и копирования предметов."
	illustration = "scicircuit"

/obj/item/storage/box/copytech/PopulateContents()
	new /obj/item/circuitboard/machine/copytech(src)
	new /obj/item/circuitboard/machine/copytech_platform(src)

/obj/item/choice_beacon/support_beacon
	name = "маяк поддержки"
	desc = "Позволяет вызвать дроппод снабжения. Может быть взломан."
	icon = 'lambda/sanecman/icons/items/emergency_signaler.dmi'
	icon_state = "em_signal"
	var/emagged = FALSE
	var/list/templist
	var/list/templist_emag
	var/static/list/spawnshit
	var/static/list/spawnshit_emag


/obj/item/choice_beacon/support_beacon/multitool_act(mob/user)
	to_chat(user, "<span class='danger'>Не могу взломать маяк с помощью такого инструмента, может стоит попытаться взломать чем-то нелегальным?</span>")
	return

/obj/item/choice_beacon/support_beacon/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	emagged = TRUE
	playsound(src, "sparks", 100, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
	say("Подключение к другой платформе снабжения.")
	obj_flags |= EMAGGED
	spawnshit = list()
	spawnshit_emag = list()

/obj/item/choice_beacon/support_beacon/generate_display_names()
	if(!spawnshit)
		spawnshit = list()
	if(!spawnshit_emag)
		spawnshit_emag = list()

	templist = list(/obj/item/choice_beacon/rnd,
				/obj/item/storage/box/oreredemtionandsilo,
				/obj/item/choice_beacon/augments,
				/obj/item/storage/belt/utility/chief/full,
				/obj/item/storage/firstaid/advanced,
				/obj/structure/reagent_dispensers/beerkeg,
				/obj/item/storage/part_replacer/bluespace/tier2,
				/obj/structure/punching_bag/trade,
				/obj/item/pickaxe/drill/jackhammer,
				/obj/item/storage/box/copytech,
				/obj/item/gps
					)
	templist_emag = list(/obj/item/storage/box/rndboards/old,
					/obj/item/storage/box/oreredemtionandsilo,
					/obj/item/choice_beacon/augments,
					/obj/effect/mob_spawn/drone/syndrone,
					/obj/item/storage/belt/utility/chief/full,
					/obj/item/storage/firstaid/tactical,
					/obj/structure/reagent_dispensers/beerkeg,
					/obj/item/storage/part_replacer/bluespace/tier4,
					/obj/structure/punching_bag/trade,
					/obj/item/pickaxe/drill/jackhammer/brigador,
					/obj/item/storage/toolbox/syndicate,
					/obj/item/gps,
					/obj/item/storage/box/copytech,
					/obj/item/storage/box/tacmaid,
					/obj/item/uplink/emengercy
						)
	if(src.emagged == FALSE)
		for(var/V in templist)
			var/atom/A = V
			spawnshit[initial(A.name)] = A
		return spawnshit
	else
		for(var/Z in templist_emag)
			var/atom/B = Z
			spawnshit_emag[initial(B.name)] = B
		return spawnshit_emag
