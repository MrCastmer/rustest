/datum/language/mouse
	name = "Мышинный"
	desc = "Довольно простой язык, на котором говорят и понимают мыши. Он был разработан и распространен среди генетически продвинутых мышей."
	speech_verb = "пищит"
	ask_verb = "сквикает"
	exclaim_verb = "сквикает"
	key = "m"
	flags = NO_STUTTER | LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD | LANGUAGE_HIDE_ICON_IF_UNDERSTOOD

/datum/language/mouse/scramble(input)
	. = "Сквик"
	. += (copytext(input, length(input)) == "?") ? "?" : "!"
