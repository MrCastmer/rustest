///Has no special properties.
/datum/material/iron
	name = "железо"
	skloname = "железа"
	id = "iron"
	desc = "Распространённый металл во всей вселенной."
	color = "#878687"
	categories = list(MAT_CATEGORY_ORE = TRUE, MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = TRUE)
	sheet_type = /obj/item/stack/sheet/metal
	ore_type = /obj/item/stack/ore/iron
	value_per_unit = 0.0025

///Breaks extremely easily but is transparent.
/datum/material/glass
	name = "стекло"
	skloname = "стекла"
	id = "glass"
	desc = "Переплавленный специальным методом стекло."
	color = "#88cdf1"
	alpha = 150
	categories = list(MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = TRUE)
	integrity_modifier = 0.1
	sheet_type = /obj/item/stack/sheet/glass
	ore_type = /obj/item/stack/ore/glass
	value_per_unit = 0.0025
	beauty_modifier = 0.05
	armor_modifiers = list("melee" = 0.2, "bullet" = 0.2, "laser" = 0, "energy" = 1, "bomb" = 0, "bio" = 0.2, "rad" = 0.2, "fire" = 1, "acid" = 0.2)

/*
Color matrices are like regular colors but unlike with normal colors, you can go over 255 on a channel.
Unless you know what you're doing, only use the first three numbers. They're in RGB order.
*/

///Has no special properties. Could be good against vampires in the future perhaps.
/datum/material/silver
	name = "серебро"
	skloname = "серебра"
	id = "silver"
	desc = "Используется для создания электроники и операционных столов."
	color = "#ffffff"
	categories = list(MAT_CATEGORY_ORE = TRUE, MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = TRUE)
	sheet_type = /obj/item/stack/sheet/mineral/silver
	ore_type = /obj/item/stack/ore/silver
	value_per_unit = 0.025
	beauty_modifier = 0.075

///Slight force increase
/datum/material/gold
	name = "золото"
	skloname = "золота"
	id = "gold"
	desc = "В прошлом его было очень мало а сейчас его используют в продвинутой электронике."
	color = "#fff032" //gold is shiny, but not as bright as bananium
	strength_modifier = 1.2
	categories = list(MAT_CATEGORY_ORE = TRUE, MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = TRUE)
	sheet_type = /obj/item/stack/sheet/mineral/gold
	ore_type = /obj/item/stack/ore/gold
	value_per_unit = 0.0625
	beauty_modifier = 0.15
	armor_modifiers = list("melee" = 1.1, "bullet" = 1.1, "laser" = 1.15, "energy" = 1.15, "bomb" = 1, "bio" = 1, "rad" = 1, "fire" = 0.7, "acid" = 1.1)

///Has no special properties
/datum/material/diamond
	name = "алмаз"
	skloname = "алмазов"
	id = "diamond"
	desc = "Образуется естественным путём при сильном давлении."
	color = "#30ffff"
	categories = list(MAT_CATEGORY_ORE = TRUE, MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = TRUE)
	sheet_type = /obj/item/stack/sheet/mineral/diamond
	ore_type = /obj/item/stack/ore/diamond
	alpha = 132
	value_per_unit = 0.25
	beauty_modifier = 0.3
	armor_modifiers = list("melee" = 1.3, "bullet" = 1.3, "laser" = 0.6, "energy" = 1, "bomb" = 1.2, "bio" = 1, "rad" = 1, "fire" = 1, "acid" = 1)

///Is slightly radioactive
/datum/material/uranium
	name = "уран"
	skloname = "урана"
	id = "uranium"
	desc = "Радиоактивен и в умелых руках может вырабатывать много электроэнергии."
	color = "#30ed1a"
	categories = list(MAT_CATEGORY_ORE = TRUE, MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = TRUE)
	sheet_type = /obj/item/stack/sheet/mineral/uranium
	ore_type = /obj/item/stack/ore/uranium
	value_per_unit = 0.05
	beauty_modifier = 0.3 //It shines so beautiful
	armor_modifiers = list("melee" = 1.5, "bullet" = 1.4, "laser" = 0.5, "energy" = 0.5, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 1, "acid" = 1)

/datum/material/uranium/on_applied(atom/source, amount, material_flags)
	. = ..()
	source.AddComponent(/datum/component/radioactive, amount / 20, source, 0) //half-life of 0 because we keep on going.

