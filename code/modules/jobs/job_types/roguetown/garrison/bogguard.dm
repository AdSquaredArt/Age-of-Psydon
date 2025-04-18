/datum/job/roguetown/bogguardsman
	title = "Boggard"
	flag = BOGGUARD
	department_flag = GARRISON
	faction = "Station"
	total_positions = 10
	spawn_positions = 10
	selection_color = JCOLOR_SOLDIER
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	allowed_ages = ALL_AGES_LIST
	allowed_patrons = ALL_NON_INHUMEN_PATRONS
	tutorial = "Either a freshly levied criminal or a common peasant, you have been assigned to protect and operate the Bog Gate. \
	You have a roof over your head, coin in your pocket, and a thankless job protecting the outskirts of town against the horrors that lurk beyond.\
	The Gate must not fall."
	display_order = JDO_BOGGUARD
	whitelist_req = FALSE
	outfit = /datum/outfit/job/roguetown/bog
	give_bank_account = 16
	min_pq = 1
	max_pq = null
	subclass_cat_rolls = list(CTAG_BOG = 20)
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE

	cmode_music = 'sound/music/combat_bog.ogg'

/datum/job/roguetown/bogguardsman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/job/roguetown/bogguardsman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/bog))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "boggard tabard ([index])"
/datum/outfit/job/roguetown/bogguardsman
	name = "Boggard Footman"

/datum/outfit/job/roguetown/ranger
	name = "Boggard Archer"

/datum/subclass/bogguard
	name = "Boggard Footman"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_VERY_SHUNNED_UP
	outfit = /datum/outfit/job/roguetown/bogguardsman
	tutorial = "You are well versed in the ways of handling a sword. \
	You will stand in the front, and protect."
	category_tags = list(CTAG_BOG)

/datum/subclass/bogranger
	name = "Boggard Archer"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_VERY_SHUNNED_UP
	outfit = /datum/outfit/job/roguetown/ranger
	tutorial = "You are well versed in the ways of handling a bow. \
	You will stand in the back, and protect the front with arrows."
	category_tags = list(CTAG_BOG)
	maximum_possible_slots = 3

/datum/outfit/job/roguetown/bog/pre_equip(mob/living/carbon/human/H)
	head = /obj/item/clothing/head/roguetown/helmet/skullcap
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
	cloak = /obj/item/clothing/cloak/stabard/bog
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/armor
	beltl = /obj/item/storage/keyring/bog_guard
	belt = /obj/item/storage/belt/rogue/leather

/datum/outfit/job/roguetown/ranger/pre_equip(mob/living/carbon/human/H)
	. = ..()
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	beltr = /obj/item/ammo_holder/quiver/arrows //replaces sword
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, /obj/item/clothing/cloak/raincloak/brown = 1 )
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	if(H.mind)
		assign_skills(H)

/datum/outfit/job/roguetown/bogguardsman/pre_equip(mob/living/carbon/human/H)
	. = ..()
	beltr = /obj/item/rogueweapon/sword
	backr = /obj/item/storage/backpack/rogue/satchel
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1)
	if(H.mind)
		assign_skills(H)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/outfit/job/roguetown/bogguardsman/proc/assign_skills(mob/living/carbon/human/bogger)
	bogger.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/misc/swimming, 0, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/misc/reading, 0, TRUE)
	bogger.change_stat("strength", 2)
	bogger.change_stat("constitution", 1)
	bogger.change_stat("endurance", 2)
	bogger.change_stat("speed", 1)

/datum/outfit/job/roguetown/ranger/proc/assign_skills(mob/living/carbon/human/bogger)
	bogger.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/misc/swimming, 0, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
	bogger.mind.adjust_skillrank(/datum/skill/misc/reading, 0, TRUE)
	bogger.change_stat("perception", 2)
	bogger.change_stat("speed", 2)
	bogger.change_stat("endurance", 2)
