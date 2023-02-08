// Машины 20-21 века
// Сначала идёт отображение веток в рнд
// КАРТА ВЕТКИ СТАРЫХ ТЕХНОЛОГИЙ
//
//
//
//
//
//       /datum/techweb_node/old_tech      ->        /datum/techweb_node/adv_old_tech
//
//
//
//
//
//
//
//
/datum/techweb_node/old_tech
	id = "old_tech"
	display_name = "Восстановление затерянных технологий"
	description = "Начало восстановления технологий 20-21 века."
	prereq_ids = list("engineering")
	design_ids = list("pacman_wood")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/datum/techweb_node/adv_old_tech
	id = "adv_old_tech"
	display_name = "Полное восстановление затерянных технологий"
	description = "Технологии 20-21 века были восстановлены и улучшены при помощи технологий будущего."
	prereq_ids = list("old_tech")
	design_ids = list()
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 25000)
	export_price = 50000

// Затем идут сами вещи после изучений в рнд
/datum/design/board/power_compressor
	name = "поративный генератор внутренего сгорания (Оборудование)"
	desc = "Поративный генератор сжигающий дерево и превращающий его в энергию."
	id = "pacman_wood"
	build_path = /obj/item/circuitboard/machine/pacman/wood
	category = list ("Engineering Machinery")
