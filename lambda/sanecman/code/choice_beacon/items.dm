/obj/item/storage/box/oreredemtionandsilo
	name = "набор машин для шахтёров"
	desc = "Содержит плату для печки и рудного бункера."
	illustration = "scicircuit"

/obj/item/storage/box/oreredemtionandsilo/PopulateContents()
	new /obj/item/circuitboard/machine/ore_redemption(src)
	new /obj/item/circuitboard/machine/ore_silo(src)
	new /obj/item/vending_refill/mining_equipment(src)

/obj/item/storage/box/spacecash_c10000
	name = "коробка с деньгами"
	desc = "Пожалуй самое бесполезное для выживания."
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

/obj/item/storage/box/cargo_selling_pad
	name = "коробка с карго платами"
	desc = "Пожалуй самое полезное для выживания."
	illustration = "spbox"

/obj/item/storage/box/cargo_selling_pad/PopulateContents()
	new /obj/item/circuitboard/machine/selling_pad(src)
	new /obj/item/circuitboard/computer/selling_pad_control(src)
	new /obj/item/circuitboard/computer/cargo/express(src)

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

/obj/item/choice_beacon/spawnshit
	name = "маяк поддержки"
	desc = "Позволяет вызвать дроппод снабжения. Может быть взломан."
	icon = 'lambda/sanecman/icons/items/emergency_signaler.dmi'
	icon_state = "em_signal"
	var/emagged = FALSE

/obj/item/circuitboard/computer/cargo/express/multitool_act(mob/user)
	to_chat(user, "<span class='danger'>Не могу взломать маяк с помощью такого инструмента, может стоит попытаться взломать чем-то нелегальным?</span>")
	return

/obj/item/choice_beacon/spawnshit/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	emagged = TRUE
	playsound(src, "sparks", 100, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
	say("Подключение к другой платформе снабжения.")
	obj_flags |= EMAGGED


/obj/item/choice_beacon/spawnshit/generate_display_names()
	var/list/templist
	var/list/templist_emag
	var/static/list/spawnshit
	if(!spawnshit)
		spawnshit = list()
	templist = list(/obj/item/storage/box/rndboards/old,
					/obj/item/storage/box/oreredemtionandsilo,
					/obj/effect/mob_spawn/drone,
					/obj/item/storage/belt/utility/chief/full,
					/obj/item/storage/firstaid/advanced,
					/obj/structure/reagent_dispensers/beerkeg,
					/obj/item/storage/box/stockparts/deluxe,
					/obj/item/storage/box/spacecash_c10000,
					/obj/item/storage/box/cargo_selling_pad,
					/obj/item/pickaxe/drill/jackhammer,
					/obj/item/storage/box/copytech,
					/obj/item/gps
					)
	templist_emag = list(/obj/item/storage/box/rndboards/old,
						/obj/item/storage/box/oreredemtionandsilo,
						/obj/effect/mob_spawn/drone/syndrone,
						/obj/item/storage/belt/utility/chief/full,
						/obj/item/storage/firstaid/tactical,
						/obj/structure/reagent_dispensers/beerkeg,
						/obj/item/storage/box/stockparts/deluxe,
						/obj/item/storage/box/spacecash_c10000,
						/obj/item/storage/box/cargo_selling_pad,
						/obj/item/pickaxe/drill/jackhammer/brigador,
						/obj/item/storage/toolbox/syndicate,
						/obj/item/gps,
						/obj/item/storage/box/copytech,
						/obj/item/uplink/emengercy
						)
	if(emagged == FALSE)
		for(var/V in templist)
			var/atom/A = V
			spawnshit[initial(A.name)] = A
	else
		for(var/V in templist_emag)
			var/atom/A = V
			spawnshit[initial(A.name)] = A
	return spawnshit