/datum/material/uranium/on_removed(atom/source, material_flags)
	. = ..()
	qdel(source.GetComponent(/datum/component/radioactive))

///Adds firestacks on hit (Still needs support to turn into gas on destruction)
/datum/material/plasma
	name = "плазма"
	skloname = "плазмы"
	id = "plasma"
	desc = "Твёрдая горючая плазма."
	color = "#ff2eff"
	categories = list(MAT_CATEGORY_ORE = TRUE, MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = TRUE)
	sheet_type = /obj/item/stack/sheet/mineral/plasma
	ore_type = /obj/item/stack/ore/plasma
	value_per_unit = 0.1
	beauty_modifier = 0.15
	armor_modifiers = list("melee" = 1.4, "bullet" = 0.7, "laser" = 0, "energy" = 1.2, "bomb" = 0, "bio" = 1.2, "rad" = 1, "fire" = 0, "acid" = 0.5)

/datum/material/plasma/on_applied(atom/source, amount, material_flags)
	. = ..()
	if(ismovable(source))
		source.AddElement(/datum/element/firestacker, amount=1)
		source.AddComponent(/datum/component/explodable, 0, 0, amount / 2500, amount / 1250)

/datum/material/plasma/on_removed(atom/source, material_flags)
	. = ..()
	source.RemoveElement(/datum/element/firestacker, amount=1)
	qdel(source.GetComponent(/datum/component/explodable))

///Can cause bluespace effects on use. (Teleportation) (Not yet implemented)
/datum/material/bluespace
	name = "синий кристалл"
	skloname = "синего кристалла"
	id = "bluespace_crystal"
	desc = "В прошлом его считали магическим камнем, сейчас же его используют в телепортационном оборудовании."
	color = "#4086e2"
	alpha = 200
	categories = list(MAT_CATEGORY_ORE = TRUE)
	beauty_modifier = 0.5
	sheet_type = /obj/item/stack/sheet/bluespace_crystal
	ore_type = /obj/item/stack/ore/bluespace_crystal
	value_per_unit = 0.15

///Honks and slips
/datum/material/bananium
	name = "бананиум"
	skloname = "банания"
	id = "bananium"
	desc = "Материал с огромным потенциалом."
	color = "#ffff00" //obnoxiously bright yellow
	categories = list(MAT_CATEGORY_ORE = TRUE, MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = TRUE)
	sheet_type = /obj/item/stack/sheet/mineral/bananium
	ore_type = /obj/item/stack/ore/bananium
	value_per_unit = 0.5
	beauty_modifier = 0.5
	armor_modifiers = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 100, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0) //Clowns cant be blown away.

/datum/material/bananium/on_applied(atom/source, amount, material_flags)
	. = ..()
	source.LoadComponent(/datum/component/squeak, list('sound/items/bikehorn.ogg'=1), 50, falloff_exponent = 20)
	source.AddComponent(/datum/component/slippery, min(amount / 10, 80))


/datum/material/bananium/on_removed(atom/source, amount, material_flags)
	. = ..()
	qdel(source.GetComponent(/datum/component/slippery))
	qdel(source.GetComponent(/datum/component/squeak))


///Mediocre force increase
/datum/material/titanium
	name = "титан"
	skloname = "титана"
	id = "titanium"
	desc = "Отражает выстрелы и используется как покрытие для стен шаттлов и кораблей."
	color = "#b3c0c7"
	strength_modifier = 1.3
	categories = list(MAT_CATEGORY_ORE = TRUE, MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = TRUE)
	sheet_type = /obj/item/stack/sheet/mineral/titanium
	ore_type = /obj/item/stack/ore/titanium
	value_per_unit = 0.0625
	beauty_modifier = 0.05
	armor_modifiers = list("melee" = 1.35, "bullet" = 1.3, "laser" = 1.3, "energy" = 1.25, "bomb" = 1.25, "bio" = 1, "rad" = 1, "fire" = 0.7, "acid" = 1)

