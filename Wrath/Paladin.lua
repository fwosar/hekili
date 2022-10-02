if UnitClassBase( 'player' ) ~= 'PALADIN' then return end

local addon, ns = ...
local Hekili = _G[ addon ]
local class, state = Hekili.Class, Hekili.State

local spec = Hekili:NewSpecialization( 2 )

spec:RegisterResource( Enum.PowerType.Mana )

-- Talents
spec:RegisterTalents( {
    anticipation                    = {  1629, 5, 20096, 20097, 20098, 20099, 20100 },
    ardent_defender                 = {  1751, 3, 31850, 31851, 31852 },
    aura_mastery                    = {  1435, 1, 31821 },
    avengers_shield                 = {  1754, 1, 31935 },
    beacon_of_light                 = {  2192, 1, 53563 },
    benediction                     = {  1407, 5, 20101, 20102, 20103, 20104, 20105 },
    blessed_hands                   = {  2198, 2, 53660, 53661 },
    blessed_life                    = {  1744, 3, 31828, 31829, 31830 },
    blessing_of_sanctuary           = {  1431, 1, 20911 },
    combat_expertise                = {  1753, 3, 31858, 31859, 31860 },
    conviction                      = {  1411, 5, 20117, 20118, 20119, 20120, 20121 },
    crusade                         = {  1755, 3, 31866, 31867, 31868 },
    crusader_strike                 = {  1823, 1, 35395 },
    deflection                      = {  1403, 5, 20060, 20061, 20062, 20063, 20064 },
    divine_favor                    = {  1433, 1, 20216 },
    divine_guardian                 = {  2281, 2, 53527, 53530 },
    divine_illumination             = {  1747, 1, 31842 },
    divine_intellect                = {  1449, 5, 20257, 20258, 20259, 20260, 20261 },
    divine_purpose                  = {  1757, 2, 31871, 31872 },
    divine_sacrifice                = {  2280, 1, 64205 },
    divine_storm                    = {  2150, 1, 53385 },
    divine_strength                 = {  2185, 5, 20262, 20263, 20264, 20265, 20266 },
    divinity                        = {  1442, 5, 63646, 63647, 63648, 63649, 63650 },
    enlightened_judgements          = {  2191, 2, 53556, 53557 },
    eye_for_an_eye                  = {  1632, 2,  9799, 25988 },
    fanaticism                      = {  1759, 3, 31879, 31880, 31881 },
    guarded_by_the_light            = {  2194, 2, 53583, 53585 },
    guardians_favor                 = {  1425, 2, 20174, 20175 },
    hammer_of_the_righteous         = {  2196, 1, 53595 },
    healing_light                   = {  1444, 3, 20237, 20238, 20239 },
    heart_of_the_crusader           = {  1464, 3, 20335, 20336, 20337 },
    holy_guidance                   = {  1746, 5, 31837, 31838, 31839, 31840, 31841 },
    holy_power                      = {  1627, 5,  5923,  5924,  5925,  5926, 25829 },
    holy_shield                     = {  1430, 1, 20925 },
    holy_shock                      = {  1502, 1, 20473 },
    illumination                    = {  1461, 5, 20210, 20212, 20213, 20214, 20215 },
    improved_blessing_of_might      = {  1401, 2, 20042, 20045 },
    improved_blessing_of_wisdom     = {  1446, 2, 20244, 20245 },
    improved_concentration_aura     = {  1450, 3, 20254, 20255, 20256 },
    improved_devotion_aura          = {  1422, 3, 20138, 20139, 20140 },
    improved_hammer_of_justice      = {  1521, 2, 20487, 20488 },
    improved_judgements             = {  1631, 2, 25956, 25957 },
    improved_lay_on_hands           = {  1443, 2, 20234, 20235 },
    improved_righteous_fury         = {  1501, 3, 20468, 20469, 20470 },
    infusion_of_light               = {  2193, 2, 53569, 53576 },
    judgements_of_the_just          = {  2200, 2, 53695, 53696 },
    judgements_of_the_pure          = {  2199, 5, 53671, 53673, 54151, 54154, 54155 },
    judgements_of_the_wise          = {  1758, 3, 31876, 31877, 31878 },
    lights_grace                    = {  1745, 3, 31833, 31835, 31836 },
    onehanded_weapon_specialization = {  1429, 3, 20196, 20197, 20198 },
    pure_of_heart                   = {  1742, 2, 31822, 31823 },
    purifying_power                 = {  1743, 2, 31825, 31826 },
    pursuit_of_justice              = {  1634, 2, 26022, 26023 },
    reckoning                       = {  1426, 5, 20177, 20179, 20181, 20180, 20182 },
    redoubt                         = {  1421, 3, 20127, 20130, 20135 },
    repentance                      = {  1441, 1, 20066 },
    righteous_vengeance             = {  2149, 3, 53380, 53381, 53382 },
    sacred_cleansing                = {  2190, 3, 53551, 53552, 53553 },
    sacred_duty                     = {  1750, 2, 31848, 31849 },
    sanctified_light                = {  1465, 3, 20359, 20360, 20361 },
    sanctified_retribution          = {  1756, 1, 31869 },
    sanctified_wrath                = {  2147, 2, 53375, 53376 },
    sanctity_of_battle              = {  1761, 3, 32043, 35396, 35397 },
    seal_of_command                 = {  1481, 1, 20375 },
    seals_of_the_pure               = {  1463, 5, 20224, 20225, 20330, 20331, 20332 },
    sheath_of_light                 = {  2179, 3, 53501, 53502, 53503 },
    shield_of_the_templar           = {  2204, 3, 53709, 53710, 53711 },
    spiritual_attunement            = {  2282, 2, 31785, 33776 },
    spiritual_focus                 = {  1432, 5, 20205, 20206, 20207, 20209, 20208 },
    stoicism                        = {  1748, 3, 31844, 31845, 53519 },
    swift_retribution               = {  2148, 3, 53379, 53484, 53648 },
    the_art_of_war                  = {  2176, 2, 53486, 53488 },
    touched_by_the_light            = {  2195, 3, 53590, 53591, 53592 },
    toughness                       = {  1423, 5, 20143, 20144, 20145, 20146, 20147 },
    twohanded_weapon_specialization = {  1410, 3, 20111, 20112, 20113 },
    unyielding_faith                = {  1628, 2,  9453, 25836 },
    vengeance                       = {  1402, 3, 20049, 20056, 20057 },
    vindication                     = {  1633, 2,  9452, 26016 },
} )


