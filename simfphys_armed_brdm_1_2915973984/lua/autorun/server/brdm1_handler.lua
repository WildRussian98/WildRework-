simfphys = istable( simfphys ) and simfphys or {}

simfphys.ManagedVehicles = istable( simfphys.ManagedVehicles ) and simfphys.ManagedVehicles or {}
simfphys.Weapons = istable( simfphys.Weapons ) and simfphys.Weapons or {}
simfphys.weapon = {}

util.AddNetworkString( "brdm1_register_tank" )

sound.Add( {
	name = "brdm1_fire",
	channel = CHAN_WEAPON,
	volume = 0.5,
	level = 140,
	pitch = { 90, 100 },
	sound = {"weapons/sg43/ds39_burst-01.wav"}
} )