/datum/material/runite
	name = "рунит"
	skloname = "рунита"
	id = "runite"
	desc = "Похож на адамантий. Обладает магическими своиствами. Возможно."
	color = "#3F9995"
	strength_modifier = 1.3
	categories = list(MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = TRUE)
	sheet_type = /obj/item/stack/sheet/mineral/runite
	value_per_unit = 0.3
	beauty_modifier = 0.5
	armor_modifiers = list("melee" = 1.35, "bullet" = 2, "laser" = 0.5, "energy" = 1.25, "bomb" = 1.25, "bio" = 1, "rad" = 1, "fire" = 1.4, "acid" = 1) //rune is weak against magic lasers but strong against bullets. This is the combat triangle.

///Force decrease
/datum/material/plastic
	name = "пластик"
	skloname = "пластика"
	id = "plastic"
	desc = "Подходит для создания повседневных вещей."
	color = "#caccd9"
	strength_modifier = 0.85
	sheet_type = /obj/item/stack/sheet/plastic
	categories = list(MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = TRUE)
	value_per_unit = 0.0125
	beauty_modifier = -0.01
	armor_modifiers = list("melee" = 1.5, "bullet" = 1.1, "laser" = 0.3, "energy" = 0.5, "bomb" = 1, "bio" = 1, "rad" = 1, "fire" = 1.1, "acid" = 1)

///Force decrease and mushy sound effect. (Not yet implemented)
/datum/material/biomass
	name = "биомасса"
	skloname = "биомассы"
	id = "biomass"
	desc = "Органика."
	color = "#735b4d"
	strength_modifier = 0.8
	value_per_unit = 0.025

/datum/material/wood
	name = "дерево"
	skloname = "дерева"
	id = "wood"
	desc = "Горючий и не слишком прочный. Используется в древних генераторах и в строительстве."
	color = "#bb8e53"
	strength_modifier = 0.5
	sheet_type = /obj/item/stack/sheet/mineral/wood
	categories = list(MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = TRUE)
	value_per_unit = 0.01
	beauty_modifier = 0.1
	armor_modifiers = list("melee" = 1.1, "bullet" = 1.1, "laser" = 0.4, "energy" = 0.4, "bomb" = 1, "bio" = 0.2, "rad" = 0, "fire" = 0, "acid" = 0.3)

/datum/material/wood/on_applied_obj(obj/source, amount, material_flags)
	. = ..()
	if(material_flags & MATERIAL_AFFECT_STATISTICS)
		var/obj/wooden = source
		wooden.resistance_flags |= FLAMMABLE

/datum/material/wood/on_removed_obj(obj/source, material_flags)
	. = ..()
	if(material_flags & MATERIAL_AFFECT_STATISTICS)
		var/obj/wooden = source
		wooden.resistance_flags &= ~FLAMMABLE

///Stronk force increase
/datum/material/adamantine
	name = "адамантий"
	skloname = "адамантия"
	id = "adamantine"
	desc = "Магический и не изученный материал."
	color = "#6d7e8e"
	strength_modifier = 1.5
	categories = list(MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = TRUE)
	sheet_type = /obj/item/stack/sheet/mineral/adamantine
	value_per_unit = 0.25
	beauty_modifier = 0.4
	armor_modifiers = list("melee" = 1.5, "bullet" = 1.5, "laser" = 1.3, "energy" = 1.3, "bomb" = 1, "bio" = 1, "rad" = 1, "fire" = 2.5, "acid" = 1)

///RPG Magic.
/datum/material/mythril
	name = "мифрил"
	skloname = "мифрила"
	id = "mythril"
	desc = "Как оно существует?"
	color = "#f2d5d7"
	categories = list(MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = TRUE)
	sheet_type = /obj/item/stack/sheet/mineral/mythril
	value_per_unit = 0.75
	strength_modifier = 1.2
	armor_modifiers = list("melee" = 1.5, "bullet" = 1.5, "laser" = 1.5, "energy" = 1.5, "bomb" = 1.5, "bio" = 1.5, "rad" = 1.5, "fire" = 1.5, "acid" = 1.5)
	beauty_modifier = 0.5

/datum/material/mythril/on_applied_obj(atom/source, amount, material_flags)
	. = ..()
	if(istype(source, /obj/item))
		source.AddComponent(/datum/component/fantasy)

/datum/material/mythril/on_removed_obj(atom/source, material_flags)
	. = ..()
	if(istype(source, /obj/item))
		qdel(source.GetComponent(/datum/component/fantasy))