-- Auras
spec:RegisterAuras( {
    aura = {
        alias = { "devotion_aura", "retribution_aura", "concentration_aura", "shadow_resistance_aura", "frost_resistance_aura", "fire_resistance_aura", "crusader_aura" },
        aliasMode = "first",
        aliasType = "buff",
    },
    active_consecration = {
        duration = 8,
        max_stack = 1,
        generate = function ( t )
            local applied = action.consecration.lastCast

            if applied and now - applied < 8 then
                t.count = 1
                t.expires = applied + 8
                t.applied = applied
                t.caster = "player"
                return
            end

            t.count = 0
            t.expires = 0
            t.applied = 0
            t.caster = "nobody"
        end,
    },
    -- Ardent Defender recently prevented your death.
    ardent_defender = {
        id = 66233,
        duration = 120,
        max_stack = 1,
    },
    -- Increases speed by $s2%.
    argent_charger = {
        id = 66906,
        duration = 3600,
        max_stack = 1,
    },
    -- Increases speed by $s2%.
    argent_warhorse = {
        id = 66907,
        duration = 3600,
        max_stack = 1,
    },
    -- Concentration Aura provides immunity to Silence and Interrupt effects.  Effectiveness of all other auras increased by $s1%.
    aura_mastery = {
        id = 31821,
        duration = 6,
        max_stack = 1,
        shared = "player"
    },
    -- Dazed.
    avengers_shield = {
        id = 48827,
        duration = 10,
        max_stack = 1,
        copy = { 31935, 32699, 32700, 48826, 48827 },
    },
    -- All damage and healing caused increased by $s1%.
    avenging_wrath = {
        id = 31884,
        duration = 20,
        max_stack = 1,
    },
    -- Beacon of Light.
    beacon_of_light = {
        id = 53563,
        duration = function() return glyph.beacon_of_light.enabled and 90 or 60 end,
        tick_time = 1.5,
        max_stack = 1,
        dot = "buff"
    },
    blessed_life = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=31830)
        id = 31830,
        duration = 3600,
        max_stack = 1,
        copy = { 31830, 31829, 31828 },
    },
    blessing = {
        alias = { "blessing_of_kings", "blessing_of_light", "blessing_of_might", "blessing_of_salvation", "blessing_of_sanctuary", "blessing_of_wisdom", "greater_blessing_of_kings", "greater_blessing_of_light", "greater_blessing_of_salvation", "greater_blessing_of_sanctuary", "greater_blessing_of_wisdom" },
        aliasMode = "first",
        aliasType = "buff",
    },
    -- Increases speed by $s2%.
    charger = {
        id = 23214,
        duration = 3600,
        max_stack = 1,
    },
    -- $s1 damage every $t1 $lsecond:seconds;.
    consecration = {
        id = 48819,
        duration = function() return glyph.consecration.enabled and 10 or 8 end,
        tick_time = 1,
        max_stack = 1,
        copy = { 20116, 20922, 20923, 20924, 26573, 27173, 48818, 48819 },
    },
    -- Mounted speed increased by $s1%.  This does not stack with other movement speed increasing effects.
    crusader_aura = {
        id = 32223,
        duration = 3600,
        max_stack = 1,
        shared = "player"
    },
    -- Increases armor by $s1.
    devotion_aura = {
        id = 48942,
        duration = 3600,
        max_stack = 1,
        shared = "player",
        copy = { 465, 643, 1032, 10290, 10291, 10292, 10293, 27149, 48941, 48942 },
    },
    -- Critical effect chance of next Flash of Light, Holy Light, or Holy Shock spell increased by $s1%.
    divine_favor = {
        id = 20216,
        duration = 3600,
        max_stack = 1,
    },
    -- Reduced damage taken.
    divine_guardian = {
        id = 70940,
        duration = 6,
        max_stack = 1,
    },
    -- Mana cost of all spells reduced by $s1%.
    divine_illumination = {
        id = 31842,
        duration = 15,
        max_stack = 1,
    },
    -- Complete immunity but unable to move.
    divine_intervention = {
        id = 19753,
        duration = 180,
        max_stack = 1,
    },
    -- Gaining $o1% of total mana.  Healing spells reduced by $s2%.
    divine_plea = {
        id = 54428,
        duration = 15,
        tick_time = 3,
        max_stack = 1,
    },
    -- Damage taken reduced by $s2%.
    divine_protection = {
        id = 498,
        duration = 12,
        max_stack = 1,
    },
    -- $s1% of all damage taken by party members redirected to the Paladin.
    divine_sacrifice = {
        id = 64205,
        duration = 10,
        max_stack = 1,
    },
    -- Immune to all attacks and spells, but reduces all damage you deal by $s1%.
    divine_shield = {
        id = 642,
        duration = 12,
        max_stack = 1,
    },
    forbearance = {
        id = 25771,
        duration = 120,
        max_stack = 1,
        shared = "player"
    },
    -- Stunned.
    hammer_of_justice = {
        id = 10308,
        duration = 6,
        max_stack = 1,
        copy = { 853, 5588, 5589, 10308 },
    },
    -- Immune to movement impairing effects.
    hand_of_freedom = {
        id = 1044,
        duration = function() return 6 + 2 * talent.guardians_favor.rank end,
        max_stack = 1,
    },
    -- Immune to physical attacks.  Cannot attack or use physical abilities.
    hand_of_protection = {
        id = 10278,
        duration = 10,
        max_stack = 1,
        copy = { 1022, 5599, 10278, 66009 },
    },
    -- Taunted.
    hand_of_reckoning = {
        id = 62124,
        duration = 3,
        max_stack = 1,
    },
    -- Transfers $s1% damage taken to the paladin.
    hand_of_sacrifice = {
        id = 6940,
        duration = 12,
        max_stack = 1,
    },
    -- Reduces total threat by $53055s1% each second.
    hand_of_salvation = {
        id = 1038,
        duration = 10,
        tick_time = 1,
        max_stack = 1,
    },
    -- Block chance increased by $s1%.  $s2 Holy damage dealt to attacker when blocked.  $n charges.
    holy_shield = {
        id = 20925,
        duration = 10,
        max_stack = 1,
        copy = { 20925, 20927, 20928, 27179, 48951, 48952 },
    },
    -- Stunned.
    holy_wrath = {
        id = 2812,
        duration = 3,
        max_stack = 1,
        copy = { 2812, 10318, 27139, 48816, 48817 },
    },
    -- Reduces the cast time of your next Flash of Light by ${$54149m2/-1000}.1 sec or increase the critical chance of your next Holy Light by $s1%.
    infusion_of_light = {
        id = 54149,
        duration = 15,
        max_stack = 1,
    },
    -- Casting and melee speed increased by $s1%.
    judgements_of_the_pure = {
        id = 54153,
        duration = 60,
        max_stack = 1,
        copy = { 53655, 53656, 53657, 54152, 54153 },
    },
    judgement = {
        alias = { "judgement_of_justice", "judgement_of_light", "judgement_of_wisdom" },
        aliasMode = "first",
        aliasType = "debuff",
    },
    judgement_of_justice = {
        id = 20184,
        duration = 20,
        max_stack = 1,
    },
    judgement_of_light = {
        id = 20185,
        duration = 20,
        max_stack = 1,
    },
    judgement_of_wisdom = {
        id = 20186,
        duration = 20,
        max_stack = 1,
    },
    -- Physical damage taken reduced by $s1%.
    lay_on_hands = {
        id = 20236,
        duration = 15,
        max_stack = 1,
        copy = { 20233, 20236 },
    },
    -- The paladin's heals on you also heal the Beacon of Light.
    lights_beacon = {
        id = 53651,
        duration = 2,
        max_stack = 1,
    },
    lights_grace = {
        id = 31834,
        duration = 15,
        max_stack = 1
    },
    -- Each weapon swing generates an additional attack.
    reckoning = {
        id = 20178,
        duration = 8,
        max_stack = 4,
    },
    -- Block chance increased by $s1%.  Lasts maximum of $n  blocks.
    redoubt = {
        id = 20132,
        duration = 10,
        max_stack = 5,
        copy = { 20132, 20131, 20128 },
    },
    -- Incapacitated.
    repentance = {
        id = 20066,
        duration = 60,
        max_stack = 1,
    },
    -- Increases the threat generated by your Holy spells by $s1%.
    righteous_fury = {
        id = 25780,
        duration = 3600,
        max_stack = 1,
    },
    righteous_vengeance = {
        id = 61840,
        duration = 8,
        max_stack = 1
    },
    -- Resistance to Disease, Magic and Poison increased by $s1%.
    sacred_cleansing = {
        id = 53659,
        duration = 10,
        max_stack = 1,
    },
    -- Absorbs damage and increases the casting paladin's chance to critically hit with Flash of Light by $s2%.
    sacred_shield = {
        id = 53601,
        duration = function() return 30 * ( 1 + 0.5 * ( buff.divine_sacrifice.up and talent.divine_guardian.rank or 0 ) ) end,
        max_stack = 1,
        no_ticks = true,
        friendly = true
    },
    -- Absorbs damage and increases the casting paladin's chance to critically hit with Flash of Light by 50%.
    sacred_shield_absorb = {
        id = 58597,
        duration = 6,
        max_stack = 1,
    },
    -- Melee attacks deal additional Holy damage.
    seal_of_command = {
        id = 20375,
        duration = 1800,
        max_stack = 1,
    },
    -- Melee attacks have a chance to stun for $20170d.
    seal_of_justice = {
        id = 20164,
        duration = 1800,
        max_stack = 1,
    },
    -- Melee attacks have a chance to heal you.
    seal_of_light = {
        id = 20165,
        duration = 1800,
        max_stack = 1,
    },
    -- Melee attacks cause an additional  ${$MWS*(0.022*$AP+0.044*$SPH)} Holy damage.
    seal_of_righteousness = {
        id = 21084,
        duration = 1800,
        max_stack = 1,
        copy = { 21084, 20154 },
    },
    -- Melee attacks cause Holy damage over $31803d.
    seal_of_vengeance = {
        id = 31801,
        duration = 1800,
        max_stack = 1,
    },
    -- Melee attacks have a chance to restore mana.
    seal_of_wisdom = {
        id = 20166,
        duration = 1800,
        max_stack = 1,
    },
    seal = {
        alias = { "seal_of_command", "seal_of_justice", "seal_of_light", "seal_of_righteousness", "seal_of_vengeance", "seal_of_wisdom" },
        aliasMode = "first",
        aliasType = "buff",
    },
    -- Detecting Undead.
    sense_undead = {
        id = 5502,
        duration = 3600,
        max_stack = 1,
    },
    -- Silenced.
    silenced_shield_of_the_templar = {
        id = 63529,
        duration = 3,
        max_stack = 1,
    },
    -- Stunned.
    stun = {
        id = 20170,
        duration = function() return 2 + 0.5 * talent.judgements_of_the_just.rank end,
        max_stack = 1,
    },
    -- Increases speed by $s2%.
    summon_charger = {
        id = 34767,
        duration = 3600,
        max_stack = 1,
    },
    -- Increases speed by $s2%.
    summon_warhorse = {
        id = 34769,
        duration = 3600,
        max_stack = 1,
    },
    -- Your next Flash of Light or Exorcism spell is instant cast.
    the_art_of_war = {
        id = 59578,
        duration = 15,
        max_stack = 1,
    },
    -- Compelled to flee.
    turn_evil = {
        id = 10326,
        duration = 20,
        max_stack = 1,
    },
    vengeance = {
        id = 20053,
        duration = 3600,
        max_stack = 3,
        copy = { 20052, 20050 }
    },
    -- Attack power reduced by $s1.
    vindication = {
        id = 26017,
        duration = 10,
        max_stack = 1,
        copy = { 67, 26017 },
    },
    -- Increases speed by $s2%.
    warhorse = {
        id = 13819,
        duration = 3600,
        max_stack = 1,
    },
} )


