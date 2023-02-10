/datum/language/ratvar
	name = "Ратварский"
	desc = "Вечный язык, полный силы и непостижимый для непросвещенных."
	var/static/random_speech_verbs = list("кланкает", "клинкает", "клянкает", "клацает")
	ask_verb = "запрашивает"
	exclaim_verb = "возникает"
	whisper_verb = "мелодично кланкает"
	key = "R"
	flags = LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	default_priority = 10
	spans = list(SPAN_ROBOT)
	icon_state = "ratvar"

/datum/language/ratvar/scramble(input)
	. = text2ratvar(input)

/datum/language/ratvar/get_spoken_verb(msg_end)
	if(!msg_end)
		return pick(random_speech_verbs)
	return ..()
