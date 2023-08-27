return { brartyheavy = {
  unitname            = [[brartyheavy]],
  name                = [[BL 8inch Howitzer]],
  description         = [[British Long range artillery]],
  acceleration        = 0.4,
  brakeRate           = 2.4,
  buildCostMetal      = 10,
  builder             = false,
  activateWhenBuilt   = true,
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
    midposoffset      = [[0 0 0]],
    modelradius       = [[35]],
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
  maxDamage           = 68000,
  maxSlope            = 18,
  maxVelocity         = 2.45,
  maxWaterDepth       = 22,
  movementClass       = [[TANK4]],
  noAutoFire          = false,
  noChaseCategory     = [[TERRAFORM FIXEDWING SATELLITE SUB DRONE]],
  objectName          = [[artybl8.dae]],
  script              = [[artybl8.lua]],
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
  workerTime          = 0,

  weapons             = {

    {
      def                = [[PLASMA]],
      badTargetCategory  = [[FIXEDWING GUNSHIP]],
      onlyTargetCategory = [[FIXEDWING SWIM LAND SINK TURRET FLOAT SHIP HOVER GUNSHIP]],
    },

  },


  weaponDefs          = {

    PLASMA  = {
      name                    = [[Heavy Plasma Cannon]],
      areaOfEffect            = 192,
      avoidFeature            = false,
      burnBlow                = true,
      craterBoost             = 0.7,
      craterMult              = 1.2,

      customParams            = {
        light_color = [[2.2 1.6 0.9]],
        light_radius = 550,
      },

      damage                  = {
        default = 1201,
      },

      edgeEffectiveness       = 0.7,
      explosionGenerator      = [[custom:FLASHSMALLBUILDING]],
      fireStarter             = 99,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      noSelfDamage            = true,
      proximityPriority       = 6,
      range                   = 650,
      reloadtime              = 3,
      soundHit                = [[weapon/cannon/cannon_hit4]],
      --soundHitVolume          = 70,
      soundStart              = [[weapon/cannon/heavy_cannon2]],
      sprayangle              = 768,
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 750,
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