-- Glyphs
spec:RegisterGlyphs( {
    [54930] = "avengers_shield",
    [54938] = "avenging_wrath",
    [63218] = "beacon_of_light",
    [57937] = "blessing_of_kings",
    [57958] = "blessing_of_might",
    [57979] = "blessing_of_wisdom",
    [54935] = "cleansing",
    [54928] = "consecration",
    [54927] = "crusader_strike",
    [63223] = "divine_plea",
    [63220] = "divine_storm",
    [54939] = "divinity",
    [54934] = "exorcism",
    [54936] = "flash_of_light",
    [63231] = "guardian_spirit",
    [54923] = "hammer_of_justice",
    [63219] = "hammer_of_the_righteous",
    [54926] = "hammer_of_wrath",
    [54937] = "holy_light",
    [63224] = "holy_shock",
    [56420] = "holy_wrath",
    [54922] = "judgement",
    [57955] = "lay_on_hands",
    [54929] = "righteous_defense",
    [63225] = "salvation",
    [54925] = "seal_of_command",
    [54943] = "seal_of_light",
    [56414] = "seal_of_righteousness",
    [56416] = "seal_of_vengeance",
    [54940] = "seal_of_wisdom",
    [57947] = "sense_undead",
    [63222] = "shield_of_righteousness",
    [54924] = "spiritual_attunement",
    [57954] = "wise",
    [54931] = "turn_evil",
} )

local mod_blessed_hands = setfenv( function( base )
    return base * ( 1 - 0.15 * talent.blessed_hands.rank )
end, state )

local mod_purifying_power_cd = setfenv( function( base )
    return base * ( 1 - 0.1667 * talent.purifying_power.rank )
end, state )

local mod_purifying_power_cost = setfenv( function( base )
    return base * ( 1 - 0.05 * talent.purifying_power.rank )
end, state )

local mod_divine_illumination = setfenv( function( base )
    return base * ( buff.divine_illumination.up and 0.5 or 1 )
end, state )

local mod_benediction = setfenv( function( base )
    return base * ( 1 - 0.02 * talent.benediction.rank )
end, state )

local mod_art_of_war = setfenv( function( base )
    return base - 0.75 * ( buff.the_art_of_war.up and talent.the_art_of_war.rank or 0 )
end, state )


local aura_assigned

spec:RegisterHook( "reset_precast", function()
    if not aura_assigned then
        class.abilityList.assigned_aura = "|cff00ccff[Assigned Aura]|r"
        class.abilities.assigned_aura = class.abilities[ settings.assigned_aura or "devotion_aura" ]
        aura_assigned = true
    end
end )


