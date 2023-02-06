/datum/game_mode/extended
	name = "холодная война"
	config_tag = "secret_extended"
	report_type = "extended"
	false_report_weight = 5
	required_players = 0

	announce_span = "notice"
	announce_text = "Сектор представляет незначительный интерес для корпораций и группировок."

	title_icon = "shiptest"

/datum/game_mode/extended/pre_setup()
	return 1

/datum/game_mode/extended/generate_report()
	return "Мы провели сканирование сектора и обнаружили небольшой накал между НаноТрейзен и Синдикатом. Будьте аккуратны!"

/datum/game_mode/extended/announced
	name = "спокойный"
	config_tag = "extended"
	false_report_weight = 0

	announce_span = "notice"
	announce_text = "Сектор не представляет интереса для корпораций и группировок."

/datum/game_mode/extended/announced/generate_station_goals()
	for(var/T in subtypesof(/datum/station_goal))
		var/datum/station_goal/G = new T
		station_goals += G
		G.on_report()

/datum/game_mode/extended/announced/send_intercept(report = 0)
	priority_announce("Мы провели сканирование сектора и не нашли никакой вражеской инфраструктуры. Приятного вам исследования!", "SolGov Report", 'sound/ai/commandreport.ogg')
