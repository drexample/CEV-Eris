/datum/role/proc/equip()

	if(owner && !ishuman(owner.current))
		return FALSE
	update_id()
	owner.current.regenerate_icons()
	return TRUE

/datum/role/proc/unequip()
	if(owner && !ishuman(owner.current))
		return FALSE

	owner.current.regenerate_icons()
	return TRUE

/datum/role/proc/clear_equipment()
	if(!ishuman(owner.current))
		return FALSE

	var/mob/living/carbon/human/player = owner.current

	for(var/obj/item/thing in player.contents)
		player.drop_from_inventory(thing)
		if(thing.loc != player)
			qdel(thing)

	return TRUE

//Adds extra access to a player when they become antag
/datum/role/proc/update_id()
	if(!owner || !owner.current)
		return
	if (!default_access || !default_access.len)
		return
	var/list/things = owner.current.get_recursive_contents()
	for (var/obj/item/weapon/card/id/W in things)
		W.access |= default_access

/datum/role/proc/create_id(var/assignment, var/equip = 1)
	if(!owner || !owner.current || !ishuman(owner.current))
		return



	var/mob/living/carbon/human/player = owner.current
	//Remove the old ID
	if (player.wear_id)
		QDEL_NULL(player.wear_id)

	var/obj/item/weapon/card/id/W = new id_type(player)
	if(!W) return
	W.access |= default_access
	W.assignment = "[assignment]"
	player.set_id_info(W)
	if(equip) player.equip_to_slot_or_del(W, slot_wear_id)
	return W

/datum/role/proc/create_radio(var/freq)
	if(!owner || !owner.current || !ishuman(owner.current))
		return

	var/mob/living/carbon/human/H = owner.current

	var/obj/item/device/radio/R

	if(freq == SYND_FREQ)
		R = new/obj/item/device/radio/headset/syndicate(H)
	else
		R = new/obj/item/device/radio/headset(H)

	R.set_frequency(freq)
	H.equip_to_slot_or_del(R, slot_l_ear)
	return R

/datum/role/proc/spawn_uplink(var/mob/living/carbon/human/traitor_mob)
	setup_uplink_source(traitor_mob, DEFAULT_TELECRYSTAL_AMOUNT)