-- Abilities
spec:RegisterAbilities( {
    -- Causes your Concentration Aura to make all affected targets immune to Silence and Interrupt effects and improve the effect of all other auras by 100%.  Lasts 6 sec.
    aura_mastery = {
        id = 31821,
        cast = 0,
        cooldown = 120,
        gcd = "off",

        talent = "aura_mastery",
        startsCombat = false,
        texture = 135872,

        toggle = "cooldowns",

        handler = function ()
            applyBuff( "aura_mastery" )
        end,
    },


    -- Hurls a holy shield at the enemy, dealing 477 to 573 Holy damage, Dazing them and then jumping to additional nearby enemies.  Affects 3 total targets.  Lasts 10 sec.
    avengers_shield = {
        id = 31935,
        cast = 0,
        cooldown = 30,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.26 ) ) end,
        spendType = "mana",

        talent = "avengers_shield",
        startsCombat = true,
        texture = 135874,

        handler = function ()
            applyDebuff( "target", "avengers_shield" )
            if talent.shield_of_the_templar.rank == 3 then applyDebuff( "target", "silenced_shield_of_the_templar" ); interrupt() end
        end,
    },


    -- Increases all damage and healing caused by 20% for 20 sec.  Cannot be used within 30 sec of being the target of Divine Shield, Divine Protection, or Hand of Protection, or of using Lay on Hands on oneself.
    avenging_wrath = {
        id = 31884,
        cast = 0,
        cooldown = function() return 180 - 30 * talent.sanctified_wrath.rank end,
        gcd = "off",

        spend = function() return mod_benediction( mod_divine_illumination( 0.08 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135875,

        toggle = "cooldowns",

        nodebuff = "forbearance",

        handler = function ()
            applyBuff( "avenging_wrath" )
        end,
    },


    -- The target becomes a Beacon of Light to all members of your party or raid within a 60 yard radius.  Any heals you cast on party or raid members will also heal the Beacon for 100% of the amount healed.  Only one target can be the Beacon of Light at a time. Lasts 1 min.
    beacon_of_light = {
        id = 53563,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.35 ) ) end,
        spendType = "mana",

        talent = "beacon_of_light",
        startsCombat = false,
        texture = 236247,

        handler = function ()
            applyBuff( "beacon_of_light" )
        end,
    },


    -- Places a Blessing on the friendly target, increasing total stats by 10% for 10 min.  Players may only have one Blessing on them per Paladin at any one time.
    blessing_of_kings = {
        id = 20217,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( glyph.blessing_of_kings.enabled and 0.03 or 0.06 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135995,

        handler = function ()
            removeBuff( "blessing" )
            applyBuff( "blessing_of_kings" )
        end,
    },


    -- Places a Blessing on the friendly target, increasing attack power by 20 for 10 min.  Players may only have one Blessing on them per Paladin at any one time.
    blessing_of_might = {
        id = 19740,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.05 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135906,

        handler = function ()
            removeBuff( "blessing" )
            applyBuff( "blessing_of_kings" )
        end,

        copy = { 19834, 19835, 19836, 19837, 19838, 25291, 27140, 48931, 48932 },
    },


    -- Places a Blessing on the friendly target, reducing damage taken from all sources by 3% for 10 min and increasing strength and stamina by 10%.  In addition, when the target blocks, parries, or dodges a melee attack the target will gain 2% of maximum displayed mana.  Players may only have one Blessing on them per Paladin at any one time.
    blessing_of_sanctuary = {
        id = 20911,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.07 ) ) end,
        spendType = "mana",

        talent = "blessing_of_sanctuary",
        startsCombat = false,
        texture = 136051,

        handler = function ()
            removeBuff( "blessing" )
            applyBuff( "blessing_of_sanctuary" )
        end,
    },


    -- Places a Blessing on the friendly target, restoring 10 mana every 5 seconds for 10 min.  Players may only have one Blessing on them per Paladin at any one time.
    blessing_of_wisdom = {
        id = 19742,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.05 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135970,

        handler = function ()
            removeBuff( "blessing" )
            applyBuff( "blessing_of_wisdom" )
        end,

        copy = { 19850, 19852, 19853, 19854, 25290, 27142, 48935, 48936 },
    },


    -- Cleanses a friendly target, removing 1 poison effect, 1 disease effect, and 1 magic effect.
    cleanse = {
        id = 4987,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( mod_purifying_power_cost( 0.06 ) ) * ( glyph.cleansing.enabled and 0.8 or 1 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135953,

        buff = function()
            if buff.dispellable_poison.up then return "dispellable_poison" end
            if buff.dispellable_disease.up then return "dispellable_disease" end
            return "dispellable_magic"
        end,

        handler = function ()
            removeBuff( "dispellable_poison" )
            removeBuff( "dispellable_disease" )
            removeBuff( "dispellable_magic" )
        end,
    },


    -- All party or raid members within 40 yards lose 35% less casting or channeling time when damaged.  Players may only have one Aura on them per Paladin at any one time.
    concentration_aura = {
        id = 19746,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        startsCombat = false,
        texture = 135933,

        handler = function ()
            removeBuff( "aura" )
            applyBuff( "concentration_aura" )
        end,
    },


    -- Consecrates the land beneath the Paladin, doing 239 Holy damage over 8 sec to enemies who enter the area.
    consecration = {
        id = 26573,
        cast = 0,
        cooldown = function() return glyph.consecration.enabled and 10 or 8 end,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( mod_purifying_power_cost( 0.22 ) ) ) end,
        spendType = "mana",

        startsCombat = true,
        texture = 135926,

        handler = function ()
            applyBuff( "active_consecration" )
            applyDebuff( "target", "consecration" )
        end,

        copy = { 20116, 20922, 20923, 20924, 27173, 48818, 48819 },
    },


    -- Increases the mounted speed by 20% for all party and raid members within 40 yards.  Players may only have one Aura on them per Paladin at any one time.  This does not stack with other movement speed increasing effects.
    crusader_aura = {
        id = 32223,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        startsCombat = false,
        texture = 135890,

        handler = function ()
            removeBuff( "aura" )
            applyBuff( "crusader_aura" )
        end,
    },


    -- An instant strike that causes 75% weapon damage.
    crusader_strike = {
        id = 35395,
        cast = 0,
        cooldown = 4,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.05 ) ) * ( glyph.crusader_strike.enabled and 0.8 or 1 ) end,
        spendType = "mana",

        talent = "crusader_strike",
        startsCombat = true,
        texture = 135891,

        handler = function ()
        end,
    },


    -- Gives 1205 additional armor to party and raid members within 40 yards.  Players may only have one Aura on them per Paladin at any one time.
    devotion_aura = {
        id = 48942,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        startsCombat = false,
        texture = 135893,

        nobuff = "devotion_aura",

        handler = function ()
            removeBuff( "aura" )
            applyBuff( "devotion_aura" )
        end,
    },


    -- When activated, gives your next Flash of Light, Holy Light, or Holy Shock spell a 100% critical effect chance.
    divine_favor = {
        id = 20216,
        cast = 0,
        cooldown = 120,
        gcd = "off",

        spend = function() return mod_benediction( mod_divine_illumination( 0.03 ) ) end,
        spendType = "mana",

        talent = "divine_favor",
        startsCombat = false,
        texture = 135915,

        toggle = "cooldowns",

        handler = function ()
            applyBuff( "divine_favor" )
        end,
    },


    -- Reduces the mana cost of all spells by 50% for 15 sec.
    divine_illumination = {
        id = 31842,
        cast = 0,
        cooldown = 180,
        gcd = "off",

        talent = "divine_illumination",
        startsCombat = false,
        texture = 135895,

        toggle = "cooldowns",

        handler = function ()
            applyBuff( "divine_illumination" )
        end,
    },


    -- The paladin sacrifices herself to remove the targeted party member from harm's way.  Enemies will stop attacking the protected party member, who will be immune to all harmful attacks but will not be able to take any action for 3 min.
    divine_intervention = {
        id = 19752,
        cast = 0,
        cooldown = 600,
        gcd = "spell",

        startsCombat = false,
        texture = 136106,

        toggle = "cooldowns",

        handler = function ()
            applyBuff( "target", "divine_intervention" )
            health.current = 0
        end,
    },


    -- You gain 25% of your total mana over 15 sec, but the amount healed by your Flash of Light, Holy Light, and Holy Shock spells is reduced by 50%.
    divine_plea = {
        id = 54428,
        cast = 0,
        cooldown = 60,
        gcd = "spell",

        startsCombat = false,
        texture = 237537,

        toggle = "cooldowns",

        handler = function ()
            applyBuff( "divine_plea" )
        end,
    },


    -- Reduces all damage taken by 50% for 12 sec.  Once protected, the target cannot be targeted by Divine Shield, Divine Protection, or Hand of Protection again for 2 min.  Cannot be used within 30 sec of using Avenging Wrath.
    divine_protection = {
        id = 498,
        cast = 0,
        cooldown = function() return 180 - 30 * talent.sacred_duty.rank end,
        gcd = "off",

        spend = function() return mod_benediction( mod_divine_illumination( 0.03 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135954,

        toggle = "defensives",

        nodebuff = "forbearance",

        handler = function ()
            applyBuff( "divine_protection" )
            applyDebuff( "player", "forbearance" )
        end,
    },


    -- 30% of all damage taken by party members within 30 yards is redirected to the Paladin (up to a maximum of 40% of the Paladin's health times the number of party members).  Damage which reduces the Paladin below 20% health will break the effect.  Lasts 10 sec.
    divine_sacrifice = {
        id = 64205,
        cast = 0,
        cooldown = 120,
        gcd = "spell",

        talent = "divine_sacrifice",
        startsCombat = false,
        texture = 253400,

        toggle = "cooldowns",

        handler = function ()
            applyBuff( "divine_sacrifice" )
        end,
    },


    -- Protects the paladin from all damage and spells for 12 sec, but reduces all damage you deal by 50%.  Once protected, the target cannot be targeted by Divine Shield, Divine Protection, or Hand of Protection again for 2 min.  Cannot be used within 30 sec. of using Avenging Wrath.
    divine_shield = {
        id = 642,
        cast = 0,
        cooldown = function() return 300 - 30 * talent.sacred_duty.rank end,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.03 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135896,

        toggle = "defensives",

        nodebuff = "forbearance",

        handler = function ()
            applyBuff( "divine_shield" )
            applyDebuff( "player", "forbearance" )
        end,
    },


    -- An instant weapon attack that causes 110% of weapon damage to up to 4 enemies within 8 yards.  The Divine Storm heals up to 3 party or raid members totaling 25% of the damage caused.
    divine_storm = {
        id = 53385,
        cast = 0,
        cooldown = 10,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.12 ) ) end,
        spendType = "mana",

        talent = "divine_storm",
        startsCombat = true,
        texture = 236250,

        handler = function ()
        end,
    },


    -- Causes 180 to 194 Holy damage to an enemy target.  If the target is Undead or Demon, it will always critically hit.
    exorcism = {
        id = 879,
        cast = function() return mod_art_of_war( 1.5 ) end,
        cooldown = function() return mod_benediction( mod_purifying_power_cd( 15 ) ) end,
        gcd = "spell",

        spend = 0.08,
        spendType = "mana",

        startsCombat = true,
        texture = 135903,

        handler = function ()
        end,

        copy = { 5614, 5615, 10312, 10313, 10314, 27138, 48800, 48801 },
    },


    -- Gives 130 additional Fire resistance to all party and raid members within 40 yards.  Players may only have one Aura on them per Paladin at any one time.
    fire_resistance_aura = {
        id = 48947,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        startsCombat = false,
        texture = 135824,

        nobuff = "fire_resistance_aura",

        handler = function ()
            removeBuff( "aura" )
            applyBuff( "fire_resistance_aura" )
        end,
    },


    -- Heals a friendly target for 86 to 98.
    flash_of_light = {
        id = 19750,
        cast = function() return mod_art_of_war( 1.5 ) - 0.75 * ( buff.infusion_of_light.up and talent.infusion_of_light.rank or 0 ) end,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_divine_illumination( 0.07 ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135907,

        handler = function ()
            removeBuff( "divine_favor" )
            removeBuff( "infusion_of_light" )
        end,

        copy = { 19939, 19940, 19941, 19942, 19943, 27137, 48784, 48785 },
    },


    -- Gives 130 additional Frost resistance to all party and raid members within 40 yards.  Players may only have one Aura on them per Paladin at any one time.
    frost_resistance_aura = {
        id = 48945,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        startsCombat = false,
        texture = 135865,

        nobuff = "frost_resistance_aura",

        handler = function ()
            removeBuff( "aura" )
            applyBuff( "frost_resistance_aura" )
        end,
    },


    -- Gives all members of the raid or group that share the same class with the target the Greater Blessing of Kings, increasing total stats by 10% for 30 min.  Players may only have one Blessing on them per Paladin at any one time.
    greater_blessing_of_kings = {
        id = 25898,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( glyph.blessing_of_kings.enabled and 0.06 or 0.12 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135993,

        item = 21177,
        bagItem = true,

        handler = function ()
            removeBuff( "my_greater_blessing" )
            applyBuff( "greater_blessing_of_kings" )
        end,
    },


    -- Gives all members of the raid or group that share the same class with the target the Greater Blessing of Might, increasing attack power by 185 for 30 min.  Players may only have one Blessing on them per Paladin at any one time.
    greater_blessing_of_might = {
        id = 25782,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.1 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135908,

        item = 21177,
        bagItem = true,

        handler = function ()
            removeBuff( "my_greater_blessing" )
            applyBuff( "greater_blessing_of_might" )
        end,

        copy = { 25916, 27141, 48933, 48934 },
    },


    -- Gives all members of the raid or group that share the same class with the target the Greater Blessing of Wisdom, restoring 30 mana every 5 seconds for 30 min.  Players may only have one Blessing on them per Paladin at any one time.
    greater_blessing_of_wisdom = {
        id = 25894,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.11 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135912,

        item = 21177,
        bagItem = true,

        handler = function ()
            removeBuff( "my_greater_blessing" )
            applyBuff( "greater_blesisng_of_wisdom" )
        end,

        copy = { 25918, 27143, 48937, 48938 },
    },


    -- Stuns the target for 3 sec and interrupts non-player spellcasting for 3 sec.
    hammer_of_justice = {
        id = 853,
        cast = 0,
        cooldown = function() return 60 - 10 * talent.improved_hammer_of_justice.rank - 5 * talent.judgements_of_the_just.rank end,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.03 ) ) end,
        spendType = "mana",

        startsCombat = true,
        texture = 135963,

        toggle = "interrupts",

        handler = function ()
            applyDebuff( "target", "hammer_of_justice" )
        end,

        copy = { 5588, 5589, 10308 },
    },


    -- Hammer the current target and up to 2 additional nearby targets, causing 4 times your main hand damage per second as Holy damage.
    hammer_of_the_righteous = {
        id = 53595,
        cast = 0,
        cooldown = 6,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.06 ) ) end,
        spendType = "mana",

        talent = "hammer_of_the_righteous",
        startsCombat = true,
        texture = 236253,

        handler = function ()
        end,
    },


    -- Hurls a hammer that strikes an enemy for 441 to 477 Holy damage.  Only usable on enemies that have 20% or less health.
    hammer_of_wrath = {
        id = 24275,
        cast = 0,
        cooldown = function() return glyph.avenging_wrath.enabled and buff.avenging_wrath.up and 3 or 6 end,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( glyph.hammer_of_wrath.enabled and 0 or 0.12 ) ) end,
        spendType = "mana",

        startsCombat = true,
        texture = 132326,

        usable = function() return target.health.pct < 20 end,

        handler = function ()
        end,

        copy = { 24274, 24239, 27180, 48805, 48806 },
    },


    -- Places a Hand on the friendly target, granting immunity to movement impairing effects for 6 sec.  Players may only have one Hand on them per Paladin at any one time.
    hand_of_freedom = {
        id = 1044,
        cast = 0,
        cooldown = 25,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( mod_blessed_hands( 0.06 ) ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135968,

        handler = function ()
            applyBuff( "hand_of_freedom" )
        end,
    },


    -- A targeted party or raid member is protected from all physical attacks for 6 sec, but during that time they cannot attack or use physical abilities.  Players may only have one Hand on them per Paladin at any one time.  Once protected, the target cannot be targeted by Divine Shield, Divine Protection, or Hand of Protection again for 2 min.  Cannot be targeted on players who have used Avenging Wrath within the last 30 sec.
    hand_of_protection = {
        id = 10278,
        cast = 0,
        cooldown = function() return 300 - 60 * talent.guardians_favor.rank end,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.06 ) ) end,
        spendType = "mana",

        startsCombat = true,
        texture = 135964,

        toggle = "defensives",

        nodebuff = "forbearance",

        handler = function ()
            applyBuff( "hand_of_protection" )
            applyDebuff( "forbearance" )
        end,

        copy = { 1022, 5599 },
    },


    -- Taunts the target to attack you.  If the target is tauntable and not currently targeting you, causes 262 Holy damage.
    hand_of_reckoning = {
        id = 62124,
        cast = 0,
        cooldown = 8,
        gcd = "off",

        spend = 0.03,
        spend = function() return mod_benediction( mod_divine_illumination( 0.03 ) ) end,
        spendType = "mana",

        startsCombat = true,
        texture = 135984,

        handler = function ()
            applyDebuff( "target", "hand_of_reckoning" )
        end,
    },


    -- Places a Hand on the party or raid member, transfering 30% damage taken to the caster.  Lasts 12 sec or until the caster has transfered 100% of their maximum health.  Players may only have one Hand on them per Paladin at any one time.
    hand_of_sacrifice = {
        id = 6940,
        cast = 0,
        cooldown = 120,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( mod_blessed_hands( 0.06 ) ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135966,

        toggle = "defensives",

        handler = function ()
            applyBuff( "hand_of_sacrifice" )
        end,
    },


    -- Places a Hand on the party or raid member, reducing their total threat by 2% every 1 sec. for 10 sec.  Players may only have one Hand on them per Paladin at any one time.
    hand_of_salvation = {
        id = 1038,
        cast = 0,
        cooldown = 120,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( mod_blessed_hands( 0.06 ) ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135967,

        toggle = "defensives",

        handler = function ()
            applyBuff( "hand_of_salvation" )
        end,
    },


    -- Heals a friendly target for 53 to 64.
    holy_light = {
        id = 635,
        cast = function() return 2.5 - ( 0.5 * buff.lights_grace.stack ) end,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_divine_illumination( 0.29 ) end,
        spendType = "mana",

        startsCombat = true,
        texture = 135920,

        handler = function ()
            removeBuff( "divine_favor" )
            removeBuff( "infusion_of_light" )
            if talent.lights_grace.rank == 3 then applyBuff( "lights_grace" ) end
        end,

        copy = { 639, 647, 1026, 1042, 3472, 10328, 10329, 25292, 27135, 27136, 48781, 48782 },
    },


    -- Increases chance to block by 30% for 10 sec and deals 79 Holy damage for each attack blocked while active.  Each block expends a charge.  8 charges.
    holy_shield = {
        id = 20925,
        cast = 0,
        cooldown = 8,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.1 ) ) end,
        spendType = "mana",

        talent = "holy_shield",
        startsCombat = false,
        texture = 135880,

        handler = function ()
            applyBuff( "holy_shield" )
        end,
    },


    -- Blasts the target with Holy energy, causing 314 to 340 Holy damage to an enemy, or 481 to 519 healing to an ally.
    holy_shock = {
        id = 20473,
        cast = 0,
        cooldown = function() return glyph.holy_shock.enabled and 5 or 6 end,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.18 ) ) end,
        spendType = "mana",

        talent = "holy_shock",
        startsCombat = true,
        texture = 135972,

        handler = function ()
            removeBuff( "divine_favor" )
        end,
    },


    -- Sends bolts of holy power in all directions, causing 442 to 514 Holy damage and stunning all Undead and Demon targets within 10 yds for 3 sec.
    holy_wrath = {
        id = 2812,
        cast = 0,
        cooldown = function() return mod_purifying_power_cd( glyph.holy_wrath.enabled and 15 or 30 ) end,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.2 ) ) end,
        spendType = "mana",

        startsCombat = true,
        texture = 135902,

        handler = function ()
            if target.is_boss and ( target.is_undead or target.is_demon ) then applyDebuff( "target", "holy_wrath" ) end
        end,

        copy = { 10318, 27139, 48816, 48817 },
    },


    -- Unleashes the energy of a Seal spell to judge an enemy for 20 sec, preventing them from fleeing and limiting their movement speed.  Refer to individual Seals for additional Judgement effect.  Only one Judgement per Paladin can be active at any one time.
    judgement_of_justice = {
        id = 53407,
        cast = 0,
        cooldown = function() return 10 - talent.improved_judgements.rank end,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.05 ) ) end,
        spendType = "mana",

        startsCombat = true,
        texture = 236258,

        handler = function ()
            if talent.judgements_of_the_pure.enabled then applyBuff( "judgements_of_the_pure" ) end
            if talent.judgements_of_the_just.enabled then applyDebuff( "target", "judgements_of_the_just" ) end
            if talent.judgements_of_the_wise.rank == 3 then gain( 0.25 * mana.modmax, "mana" ) end
            if glyph.seal_of_command.enabled and buff.seal_of_command.up then gain( 0.08 * mana.modmax, "mana" ) end
            removeDebuff( "target", "judgement" )
            applyDebuff( "target", "judgement_of_justice" )
            setCooldown( "judgement_of_light", action.judgement_of_light.cooldown )
            setCooldown( "judgement_of_wisdom", action.judgement_of_wisdom.cooldown )
        end,
    },


    -- Unleashes the energy of a Seal spell to judge an enemy for 20 sec, granting attacks made against the judged enemy a chance of healing the attacker for 2% of their maximum health.  Refer to individual Seals for additional Judgement effect.  Only one Judgement per Paladin can be active at any one time.
    judgement_of_light = {
        id = 20271,
        cast = 0,
        cooldown = function() return 10 - talent.improved_judgements.rank end,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.05 ) ) end,
        spendType = "mana",

        startsCombat = true,
        texture = 135959,

        handler = function ()
            if talent.judgements_of_the_pure.enabled then applyBuff( "judgements_of_the_pure" ) end
            if talent.judgements_of_the_just.enabled then applyDebuff( "target", "judgements_of_the_just" ) end
            if talent.judgements_of_the_wise.rank == 3 then gain( 0.25 * mana.modmax, "mana" ) end
            if glyph.seal_of_command.enabled and buff.seal_of_command.up then gain( 0.08 * mana.modmax, "mana" ) end
            removeDebuff( "target", "judgement" )
            applyDebuff( "target", "judgement_of_light" )
            setCooldown( "judgement_of_justice", action.judgement_of_justice.cooldown )
            setCooldown( "judgement_of_wisdom", action.judgement_of_wisdom.cooldown )
        end,
    },


    -- Unleashes the energy of a Seal spell to judge an enemy for 20 sec, giving each attack a chance to restore 2% of the attacker's base mana.  Refer to individual Seals for additional Judgement effect.  Only one Judgement per Paladin can be active at any one time.
    judgement_of_wisdom = {
        id = 53408,
        cast = 0,
        cooldown = function() return 10 - talent.improved_judgements.rank end,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.05 ) ) end,
        spendType = "mana",

        startsCombat = true,
        texture = 236255,

        handler = function ()
            if talent.judgements_of_the_pure.enabled then applyBuff( "judgements_of_the_pure" ) end
            if talent.judgements_of_the_just.enabled then applyDebuff( "target", "judgements_of_the_just" ) end
            if talent.judgements_of_the_wise.rank == 3 then gain( 0.25 * mana.modmax, "mana" ) end
            if glyph.seal_of_command.enabled and buff.seal_of_command.up then gain( 0.08 * mana.modmax, "mana" ) end
            removeDebuff( "target", "judgement" )
            applyDebuff( "target", "judgement_of_wisdom" )
            setCooldown( "judgement_of_justice", action.judgement_of_justice.cooldown )
            setCooldown( "judgement_of_light", action.judgement_of_light.cooldown )
        end,
    },


    -- Heals a friendly target for an amount equal to the Paladin's maximum health and restores 1950 of their mana.  If used on self, the Paladin cannot be targeted by Divine Shield, Divine Protection, Hand of Protection, or self-targeted Lay on Hands again for 2 min.  Also cannot be used on self within 30 sec of using Avenging Wrath.
    lay_on_hands = {
        id = 48788,
        cast = 0,
        cooldown = function() return mod_benediction( ( glyph.lay_on_hands.enabled and 900 or 1200 ) - ( 120 * talent.improved_lay_on_hands.rank ) ) end,
        gcd = "spell",

        startsCombat = true,
        texture = 135928,

        toggle = "defensives",

        handler = function ()
            gain( 1950, "mana" )
            if glyph.divinity.enabled then
                gain( 3900, "mana" )
            end
            if talent.improved_lay_on_hands.enabled then applyBuff( "lay_on_hands" ) end
            applyDebuff( "player", "forbearance" )
        end,
    },


    -- Purifies the friendly target, removing 1 disease effect and 1 poison effect.
    purify = {
        id = 1152,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( mod_purifying_power_cost( 0.06 ) ) ) * ( glyph.cleansing.enabled and 0.8 or 1 ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135949,

        buff = function() return buff.dispellable_disease.up and "dispellable_disease" or "dispellable_poison" end,

        handler = function ()
            removeBuff( "dispellable_disease" )
            removeBuff( "dispellable_poison" )
        end,
    },


    -- Brings a dead player back to life with 65 health and 120 mana.  Cannot be cast when in combat.
    redemption = {
        id = 7328,
        cast = 10,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_divine_illumination( 0.64 ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135955,

        handler = function ()
        end,

        copy = { 10322, 10324, 20772, 20773, 48949, 48950 },
    },


    -- Puts the enemy target in a state of meditation, incapacitating them for up to 1 min, and removing the effect of Righteous Vengeance.  Any damage caused will awaken the target.  Usable against Demons, Dragonkin, Giants, Humanoids and Undead.
    repentance = {
        id = 20066,
        cast = 0,
        cooldown = 60,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.09 ) ) end,
        spendType = "mana",

        talent = "repentance",
        startsCombat = false,
        texture = 135942,

        toggle = "defensives",

        usable = function() return not target.is_boss, "not usable against bosses" end,

        handler = function ()
            applyDebuff( "target", "repentance" )
            removeDebuff( "target", "righteous_vengeance" )
        end,
    },


    -- Causes 112 Holy damage to any enemy that strikes a party or raid member within 40 yards.  Players may only have one Aura on them per Paladin at any one time.
    retribution_aura = {
        id = 54043,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        startsCombat = false,
        texture = 135873,

        nobuff = "retribution_aura",

        handler = function ()
            removeBuff( "aura" )
            applyBuff( "retribution_aura" )
        end,
    },


    -- Come to the defense of a friendly target, commanding up to 3 enemies attacking the target to attack the Paladin instead.
    righteous_defense = {
        id = 31789,
        cast = 0,
        cooldown = 8,
        gcd = "off",

        startsCombat = true,
        texture = 135068,

        handler = function ()
        end,
    },


    -- Increases the threat generated by your Holy spells by 80%.  Lasts until cancelled.
    righteous_fury = {
        id = 25780,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        startsCombat = false,
        texture = 135962,

        handler = function ()
            applyBuff( "righteous_fury" )
        end,
    },


    -- Each time the target takes damage they gain a Sacred Shield, absorbing 500 damage and increasing the paladin's chance to critically hit with Flash of Light by 50% for up to 6 sec.  They cannot gain this effect more than once every 6 sec.  Lasts 30 sec.  This spell cannot be on more than one target at any one time.
    sacred_shield = {
        id = 53601,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.12 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 236249,

        handler = function ()
            applyBuff( "sacred_shield" )
        end,
    },


    -- All melee attacks deal 27 to 27 additional Holy damage.  When used with attacks or abilities that strike a single target, this additional Holy damage will strike up to 2 additional targets.  Lasts 30 min.    Unleashing this Seal's energy will judge an enemy, instantly causing 56 to 56 Holy damage.
    seal_of_command = {
        id = 20375,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.14 ) ) end,
        spendType = "mana",

        talent = "seal_of_command",
        startsCombat = false,
        texture = 132347,

        handler = function ()
            removeBuff( "seal" )
            applyBuff( "seal_of_command" )
        end,
    },


    -- Fills the Paladin with the spirit of justice for 30 min, giving each melee attack a chance to stun for 2 sec.  Only one Seal can be active on the Paladin at any one time.    Unleashing this Seal's energy will deal 85 Holy damage to an enemy.
    seal_of_justice = {
        id = 20164,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.14 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135971,

        handler = function ()
            removeBuff( "seal" )
            applyBuff( "seal_of_justice" )
        end,
    },


    -- Fills the Paladin with divine light for 30 min, giving each melee attack a chance to heal the Paladin for 78.  Only one Seal can be active on the Paladin at any one time.    Unleashing this Seal's energy will deal 85 Holy damage to an enemy.
    seal_of_light = {
        id = 20165,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.14 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135917,

        handler = function ()
            removeBuff( "seal" )
            applyBuff( "seal_of_light" )
        end,
    },


    -- Fills the Paladin with holy spirit for 30 min, granting each melee attack 23 additional Holy damage.  Only one Seal can be active on the Paladin at any one time.    Unleashing this Seal's energy will cause 105 Holy damage to an enemy.
    seal_of_righteousness = {
        id = 21084,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.14 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 132325,

        handler = function ()
            removeBuff( "seal" )
            applyBuff( "seal_of_righteousness" )
        end,
    },


    -- Fills the Paladin with holy power, causing attacks to apply Holy Vengeance, which deals [(0.013 * Spell power + 0.025 * Attack power) * 5] additional Holy damage over 15 sec.  Holy Vengeance can stack up to 5 times.  Each of the Paladin's attacks also deals up to 33% weapon damage as additional Holy damage, based on the number of stacks.  Only one Seal can be active on the Paladin at any one time.  Lasts 30 min.  Unleashing this Seal's energy will deal (1 + 0.22 * Spell power + 0.14 * Attack power) Holy damage to an enemy, increased by 10% for each application of Holy Vengeance on the target.
    seal_of_vengeance = {
        id = 31801,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.14 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135969,

        handler = function ()
            removeBuff( "seal" )
            applyBuff( "seal_of_vengeance" )
        end,
    },


    -- Fills the Paladin with divine wisdom for 30 min, giving each melee attack a chance to restore 4% of the paladin's maximum mana.  Only one Seal can be active on the Paladin at any one time.    Unleashing this Seal's energy will deal 85 Holy damage to an enemy.
    seal_of_wisdom = {
        id = 20166,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.14 ) * ( glyph.wise.enabled and 0.5 or 1 ) ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135960,

        handler = function ()
            removeBuff( "seal" )
            applyBuff( "seal_of_wisdom" )
        end,
    },


    -- Shows the location of all nearby undead on the minimap until cancelled.   Only one form of tracking can be active at a time.
    sense_undead = {
        id = 5502,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        startsCombat = false,
        texture = 135974,

        handler = function ()
            if buff.sense_undead.up then removeBuff( "sense_undead" )
            else applyBuff( "sense_undead" ) end
        end,
    },


    -- Gives 130 additional Shadow resistance to all party and raid members within 40 yards.  Players may only have one Aura on them per Paladin at any one time.
    shadow_resistance_aura = {
        id = 48943,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        startsCombat = false,
        texture = 136192,

        nobuff = "shadow_resistance_aura",

        handler = function ()
            removeBuff( "aura" )
            applyBuff( "shadow_resistance_aura" )
        end,
    },


    -- Slam the target with your shield, causing Holy damage based on your block value plus an additional 390.
    shield_of_righteousness = {
        id = 53600,
        cast = 0,
        cooldown = 6,
        gcd = "spell",

        spend = function() return mod_benediction( mod_divine_illumination( 0.06 ) ) * ( glyph.shield_of_righteousness.enabled and 0.2 or 1 ) end,
        spendType = "mana",

        startsCombat = true,
        texture = 236265,

        equipped = "shield",

        handler = function ()
        end,

        copy = { 61411 },
    },


    -- The targeted undead or demon enemy will be compelled to flee for up to 20 sec.  Damage caused may interrupt the effect.  Only one target can be turned at a time.
    turn_evil = {
        id = 10326,
        cast = function() return glyph.turn_evil.enabled and 0 or 1.5 end,
        cooldown = function() return glyph.turn_evil.enabled and 8 or 0 end,
        gcd = "spell",

        spend = function() return mod_divine_illumination( 0.09 ) end,
        spendType = "mana",

        startsCombat = false,
        texture = 135983,

        usable = function() return target.is_undead or target.is_demon, "target must be undead or demon" end,

        handler = function ()
            applyDebuff( "target", "turn_evil" )
        end,
    },
} )