//formed when freon react with o2, emits a lot of plasma when heated
/datum/material/hot_ice
	name = "горячий лёд"
	skloname = "горячего льда"
	id = "hot ice"
	desc = "Выглядит как лёд, тёплый на ощупь."
	color = "#88cdf1"
	alpha = 150
	categories = list(MAT_CATEGORY_RIGID = TRUE)
	sheet_type = /obj/item/stack/sheet/hot_ice
	value_per_unit = 0.2
	beauty_modifier = 0.2

/datum/material/hot_ice/on_applied(atom/source, amount, material_flags)
	. = ..()
	source.AddComponent(/datum/component/hot_ice, "plasma", amount*150, amount*20+300)

/datum/material/hot_ice/on_removed(atom/source, amount, material_flags)
	qdel(source.GetComponent(/datum/component/hot_ice, "plasma", amount*150, amount*20+300))
	return ..()

//I don't like sand. It's coarse, and rough, and irritating, and it gets everywhere.
/datum/material/sand
	name = "песок"
	skloname = "песка"
	id = "sand"
	desc = "Не использовать как замену еде. Я серьёзно."
	color = "#EDC9AF"
	categories = list(MAT_CATEGORY_RIGID = TRUE)
	sheet_type = /obj/item/stack/sheet/sandblock
	value_per_unit = 0.001
	strength_modifier = 0.5
	integrity_modifier = 0.1
	armor_modifiers = list("melee" = 0.25, "bullet" = 0.25, "laser" = 1.25, "energy" = 0.25, "bomb" = 0.25, "bio" = 0.25, "rad" = 1.5, "fire" = 1.5, "acid" = 1.5)
	beauty_modifier = 0.25
	turf_sound_override = FOOTSTEP_SAND
	texture_layer_icon_state = "sand"

//And now for our lavaland dwelling friends, sand, but in stone form! Truly revolutionary.
/datum/material/sandstone
	name = "песчаник"
	skloname = "песчаника"
	id = "sandstone"
	desc = "Спресованный песок."
	color = "#B77D31"
	categories = list(MAT_CATEGORY_RIGID = TRUE)
	sheet_type = /obj/item/stack/sheet/mineral/sandstone
	value_per_unit = 0.0025
	armor_modifiers = list("melee" = 0.5, "bullet" = 0.5, "laser" = 1.25, "energy" = 0.5, "bomb" = 0.5, "bio" = 0.25, "rad" = 1.5, "fire" = 1.5, "acid" = 1.5)
	beauty_modifier = 0.3
	turf_sound_override = FOOTSTEP_WOOD
	texture_layer_icon_state = "brick"

/datum/material/snow
	name = "снег"
	skloname = "снега"
	id = "snow"
	desc = "Нет, его нельзя нюхать."
	color = "#FFFFFF"
	categories = list(MAT_CATEGORY_RIGID = TRUE)
	sheet_type = /obj/item/stack/sheet/mineral/snow
	value_per_unit = 0.0025
	armor_modifiers = list("melee" = 0.25, "bullet" = 0.25, "laser" = 0.25, "energy" = 0.25, "bomb" = 0.25, "bio" = 0.25, "rad" = 1.5, "fire" = 0.25, "acid" = 1.5)
	beauty_modifier = 0.3
	turf_sound_override = FOOTSTEP_SAND
	texture_layer_icon_state = "sand"

/datum/material/runedmetal
	name = "рунический металл"
	skloname = "рунического металла"
	id = "runed metal"
	desc = "Это металл... но... на нём постоянно мелькает руна."
	color = "#3C3434"
	categories = list(MAT_CATEGORY_RIGID = TRUE)
	sheet_type = /obj/item/stack/sheet/runed_metal
	value_per_unit = 0.75
	armor_modifiers = list("melee" = 1.2, "bullet" = 1.2, "laser" = 1, "energy" = 1, "bomb" = 1.2, "bio" = 1.2, "rad" = 1.5, "fire" = 1.5, "acid" = 1.5)
	beauty_modifier = -0.15
	texture_layer_icon_state = "runed"

