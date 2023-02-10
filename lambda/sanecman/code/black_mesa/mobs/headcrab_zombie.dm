/mob/living/simple_animal/hostile/blackmesa/xen/headcrab_zombie
	name = "зомбированный"
	desc = "У него на голове краб. Ой, хедкраб."
	icon = 'lambda/sanecman/icons/black_mesa/mobs.dmi'
	icon_state = "zombie"
	icon_living = "zombie"
	maxHealth = 110
	health = 110
	icon_gib = null
	icon_dead = "zombie_dead"
	speak_chance = 1
	speak_emote = list("воет")
	speed = 1
	emote_taunt = list("воет", "орёт", "танцует")
	taunt_chance = 100
	melee_damage_lower = 21
	melee_damage_upper = 21
	attack_sound = 'lambda/sanecman/sound/black_mesa/mobs/zombies/claw_strike.ogg'
	gold_core_spawnable = HOSTILE_SPAWN
	alert_cooldown_time = 8 SECONDS
	alert_sounds = list(
		'lambda/sanecman/sound/black_mesa/mobs/zombies/alert1.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/alert2.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/alert3.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/alert4.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/alert5.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/alert6.ogg',
	)

/mob/living/simple_animal/hostile/blackmesa/xen/headcrab_zombie/death(gibbed)
	new /obj/effect/gibspawner/human(get_turf(src))
	return ..()

/mob/living/simple_animal/hostile/blackmesa/xen/headcrab_zombie/scientist
	name = "зомбированный учёный"
	desc = "Даже после смерти ему приходится носить этот уродливый галстук."
	icon_state = "scientist_zombie"
	icon_living = "scientist_zombie"


/mob/living/simple_animal/hostile/blackmesa/xen/headcrab_zombie/guard
	name = "зомбированный охранник"
	desc = "Теперь не охраняет учёных."
	icon_state = "security_zombie"
	icon_living = "security_zombie"
	maxHealth = 140 // Armor!
	health = 140

/mob/living/simple_animal/hostile/blackmesa/xen/headcrab_zombie/hev
	name = "зомбированный исследователь"
	desc = "Исследователь, на котором надет защитный костюм HEV."
	icon_state = "hev_zombie"
	icon_living = "hev_zombie"
	maxHealth = 250
	health = 250
	alert_sounds = list(
		'lambda/sanecman/sound/black_mesa/mobs/zombies/hzv1.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/hzv2.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/hzv3.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/hzv4.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/hzv5.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/hzv6.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/hzv7.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/hzv8.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/hzv9.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/hzv10.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/hzv11.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/hzv12.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/hzv13.ogg',
		'lambda/sanecman/sound/black_mesa/mobs/zombies/hzv14.ogg',
	)
