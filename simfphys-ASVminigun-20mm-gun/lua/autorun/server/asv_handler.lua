simfphys = istable( simfphys ) and simfphys or {}

simfphys.ManagedVehicles = istable( simfphys.ManagedVehicles ) and simfphys.ManagedVehicles or {}
simfphys.Weapons = istable( simfphys.Weapons ) and simfphys.Weapons or {}
simfphys.weapon = {}

util.AddNetworkString( "simfphys_tank_do_effect" )

sound.Add( {
	name = "20mm_loop",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = { 110, 110 },
	sound = "^crysis_warhead/fire/20mm_loop.wav"
} )

sound.Add( {
	name = "20mm_tail",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = { 110, 110 },
	sound = "^crysis_warhead/fire/20mm_tail.ogg"
} )

sound.Add( {
	name = "asv_minigun_loop",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = { 110, 110 },
	sound = "^crysis_warhead/fire/minigun_loop.wav"
} )

sound.Add( {
	name = "asv_minigun_loop_down",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = { 110, 110 },
	sound = "^crysis_warhead/fire/minigun_spin_down.ogg"
} )