/datum/supply_pack/animal
	group = "Животные"
	crate_type = /obj/structure/closet/crate/critter

/*
		Vaguely useful animals
*/

/datum/supply_pack/animal/monkey
	name = "Ящик с кубиками макак"
	desc = "Одна капля воды и хлобысь - целая макака!"
	cost = 2000
	contains = list (/obj/item/storage/box/monkeycubes)
	crate_name = "ящик с кубиками макак"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/animal/chick
	name = "Ящик с курицей"
	desc = "В нём содеБВАКБВАКБВАК!"
	cost = 2000
	contains = list(/mob/living/simple_animal/chick)
	crate_name = "ящик с курицей"

/datum/supply_pack/animal/goat
	name = "Ящик с козой"
	desc = "Ящик со злой козой. Лучше её не бить."
	cost = 2500
	contains = list(/mob/living/simple_animal/hostile/retaliate/goat)
	crate_name = "ящик с козой"

/datum/supply_pack/animal/cow
	name = "Ящик с коровой"
	desc = "Корова говорит муу!"
	cost = 3000
	contains = list(/mob/living/simple_animal/cow)
	crate_name = "ящик с коровой"

/*
		Normal pets
*/

/datum/supply_pack/animal/cat
	name = "Ящик с котом"
	desc = "Кот! Вместе с ошейником и игрушкой!"//i can't believe im making this reference
	cost = 5000 //Cats are worth as much as corgis.
	contains = list(/mob/living/simple_animal/pet/cat,
					/obj/item/clothing/neck/petcollar,
					/obj/item/toy/cattoy)
	crate_name = "ящик с котом"

/datum/supply_pack/animal/cat/generate()
	. = ..()
	if(prob(50))
		var/mob/living/simple_animal/pet/cat/C = locate() in .
		qdel(C)
		new /mob/living/simple_animal/pet/cat/Proc(.)

/datum/supply_pack/animal/pug
	name = "Ящик с пуделем"
	desc = "Собака! Правда она выглядит... ужасно. Но зато поставляется с ошейником!"
	cost = 5000
	contains = list(/mob/living/simple_animal/pet/dog/pug,
					/obj/item/clothing/neck/petcollar)
	crate_name = "Ящик с пуделем"

/datum/supply_pack/animal/corgi
	name = "Ящик с корги"
	desc = "Один из тысячи потомков Яна. Поставляется с ошейником!"
	cost = 5000
	contains = list(/mob/living/simple_animal/pet/dog/corgi,
					/obj/item/clothing/neck/petcollar)
	crate_name = "ящик с корги"

/datum/supply_pack/animal/corgi/generate()
	. = ..()
	if(prob(50))
		var/mob/living/simple_animal/pet/dog/corgi/D = locate() in .
		if(D.gender == FEMALE)
			qdel(D)
			new /mob/living/simple_animal/pet/dog/corgi/Lisa(.)

/datum/supply_pack/animal/corgis/exotic
	name = "Ящик с экзотическим корги"
	desc = "Один из тысячи потомков Яна. Данный корги из королевских семей. Поставляется с ошейником!"
	cost = 5500
	contains = list(/mob/living/simple_animal/pet/dog/corgi/exoticcorgi,
					/obj/item/clothing/neck/petcollar)
	crate_name = "exotic corgi crate"

/*
		Exotic pets
*/

/datum/supply_pack/animal/parrot
	name = "Ящик с птицей"
	desc = "Содержит эксперта в телекоммуникациях."
	cost = 4000
	contains = list(/mob/living/simple_animal/parrot)
	crate_name = "ящик с птицей"

/datum/supply_pack/animal/parrot/generate()
	. = ..()
	for(var/i in 1 to 4)
		new /mob/living/simple_animal/parrot(.)

/datum/supply_pack/animal/fox
	name = "Ящик с лисой"
	desc = "Ящик с фоксхау... лисой. Поставляется с ошейником!"//what does the fox say // awful
	cost = 5000
	contains = list(/mob/living/simple_animal/pet/fox,
					/obj/item/clothing/neck/petcollar)
	crate_name = "ящик с лисой"

/datum/supply_pack/animal/butterfly
	name = "Ящик с бабочками"
	desc = "В животе порхают бабочки, и в ящике порхают бабочки."//is that a motherfucking worm reference
	cost = 5000
	contains = list(/mob/living/simple_animal/butterfly)
	crate_name = "ящик с энтомологическими образцами"

/datum/supply_pack/animal/butterfly/generate()
	. = ..()
	for(var/i in 1 to 49)
		new /mob/living/simple_animal/butterfly(.)

/datum/supply_pack/animal/snake
	name = "Ящик со змеями"
	desc = "Устали от этих змей на планете? Тогда это ящик не для вас. Содержит трех ядовитых змей."
	cost = 5000
	contains = list(/mob/living/simple_animal/hostile/retaliate/poison/snake,
					/mob/living/simple_animal/hostile/retaliate/poison/snake,
					/mob/living/simple_animal/hostile/retaliate/poison/snake)
	crate_name = "ящик со змеями"

/*
		Insane
*/

/datum/supply_pack/animal/crab
	name = "Ящик с крабом"
	desc = "Краб."//fun fact: i actually spent like 10 minutes and transcribed the entire video.
	cost = 10000
	contains = list(/mob/living/simple_animal/crab)
	crate_name = "ящик с крабом"
	// DropPodOnly = TRUE

/datum/supply_pack/animal/crab/generate()
	. = ..()
	for(var/i in 1 to 49)
		new /mob/living/simple_animal/crab(.)
