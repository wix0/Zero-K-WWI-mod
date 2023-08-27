return { gerinfflame = {
  unitname            = [[gerinfflame]],
  name                = [[German Flamethrower Infantry]],
  description         = [[German Flamethrower Infantry]],
  acceleration        = 0.3,
  --autoHeal            = 0.1,
  brakeRate           = 2.7,
  buildCostMetal      = 10,
  buildDistance       = 250,
  builder             = false,
  buildPic            = [[cloakraid.png]],
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  category            = [[LAND]],
  collisionVolumeOffsets = [[0 7 0]],
  collisionVolumeScales  = [[18 28 18]],
  collisionVolumeType    = [[CylY]],
  selectionVolumeOffsets = [[0 7 0]],
  selectionVolumeScales  = [[18 28 18]],
  selectionVolumeType    = [[CylY]],
  corpse              = [[DEAD]],

  customParams        = {
    soundok_vol = [[0.58]],
    soundselect_vol = [[0.5]],
    soundbuild = [[builder_start]],
    bait_level_default = 0,
    aimposoffset      = [[0 0 0]],
    midposoffset      = [[0 10 0]],
    modelradius       = [[11]],
    selection_scale   = 0.35,

    outline_x = 0,
    outline_y = 0,
    outline_yoff = 13.5,
  },

  explodeAs             = [[PYRO_DEATH]],
  footprintX             = 2,
  footprintZ             = 2,
  iconType               = [[kbotraider]],
  idleTime               = 150,
  leaveTracks            = true,
  maxDamage              = 230,
  maxSlope               = 36,
  maxVelocity            = 0.85,
  maxWaterDepth          = 22,
  movementClass          = [[KBOT2]],
  noAutoFire             = false,
  noChaseCategory        = [[TERRAFORM FIXEDWING SUB]],
  objectName          = [[gerinfft.dae]],
  script              = [[InfantryRifle.lua]],

  sfxtypes            = {

    explosiongenerators = {
      --[[custom:emg_shells_l]]
      [[custom:flashmuzzle1]],
    },

  },

  showNanoSpray       = false,
  sightDistance          = 560,
  trackOffset            = 0,
  trackStrength          = 8,
  trackStretch           = 0.9,
  trackType              = [[ComTrack]],
  trackWidth             = 4,
  turnRate               = 2000,
  upright             = true,
  workerTime          = 12,

  weapons             = {
    [5] = {
      def                = [[FLAMETHROWER]],
      badTargetCategory  = [[FIREPROOF]],
      onlyTargetCategory = [[SWIM LAND SINK TURRET FLOAT SHIP HOVER GUNSHIP FIXEDWING]],
    },

  },


  weaponDefs          = {
    
    FLAMETHROWER = {
      name                    = [[Flamethrower]],
      areaOfEffect            = 64,
      avoidGround             = false,
      avoidFeature            = false,
      avoidFriendly           = true,
      collideFeature          = false,
      collideGround           = false,
      coreThickness           = 0,
      craterBoost             = 0,
      craterMult              = 0,
      cegTag                  = [[flamer]],

      customParams            = {
        flamethrower = [[1]],
        setunitsonfire = "1",
        burnchance = "0.4", -- Per-impact
        burntime = [[450]],
          
        light_camera_height = 2800,
        light_color = [[0.6 0.39 0.18]],
        light_radius = 260,
        light_fade_time = 10,
        light_beam_mult_frames = 5,
        light_beam_mult = 5,
      
        combatrange = 280,
      },
    
      damage                  = {
        default = 9.2,
      },

      duration                = 0.01,
      explosionGenerator      = [[custom:SMOKE]],
      fallOffRate             = 1,
      fireStarter             = 100,
      heightMod               = 1,
      impulseBoost            = 0,
      impulseFactor           = 0,
      intensity               = 0.3,
      interceptedByShieldType = 1,
      leadLimit               = 2,
      noExplode               = true,
      noSelfDamage            = true,
      range                   = 240,
      reloadtime              = 0.133,
      rgbColor                = [[1 1 1]],
      soundStart              = [[weapon/flamethrower]],
      soundTrigger            = true,
      texture1                = [[flame]],
      thickness               = 0,
      tolerance               = 5000,
      turret                  = true,
      weaponType              = [[LaserCannon]],
      weaponVelocity          = 800,
    },

    PYRO_DEATH = {
        name                    = [[Napalm Blast]],
        collideFriendly         = false,
        avoidFriendly           = false,
        areaofeffect            = 256,
        craterboost             = 1,
        cratermult              = 3.5,

        customparams              = {
            setunitsonfire = "1",
            burnchance     = "1",
            burntime       = 60,

            area_damage = 1,
            area_damage_radius = 64,
            area_damage_dps = 10,
            area_damage_duration = 10,
        },

        damage                  = {
            default = 50,
        },

        edgeeffectiveness       = 0.5,
        explosionGenerator      = [[custom:napalm_pyro]],
        impulseboost            = 0,
        impulsefactor           = 0,
        soundhit                = [[explosion/ex_med3]],
    },
  },

} }
