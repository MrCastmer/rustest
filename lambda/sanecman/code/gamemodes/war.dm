/datum/game_mode/war
	name = "война"
	config_tag = "war"
	report_type = "extended"
	false_report_weight = 0
	required_players = 0

	announce_span = "warning"
	announce_text = "Сектор представляет значительный интерес для корпораций и группировок."

	title_icon = "shiptest"

/datum/game_mode/war/pre_setup()
	return 1

/datum/game_mode/war/generate_report()
	return "Мы провели сканирование сектора и обнаружили значительный накал между НаноТрейзен и Синдикатом. Будьте аккуратны!"

/datum/game_mode/war/generate_station_goals()
	for(var/T in subtypesof(/datum/station_goal))
		var/datum/station_goal/G = new T
		station_goals += G
		G.on_report()

/datum/game_mode/war/announced/send_intercept(report = 0)
	priority_announce("Мы провели сканирование сектора и обнаружили значительный накал между НаноТрейзен и Синдикатом. Будьте аккуратны!", "SolGov Report", 'sound/ai/commandreport.ogg')