/datum/material/bronze
	name = "бронза"
	skloname = "бронзы"
	id = "bronze"
	desc = "Культ часов? Не слышал."
	color = "#92661A"
	categories = list(MAT_CATEGORY_RIGID = TRUE)
	sheet_type = /obj/item/stack/tile/bronze
	value_per_unit = 0.025
	armor_modifiers = list("melee" = 1, "bullet" = 1, "laser" = 1, "energy" = 1, "bomb" = 1, "bio" = 1, "rad" = 1.5, "fire" = 1.5, "acid" = 1.5)
	beauty_modifier = 0.2

/datum/material/paper
	name = "бумага"
	skloname = "бумаги"
	id = "paper"
	desc = "Обычно из таких бумаг японцы делают сёдзи."
	color = "#E5DCD5"
	categories = list(MAT_CATEGORY_RIGID = TRUE)
	sheet_type = /obj/item/stack/sheet/paperframes
	value_per_unit = 0.0025
	armor_modifiers = list("melee" = 0.1, "bullet" = 0.1, "laser" = 0.1, "energy" = 0.1, "bomb" = 0.1, "bio" = 0.1, "rad" = 1.5, "fire" = 0, "acid" = 1.5)
	beauty_modifier = 0.3
	turf_sound_override = FOOTSTEP_SAND
	texture_layer_icon_state = "paper"

/datum/material/paper/on_applied_obj(obj/source, amount, material_flags)
	. = ..()
	if(material_flags & MATERIAL_AFFECT_STATISTICS)
		var/obj/paper = source
		paper.resistance_flags |= FLAMMABLE
		paper.obj_flags |= UNIQUE_RENAME

/datum/material/paper/on_removed_obj(obj/source, material_flags)
	if(material_flags & MATERIAL_AFFECT_STATISTICS)
		var/obj/paper = source
		paper.resistance_flags &= ~FLAMMABLE
	return ..()

/datum/material/cardboard
	name = "картон"
	skloname = "картона"
	id = "cardboard"
	desc = "Кто-то скажет что их используют бомжи а я скажу что из них получаются неплохие коробки."
	color = "#5F625C"
	categories = list(MAT_CATEGORY_RIGID = TRUE)
	sheet_type = /obj/item/stack/sheet/cardboard
	value_per_unit = 0.003
	armor_modifiers = list("melee" = 0.25, "bullet" = 0.25, "laser" = 0.25, "energy" = 0.25, "bomb" = 0.25, "bio" = 0.25, "rad" = 1.5, "fire" = 0, "acid" = 1.5)
	beauty_modifier = -0.1

/datum/material/cardboard/on_applied_obj(obj/source, amount, material_flags)
	. = ..()
	if(material_flags & MATERIAL_AFFECT_STATISTICS)
		var/obj/cardboard = source
		cardboard.resistance_flags |= FLAMMABLE
		cardboard.obj_flags |= UNIQUE_RENAME

/datum/material/cardboard/on_removed_obj(obj/source, material_flags)
	if(material_flags & MATERIAL_AFFECT_STATISTICS)
		var/obj/cardboard = source
		cardboard.resistance_flags &= ~FLAMMABLE
	return ..()

/datum/material/bone
	name = "кость"
	skloname = "костей"
	id = "bone"
	desc = "Чувак, зачем тебе кость? Ты же не собираешься идти в шахту."
	color = "#e3dac9"
	categories = list(MAT_CATEGORY_RIGID = TRUE)
	sheet_type = /obj/item/stack/sheet/bone
	value_per_unit = 0.05
	armor_modifiers = list("melee" = 1.2, "bullet" = 0.75, "laser" = 0.75, "energy" = 1.2, "bomb" = 1, "bio" = 1, "rad" = 1.5, "fire" = 1.5, "acid" = 1.5)
	beauty_modifier = -0.2

/datum/material/bamboo
	name = "бамбук"
	skloname = "бамбука"
	id = "bamboo"
	desc = "Его едят панды и из него строят дома."
	color = "#339933"
	categories = list(MAT_CATEGORY_RIGID = TRUE)
	sheet_type = /obj/item/stack/sheet/mineral/bamboo
	value_per_unit = 0.0025
	armor_modifiers = list("melee" = 0.5, "bullet" = 0.5, "laser" = 0.5, "energy" = 0.5, "bomb" = 0.5, "bio" = 0.51, "rad" = 1.5, "fire" = 0.5, "acid" = 1.5)
	beauty_modifier = 0.2
	turf_sound_override = FOOTSTEP_WOOD
	texture_layer_icon_state = "bamboo"