local auras = {}

spec:RegisterSetting( "assigned_aura", "retribution_aura", {
    type = "select",
    name = "Assigned Aura",
    desc = "Select the Aura that should be recommended by the addon.  It is referenced as |cff00ccff[Assigned Aura]|r in your priority.",
    width = "full",
    values = function()
        table.wipe( auras )

        auras.devotion_aura = class.abilityList.devotion_aura
        auras.retribution_aura = class.abilityList.retribution_aura
        auras.concentration_aura = class.abilityList.concentration_aura
        auras.shadow_resistance_aura = class.abilityList.shadow_resistance_aura
        auras.frost_resistance_aura = class.abilityList.frost_resistance_aura
        auras.fire_resistance_aura = class.abilityList.fire_resistance_aura
        auras.crusader_aura = class.abilityList.crusader_aura

        return auras
    end,
    set = function( _, val )
        Hekili.DB.profile.specs[ 2 ].settings.assigned_aura = val
        class.abilities.assigned_aura = class.abilities[ val ]
    end,
} )


spec:RegisterOptions( {
    enabled = true,

    aoe = 3,

    gcd = 21084,

    nameplates = true,
    nameplateRange = 8,

    damage = false,
    damageExpiration = 6,

    potion = "speed",

    package = "Retribution (wowtbc.gg)",

    -- package1 = "",
    -- package2 = "",
    -- package3 = "",
} )


