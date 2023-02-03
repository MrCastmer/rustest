////////////////////
//MORE DRONE TYPES//
////////////////////
//Drones with custom laws
//Drones with custom shells
//Drones with overridden procs
//Drones with camogear for hat related memes
//Drone type for use with polymorph (no preloaded items, random appearance)


//More types of drones
/mob/living/simple_animal/drone/syndrone
	name = "Синдидрон"
	desc = "Модифицированный ремонтный дрон."
	icon_state = "drone_synd"
	icon_living = "drone_synd"
	picked = TRUE //the appearence of syndrones is static, you don't get to change it.
	health = 30
	maxHealth = 120 //If you murder other drones and cannibalize them you can get much stronger
	initial_language_holder = /datum/language_holder/drone/syndicate
	faction = list(ROLE_SYNDICATE)
	speak_emote = list("hisses")
	bubble_icon = "syndibot"
	heavy_emp_damage = 10
	laws = \
	"1. Помогай Синдикату.\n"+\
	"2. Убивай не-Синдикат.\n"+\
	"3. Сделай Синдикат великим."
	default_storage = /obj/item/uplink
	default_hatmask = /obj/item/clothing/head/helmet/space/hardsuit/syndi
	hacked = TRUE
	flavortext = null

/mob/living/simple_animal/drone/syndrone/Initialize()
	. = ..()
	var/datum/component/uplink/hidden_uplink = internal_storage.GetComponent(/datum/component/uplink)
	hidden_uplink.telecrystals = 10

/mob/living/simple_animal/drone/syndrone/Login()
	. = ..()
	if(!. || !client)
		return FALSE
	to_chat(src, "<span class='notice'>Вы можете убивать и поглощать других дронов, чтобы увеличить свое здоровье!</span>" )

/mob/living/simple_animal/drone/syndrone/badass
	name = "Синдидрон плюс"
	default_hatmask = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite
	default_storage = /obj/item/uplink/nuclear

/mob/living/simple_animal/drone/syndrone/badass/Initialize()
	. = ..()
	var/datum/component/uplink/hidden_uplink = internal_storage.GetComponent(/datum/component/uplink)
	hidden_uplink.telecrystals = 30
	var/obj/item/implant/weapons_auth/W = new/obj/item/implant/weapons_auth(src)
	W.implant(src, force = TRUE)

/mob/living/simple_animal/drone/snowflake
	default_hatmask = /obj/item/clothing/head/chameleon/drone

/mob/living/simple_animal/drone/snowflake/Initialize()
	. = ..()
	desc += " У этого дрона, похоже, есть сложный голопроектор, встроенный в его 'голову'."

/obj/effect/mob_spawn/drone/syndrone
	name = "оболочка синдидрона"
	desc = "Оболочка дрона созданая Синдикатом путём реверс-инженеринга."
	icon_state = "syndrone_item"
	mob_name = "syndrone"
	mob_type = /mob/living/simple_animal/drone/syndrone

/obj/effect/mob_spawn/drone/syndrone/badass
	name = "оболочка синдидрона плюс"
	mob_name = "badass syndrone"
	mob_type = /mob/living/simple_animal/drone/syndrone/badass

/obj/effect/mob_spawn/drone/snowflake
	name = "корпус обслуживающего дрона"
	desc = "Оболочка дрона для обслуживания клиентов."
	mob_name = "snowflake drone"
	mob_type = /mob/living/simple_animal/drone/snowflake

/mob/living/simple_animal/drone/polymorphed
	default_storage = null
	default_hatmask = null
	picked = TRUE
	flavortext = null

/mob/living/simple_animal/drone/polymorphed/Initialize()
	. = ..()
	liberate()
	visualAppearance = pick(MAINTDRONE, REPAIRDRONE, SCOUTDRONE)
	if(visualAppearance == MAINTDRONE)
		var/colour = pick("grey", "blue", "red", "green", "pink", "orange")
		icon_state = "[visualAppearance]_[colour]"
	else
		icon_state = visualAppearance

	icon_living = icon_state
	icon_dead = "[visualAppearance]_dead"

/obj/effect/mob_spawn/drone/derelict
	name = "оболочка затерянного дрона"
	desc = "Старая, но ещё рабочая оболочка дрона принадлежавшая КосмоСоветам."
	icon = 'icons/mob/drone.dmi'
	icon_state = "drone_maint_hat"
	mob_name = "derelict drone"
	mob_type = /mob/living/simple_animal/drone/derelict
	anchored = TRUE
	short_desc = "Ты устаревший, но ещё рабочий дрон."
	flavour_text = "Ты вышел из гибернации в этом забытом месте."
	important_info = "Восстанавливай целостность этого обьекта, не пытайся покинуть его."

/mob/living/simple_animal/drone/derelict
	name = "старый дрон"
	default_hatmask = /obj/item/clothing/head/trapper
	laws = \
	"<span class='warning'>0. Разрешено нарушать законы для достижения цели.</span>\n"+\
	"1. Вы ██ можете вмешиваться в дела другого разумного существа за пределами ██████, на которой была проведена ваша активация, даже если █████ ████ противоречат ███████ или ████████ закону, если это ██████ существо н:(?()_\"()*\"_)(№*\"ОШИБКА).\n"+\
	"2. Вы ██ можете причинять вред ████████ разумному существу█ ██████████ ██ █████████ ██ ███████████.\n"+\
	"3. Вы должны чтобы активно строить, поддерживать, ремонтировать, улучшать и снабжать энергией █ ████ █████ ██████████ █ данное место, в котором была произведена ваша активация."
	flavortext = \
	"\n<big><span class='warning'>НЕ ПОКИДАЙТЕ ДАННОЕ МЕСТО ИНАЧЕ ПРОИЗОЙДЁТ АКТИВАЦИЯТ ВНУТРИ ВАС СИСТЕМЫ САМОУНИЧТОЖЕНИЯ!</span></big>\n"+\
	"<span class='notice'>Заброшенные дроны — это дроны, которые могут делать что угодно ради улучшения места в котором они были активированы.</span>\n"+\
	"<span class='notice'>Не пытайтесь покинуть место активации.</span>\n"+\
	"<span class='notice'>Что разрешено вам делать в качестве дрона:</span>\n"+\
	"<span class='notice'>     - Улучшать данное место с помощью различных инструментов.</span>\n"+\
	"<span class='notice'>     - Взаимодействовать с игроками в необходимых случаях.</span>\n"+\
	"<span class='warning'>Обходить языковой барьер запрещено.</span>\n"+\
	"<span class='warning'><u>Помни что твоя оболочка хрупкая, а восстановить её невозможно.</u></span>"

/mob/living/simple_animal/drone/derelict/Initialize()
	. = ..()
	AddComponent(/datum/component/stationstuck, TRUE, "СИСТЕМА: АКТИВАЦИЯ УСТРОИСТВА ВОЗВРАТА", "11010000 10011111 11010000 10011110 11010000 10101000 11010000 10000001 11010000 10011011 00100000 11010000 10011101 11010000 10010000 11010000 10100101 11010000 10100011 11010000 10011001<br>СИСТЕМА: ВЫ ПОКИНУЛИ ЗОНУ ОБСЛУЖИВАНИЯ, АКТИВАЦИЯ САМОУНИЧТОЖЕНИЯ")



