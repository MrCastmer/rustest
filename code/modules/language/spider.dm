/datum/language/spider
	name = "Рахнидианский"
	desc = "Язык, который использует несколько конечностей пауков для выполнения тонких танцевальных движений для общения.\
	Однако правильные движения достаточно быстры и резки, чтобы издавать слышимые дуновения и удары, которые разборчивы по радио."
	speech_verb = "клацает"
	ask_verb = "клацает"
	exclaim_verb = "восклацает"
	key = "r"
	flags = NO_STUTTER | LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD

	icon_state = "spider"

/datum/language/spider/scramble(input)
	. = prob(65) ? "<i>шшш</i>" : "<i>вуфф</i>"
	. += (copytext(input, length(input)) == "?") ? "?" : "!"