spec:RegisterPack( "Retribution (wowtbc.gg)", 20221002, [[Hekili:Ls1YUTnmqWVLGaKlTr2YopAlIZHEl(qBrvb6nksjUwInsKcKuX1x43ExkfBtjlNwGcdylto7Sp0odjM8dscNzbYxwmFXI45ZxefF3YL3UKKy31aKKgw(ZSc8bjRg)(7GvlYATcL0F3UkfJ75WOA1549LwBJ5tZMTvT1MLhvuGpzREEwEfZyUUOvWbZm9rsUUHvX4c5msswROY(KKKnzffJvKPbYXJXSi4COhjyYjj)OuyC0gTqPf2DoQ)FzmdWDuL0rTLGJEOIC0FQz2shTRAIijvcJ10niGnS2kl(4x6gmGKLvbCYNjj5iXGwW8L5MnrgGvfXvBrYVYrz5wXlqkiHAbGPELJgts8N6NsESPQnPVaYcGjXPK13e)h8)4K8NRQRzsUN9L)JSFkjArrPfuTgjymEQUXt1EumFpiKfPB9tWWuGiVnejx8IqcPnvaBeS7cH1O6)DaI7dr0AGuS4RnJa9HZ2I4qGf1a46O06Op4O3p)iD)QLxa14n(MDRWWv1E2(yykhGPYpqgL745HWlz11GUJVjMkXNFt6TFT(6e0yv6UsmErysZ1TgghtRbLspdJt6YjEx0Z0iG3C2Q7chTwHbweKuL0a5yt6)Np6BF79mu3LY09JAMoQT5ivWVv6CHPVZU7S0yz6cWgjmPCOwfSVwQQ29682IFsA0aU)NXokE3JmWSjL1QhTo2fmwCsSrXvSNQBuAR33yrVSZBF05pe5wJC2AlvAmG9Ej(eR2iQWxaxEPJg4o6OFR3zZT2Fds3xZTQmqJpJ(AU1U198BIou7VB1m0LuuibExPgacV6eFK3l2SAOE(QHRuRINk(x9j(Rr)4KrpWG4uocdzOBr4nbUdHh37geEYb1F4HtOH9fsOU)H7NF2i6u0H3osaprH2jD854TMqJKKNJMbHeiO80FrVIleYEHYHr9jIQbTYbzHh)y1JFzN8Nd]] )

