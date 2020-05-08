/proc/player_is_antag(var/datum/mind/player, var/only_offstation_roles = FALSE)
	for(var/datum/role/antag in player.antag_roles)
		//if((antag.outer && only_offstation_roles) || !only_offstation_roles) NTODO
		return TRUE
	return FALSE

/proc/player_is_ship_antag(var/datum/mind/player)
/*	for(var/datum/role/antag in player.antag_roles)
		if(!antag.outer)
			return TRUE
	return FALSE NTODO*/
	return TRUE

/proc/player_is_antag_id(var/datum/mind/player, var/a_id)
	for(var/datum/role/antag in player.antag_roles)
		if(!a_id || antag.id == a_id)
			return TRUE
	return FALSE

/proc/player_is_antag_in_list(datum/mind/player, list/a_ids)
	for(var/datum/role/antag in player.antag_roles)
		if(antag.id in a_ids)
			return TRUE
	return FALSE




/proc/clear_antagonist(var/datum/mind/player)
	for(var/datum/role/A in player.antag_roles)
		A.RemoveFromRole(player, TRUE)

/proc/clear_antagonist_type(var/datum/mind/player, var/a_id)
	for(var/datum/role/A in player.antag_roles)
		if(A.id == a_id)
			A.RemoveFromRole(player, TRUE)


/proc/create_antag_instance(var/a_id)
	var/list/datum/role/all_antag_types = GLOB.all_antag_types
	if(all_antag_types[a_id])
		var/atype = all_antag_types[a_id].type
		return new atype



///TEMPORARY///

GLOBAL_LIST_EMPTY(antag_bantypes)

GLOBAL_LIST_EMPTY(all_antag_selectable_types)

GLOBAL_LIST_EMPTY(all_antag_types)

/obj/effect/overlay/wallrot

/obj/effect/overmap_event/movable

/obj/effect/overmap_event/movable/comet

/obj/effect/space_dust

/obj/effect/blob/core

/proc/lightsout()
	return

/datum/role/traitor

/proc/get_player_antag_name(var/datum/mind/player)
	if(!istype(player))
		return "ERROR"
	var/names
	for(var/datum/role/A in player.antag_roles)
		if(names)
			names += ", "+A.name
		else
			names = A.name
	return names

/proc/get_antag_data(var/antag_type)
	return

/proc/populate_antag_type_list()
	return

var/global/list/end_icons = list()

/datum/event/radiation_storm/syndicate

/datum/event/Initialize()
	return

/datum/storyevent

/datum/objective/steal

/proc/is_valid_apc(var/obj/machinery/power/apc/apc)
	var/area/A = get_area(apc)
	return !(A && (A.flags & AREA_FLAG_CRITICAL)) && !apc.emagged && isOnShipLevel(apc)

/datum/role/changeling

/datum/objective/timed/merc

/datum/objective/steal
	var/obj/item/steal_target
	var/target_name

	var/global/possible_items[] = list(
		"the captain's antique laser gun" = /obj/item/weapon/gun/energy/captain,
		"a hand teleporter" = /obj/item/weapon/hand_tele,
		"an RCD" = /obj/item/weapon/rcd,
		"a jetpack" = /obj/item/weapon/tank/jetpack,
		"a captain's jumpsuit" = /obj/item/clothing/under/rank/captain,
		"a functional AI" = /obj/item/device/aicard,
		"the Technomancer Exultant's advanced voidsuit control module" = /obj/item/weapon/rig/ce,
		"the station blueprints" = /obj/item/blueprints,
		"28 moles of plasma (full tank)" = /obj/item/weapon/tank,
		"a sample of slime extract" = /obj/item/slime_extract,
		"a piece of corgi meat" = /obj/item/weapon/reagent_containers/food/snacks/meat/corgi,
		"a Moebius expedition overseer's jumpsuit" = /obj/item/clothing/under/rank/expedition_overseer,
		"a exultant's jumpsuit" = /obj/item/clothing/under/rank/exultant,
		"a Moebius biolab officer's jumpsuit" = /obj/item/clothing/under/rank/moebius_biolab_officer,
		"a Ironhammer commander's jumpsuit" = /obj/item/clothing/under/rank/ih_commander,
		"a First Officer's jumpsuit" = /obj/item/clothing/under/rank/first_officer,
		"the hypospray" = /obj/item/weapon/reagent_containers/hypospray,
		"the captain's pinpointer" = /obj/item/weapon/pinpointer,
		"an ablative armor vest" = /obj/item/clothing/suit/armor/laserproof,
		"an Ironhammer hardsuit control module" = /obj/item/weapon/rig/combat/ironhammer
	)

	var/global/possible_items_special[] = list(
		"nuclear gun" = /obj/item/weapon/gun/energy/gun/nuclear,
		"diamond drill" = /obj/item/weapon/tool/pickaxe/diamonddrill,
		"bag of holding" = /obj/item/weapon/storage/backpack/holding,
		"hyper-capacity cell" = /obj/item/weapon/cell/large/hyper,
		"10 diamonds" = /obj/item/stack/material/diamond,
		"50 gold bars" = /obj/item/stack/material/gold,
		"25 refined uranium bars" = /obj/item/stack/material/uranium,
	)
