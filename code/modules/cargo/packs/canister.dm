/datum/supply_pack/canister
	group = "Газ. канистры"
	crate_type = /obj/structure/closet/crate/large

/*
		Canisters
*/

/datum/supply_pack/canister/nitrogen
	name = "Канистра азота"
	desc = "Содержит азот для тушения пожаров и поддержания атмосферы на судне."
	cost = 1000
	contains = list(/obj/machinery/portable_atmospherics/canister/nitrogen)
	crate_name = "ящик с канистрой азота"

/datum/supply_pack/canister/oxygen
	name = "Канистра кислорода"
	desc = "Содержит кислород который жизненно необходим для дыхания многим формам жизни а ещё для заполнения баллонов."
	cost = 1000
	contains = list(/obj/machinery/portable_atmospherics/canister/oxygen)
	crate_name = "ящик с канистрой кислорода"

/datum/supply_pack/canister/air
	name = "Канистра воздуха"
	desc = "Содержит воздушную смесь как на планетах земного типа."
	cost = 1000
	contains = list(/obj/machinery/portable_atmospherics/canister/air)
	crate_name = "ящик с канистрой воздуха"

/datum/supply_pack/canister/plasma
	name = "Канистра плазмы"
	desc = "Содержит плазму (газ) которая нужна для работы двигателей. Очень токсичен и очень огнеопасен."
	cost = 2000
	contains = list(/obj/machinery/portable_atmospherics/canister/toxins)
	crate_name = "ящик с канистрой плазмы"

/datum/supply_pack/canister/carbon_dio
	name = "Канистра углерода"
	desc = "Содержит углерод. Зачем он тебе?" // what the fuck is carbon dioxide?
	cost = 2500
	contains = list(/obj/machinery/portable_atmospherics/canister/carbon_dioxide)
	crate_name = "ящик с канистрой углерода"

/datum/supply_pack/canister/nitrous_oxide
	name = "Канистра с закисью азота"
	desc = "Содержит канистру с закисью азота. Вызывает смех и сонливость."
	cost = 2500
	contains = list(/obj/machinery/portable_atmospherics/canister/nitrous_oxide)
	crate_name = "ящик с канистрой закисью азота"

/datum/supply_pack/canister/water_vapor
	name = "Канистра пара"
	desc = "Содержит пар. Банька парилка..."
	cost = 2500
	contains = list(/obj/machinery/portable_atmospherics/canister/water_vapor)
	crate_name = "ящик с канистрой пара"

/datum/supply_pack/canister/bz
	name = "Канистра БЗ"
	desc = "Содержит БЗ. Вызывает головные боли и травмы мозга."
	cost = 8000
	contains = list(/obj/machinery/portable_atmospherics/canister/bz)
	crate_name = "ящик с канистрой БЗ"

/datum/supply_pack/canister/bz
	name = "Канистра БЗ"
	desc = "Содержит БЗ. Вызывает головные боли и травмы мозга."
	cost = 8000
	contains = list(/obj/machinery/portable_atmospherics/canister/bz)
	crate_name = "ящик с канистрой БЗ"

/datum/supply_pack/canister/tritium
	name = "Канистра трития"
	desc = "Содержит тритий. Как плазма но ещё прожигает пол насквозь и сильно радиоактивен."
	cost = 20000
	contains = list(/obj/machinery/portable_atmospherics/canister/tritium)
	crate_name = "ящик с канистрой трития"

/datum/supply_pack/canister/nob
	name = "Канистра с гиперноблием"
	desc = "Содержит тритий. Более благородный, чем все другие газы."
	cost = 30000
	contains = list(/obj/machinery/portable_atmospherics/canister/nob)
	crate_name = "ящик с канистрой гиперноблием"

/datum/supply_pack/canister/nitryl
	name = "Канистра нитрила"
	desc = "Нитриловый газ. Скорость за лёгкие."
	cost = 25000
	contains = list(/obj/machinery/portable_atmospherics/canister/nitryl)
	crate_name = "ящик с канистрой нитрила"

/datum/supply_pack/canister/fusion_test
	name = "Канистра фужион теста"
	desc = "Содержит самые опасные газы. Не покупай это."
	cost = 2000000
	contains = list(/obj/machinery/portable_atmospherics/canister/fusion_test)
	crate_name = "ящик с канистрой фужион теста"