spec:RegisterPack( "Protection Paladin (wowtbc.gg)", 20221002, [[Hekili:LAv3Unkpq0hMkv1QVVsG0nB6UQzVyVR5IUvIvAVdWGNaElyJSnjksr8SVJHgW8tuRuvLACSN5mNz8mhNaVGFh4tjAi45LUlx656U0XBT7dRwf4Rpwcb(LKKxjP4coPa))lsHgs0mbVo6fsoHYWf3CqCqhN4KMERXHJ5cc1aSsujtqNY06s13xSOZmCLo)1fj5eL6U0kgfulk7q(UYwGxe4hxXY1pXdINNL3JXOesWTXGWOuO1sqLe4)7mMQoQuYesM(yDumrb06idX1zqDuhzQJ(JKOZQJAiItGFotPvnfgyhPkxJlFUPqbCsCoqd(zGFcckizedf3TZrbKChQ4ac(11remn2dHahkyasIFuh5f4tAsoKXOTHIDHjIIccNgOn0)tG(MzrFpWtbchl)i(3)bXFkmswAMgevkoOugO(IbQZwrmrHXtdpyQG2HaTCLTLu2EghclZbYiZ(QTzLI2phyXABlQuqis(c1iJE4IP4B1lQq7OijsGgQYyqoTPY5ALY2hAG8BtsvqQoF(WO75(EHFqZqZ94nyJirMcAhMkKcfMoZtNS3SItbcYZB7PrMi)4BvBtyVCBjjnvkg5xFQ5T0o3YiffG0CDJtg9x5JZX7T9jrWvqcsKP3xEd6rAd60EPr(S6IzcoKqCkbujHRRJESoAT1L2FROPqbEIjahykQOObUbDvdmk3WIHrh)APeW5Xys)W(zNLGwYIRmFjKujh3(E5rxnjhdPdRav22JnwDPF4Uk5rNZ(0hObN)bgBXTvkC6B0O75Tnj7R4N9JTFkOkAQBT)5VhNemw0Phh4FGi5nrZ)PIsHuBeBx2Qwz6SBevDQ3Ak1IDSC8zHRUcFdzM3t2AoaD9xjArmiX1yqQ3wVTflLt3L1)Tzb(cclLJLxZDZ8MmSW()SDB(yxnZJ2KYRbWPfX335Mc6LCUZD0Prpy05sNS91d1y(H3CE39GW76)Mz9FW07umSDz4Zc2Ny9mG92TY(270jZpGk2k0gkCjP9nUtOtV0T9r9YPwW1vgV(Mrc0NonwC(2jOzXoJe8GZNxN12eBz1bP(8QO2MmJuOHf2YNpU29IE8MUiPsNjK4485FEuZaFW)(]] )

spec:RegisterPack( "Holy Paladin (wowtbc.gg)", 20221002, [[Hekili:vsvtVTnoq0FmbiibTrw2jDD7I4Cyp14dPfqfyVrjkYXsCdfPajL9gGa(BVdL2vHsvPP9Ia1W38Mp4mpYAY3izCQdipSjDZM1PPBswVn96nxtYCp1cKSwk7rAfEqrBWVFwlFYx8vQKYfkFXfN0NCLSKQQldqFsQP8aLwDNHHWRDUw7FUA1im8Kt(4kMKATxv1j4GDvnY5vTduUIKv2jKU7vKYLZSni7TadnJ0l4CyajyzKSVvlS(IwJqBeompd)vsTa3xOXS1vd(IXuXx83gQR2x0NgjKmPW6S9ne4aTt6WJp03GafTucCYFrYyiXGrqjzuMtCeY5AxsjqzAvU(qUuuv78f78fPdi0kSGMEnXfY9xJ2YUdhsSavMW1NuVqsWuGItclx3e446xLdh1ubUeowpufdR5B9fRt9fN7lAOkAslGpokxV9Trj6)0XRGg8MPb6MqGweZq9eLei6p8R0XSuMb452Abi5Z7xtUmq5FeNa0JGQsOQYpfE9Mf8TXi5IJcfKlKYUgHIoyCc8pUa8wjqNb7tXWA1lq060yiDwmQoOXoh16fI3b6rTzoWnXad7hy3qZECoSF3rGOECFZn8gAcVHGUZQaRTN1BERxqqbnca3TUdjTFS6Tcho)BbMz4nieJ3Ck5hJXfJHryZ5qtyJ(5NJn2P4afhNUCwVBysje2jtsW)QnmHTzAxfNNBnat3usFrb4)DXaoJOSl8toTZqN7k68rWydyhLTizNOgfoXIJd330QnUGE0gFXaP(IEDNe)EmmDU6WWWOgvix0hesuk9SZ8ftvF3hmH88fMtxcg8mgr)E)(bITjJ1X72Tc1BfvkCTkK2rGWRMPp9EXHDVU42U0yxNQkf8CQ(vm2fuxcomB0521PNhlsD720xLKb1240jw5ywDm5UPvXujL4BwqczHRdsgXMhKiITmQiSG39caX2FzFFsTT8g7YTWyhJ39I6j)3c2DRp)N7(lBql68fZ2jF(557JxgZ24oxyxH89d]] )