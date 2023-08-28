return { frveharmored = {
  unitname            = [[frveharmored]],
  name                = [[Renault Light Armored Vehicle]],
  description         = [[French Renault 18/20 HP ED light Armored Vehicle, can carry passengers]],
  acceleration        = 0.144,
  brakeRate           = 0.576,
  buildCostMetal      = 10,
  builder             = false,
  buildPic            = [[tankassault.png]],
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  category            = [[LAND]],
  collisionVolumeOffsets = [[0 -8 -15]],
  collisionVolumeScales  = [[30 26 60]],
  collisionVolumeType    = [[box]],
  selectionVolumeOffsets = [[0 -8 -15]],
  selectionVolumeScales  = [[30 26 60]],
  selectionVolumeType    = [[box]],
  corpse              = [[DEAD]],

  customParams        = {
    bait_level_default = 0,
    aimposoffset      = [[0 0 0]],
    midposoffset      = [[0 17 15]],
    modelradius       = [[15]],
    selection_scale   = 0.35,

    outline_x = 0,
    outline_y = 0,
    outline_yoff = 13.5,
  },

  explodeAs           = [[BIG_UNITEX]],
  footprintX          = 8,
  footprintZ          = 8,
  iconType            = [[tankassault]],
  leaveTracks         = true,
  maxDamage           = 6800,
  maxSlope            = 18,
  maxVelocity         = 2.45,
  maxWaterDepth       = 22,
  movementClass       = [[TANK4]],
  noAutoFire          = false,
  noChaseCategory     = [[TERRAFORM FIXEDWING SATELLITE SUB DRONE]],
  objectName          = [[renault.dae]],
  script              = [[erhardt.lua]],
  selfDestructAs      = [[BIG_UNITEX]],

  sfxtypes            = {

    explosiongenerators = {
      [[custom:LARGE_MUZZLE_FLASH_FX]],
    },

  },
  sightDistance       = 506,
  trackOffset         = 5,
  trackStrength       = 8,
  trackStretch        = 1,
  trackType           = [[StdTank]],
  trackWidth          = 30,
  turninplace         = 0,
  turnRate            = 583,


  weapons                       = {

    {
      def                = [[turretriot_WEAPON]],
      badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING LAND SINK TURRET SHIP SWIM FLOAT GUNSHIP HOVER]],
      mainDir            = [[0 1 0]],
      maxAngleDif        = 240,
    },

  },

  weaponDefs                    = {

    turretriot_WEAPON = {
      name                    = [[Heavy Machinegun]],
      accuracy                = 500,
      alphaDecay              = 0.7,
      areaOfEffect            = 20,
      avoidFeature            = false,
      burnblow                = true,
      craterBoost             = 0.15,
      craterMult              = 0.3,
      --collideFriendly         = false,

      customparams = {
        light_color = [[0.8 0.76 0.38]],
        light_radius = 180,
      },

      damage                  = {
        default = 45,
      },

      edgeEffectiveness       = 0.5,
      explosionGenerator      = [[custom:EMG_HIT_HE]],
      intensity               = 0.7,
      interceptedByShieldType = 1,
      noSelfDamage            = true,
      range                   = 600,
      reloadtime              = 0.1,
      rgbColor                = [[1 0.95 0.4]],
      separation              = 1.5,
      --soundHit                = [[weapon/cannon/emg_hit]],
      soundStart              = [[weapon/MachinegunSingle]],
      soundStartVolume        = 0.5,
      stages                  = 10,
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 1600,
    },

  },


  featureDefs         = {

    DEAD  = {
      blocking         = true,
      featureDead      = [[HEAP]],
      footprintX       = 3,
      footprintZ       = 3,
      collisionVolumeOffsets = [[0 0 0]],
      collisionVolumeScales  = [[50 50 50]],
      collisionVolumeType    = [[ellipsoid]],
      object           = [[a7v2.dae]],
    },

    HEAP  = {
      blocking         = false,
      footprintX       = 3,
      footprintZ       = 3,
      object           = [[debris3x3b.s3o]],
    },

  },

} }
