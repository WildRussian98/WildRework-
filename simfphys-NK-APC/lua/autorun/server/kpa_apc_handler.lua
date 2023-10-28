simfphys = istable( simfphys ) and simfphys or {}

simfphys.ManagedVehicles = istable( simfphys.ManagedVehicles ) and simfphys.ManagedVehicles or {}
simfphys.Weapons = istable( simfphys.Weapons ) and simfphys.Weapons or {}
simfphys.weapon = {}

util.AddNetworkString( "avx_misc_register_tank" )



sound.Add( {
	name = "apc_reload",
	channel = CHAN_ITEM,
	volume = 100,
	level = 125,
	pitch = { 100, 110 },
	sound = "^kpa_apc/cannon/apcreload.wav",
} )