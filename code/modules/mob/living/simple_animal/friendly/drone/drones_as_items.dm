#define DRONE_MINIMUM_AGE 14

///////////////////
//DRONES AS ITEMS//
///////////////////
//Drone shells

/** Drone Shell: Ghost role item for drones
 *
 * A simple mob spawner item that transforms into a maintenance drone
 * Resepcts drone minimum age
 */

/obj/effect/mob_spawn/drone
	name = "корпус дрона"
	mob_name = "drone"                                                                              //WS Edit - Adding missing var
	desc = "Корпус дрона для ремонта и обслуживания."
	icon = 'icons/mob/drone.dmi'
	icon_state = "drone_maint_hat" //yes reuse the _hat state.
	layer = BELOW_MOB_LAYER
	density = FALSE
	death = FALSE
	roundstart = FALSE
	///Type of drone that will be spawned
	mob_type = /mob/living/simple_animal/drone
	short_desc = "Ты дрон. Веселись."		//WS Edit - Adding missing var

/obj/effect/mob_spawn/drone/Initialize()
	. = ..()
	var/area/A = get_area(src)
	if(A)
		notify_ghosts("Корпус дрона был создан в [A.name].", source = src, action=NOTIFY_ATTACK, flashwindow = FALSE, ignore_key = POLL_IGNORE_DRONE, notify_suiciders = FALSE)
	GLOB.poi_list |= src

/obj/effect/mob_spawn/drone/Destroy()
	GLOB.poi_list -= src
	. = ..()

//ATTACK GHOST IGNORING PARENT RETURN VALUE
/obj/effect/mob_spawn/drone/attack_ghost(mob/user)
	if(CONFIG_GET(flag/use_age_restriction_for_jobs))
		if(!isnum(user.client.player_age)) //apparently what happens when there's no DB connected. just don't let anybody be a drone without admin intervention
			return
		if(user.client.player_age < DRONE_MINIMUM_AGE)
			to_chat(user, "<span class='danger'>Бро ты слишком молод для игры на дроне, поиграй ещё [DRONE_MINIMUM_AGE - user.client.player_age] дней.</span>")
			return
	. = ..()

/obj/effect/mob_spawn/drone/unchored
	anchored = FALSE
		desc = "Корпус дрона для ремонта и обслуживания. Можно передвинуть."
