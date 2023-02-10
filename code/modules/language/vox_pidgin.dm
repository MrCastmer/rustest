/datum/language/vox_pidgin
	name = "Пиджин Воксов"
	//Copy-paste of bay stuff basically
	desc = "Общий язык различных кораблей воксов, составляющих Мелководье. Для всех остальных это звучит как хаотичный визг."
	speech_verb = "каркает"
	ask_verb = "прокаркивает"
	key = "v"
	flags = LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	space_chance = 20

	syllables = list(
		"ти", "ти", "ти", "хи", "хи", "ки", "ки", "ки", "ки", "я", "та", "ха", "ка", "я", "чи", "ча", "ках",
		"СКРЕ", "АХК", "ЭХК", "РАВК", "КРА", "ААА", "ЕЕЕ", "КИ", "ИИ", "КРИ", "КА"
	)

	icon_state = "bird"
	default_priority = 90
