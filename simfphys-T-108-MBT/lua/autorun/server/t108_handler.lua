simfphys = istable( simfphys ) and simfphys or {}

simfphys.ManagedVehicles = istable( simfphys.ManagedVehicles ) and simfphys.ManagedVehicles or {}
simfphys.Weapons = istable( simfphys.Weapons ) and simfphys.Weapons or {}
simfphys.weapon = {}

util.AddNetworkString( "avx_misc_register_tank" )

sound.Add( {
	name = "t108_gun_fire",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 140,
	pitch = { 90, 110 },
	sound = "^t108/cannons/fire/cannon/t108_fire.wav",
} )

sound.Add( {
	name = "t108_gun_reload",
	channel = CHAN_ITEM,
	volume = 100,
	level = 125,
	pitch = { 100, 110 },
	sound = "^t108/cannons/reload/t108_reload.wav",
} )

sound.Add( {
	name = "shiten_fire",
	channel = CHAN_ITEM,
	volume = 100,
	level = 125,
	pitch = { 100, 110 },
	sound = {"^t108/mg/shiten/shiten_fire1.ogg","^m5a2/mg/shiten/shiten_fire2.ogg","^m5a2/mg/shiten/shiten_fire3.ogg"}
} )

sound.Add( {
	name = "tac_gun_fire",
	channel = CHAN_STATIC,
	volume = 100,
	level = 125,
	pitch = { 100, 110 },
	sound = {"t108/cannons/fire/tac/tac_fire1.wav","t108/cannons/fire/tac/tac_fire2.wav","t108/cannons/fire/tac/tac_fire3.wav"}
} )