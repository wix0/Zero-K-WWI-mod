return { tanka7v = {
  unitname            = [[tanka7v]],
  name                = [[A7V Tank]],
  description         = [[German Heavy Tank]],
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
  objectName          = [[a7v2.dae]],
  script              = [[tanka7v.lua]],
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
      def                = [[COR_REAP]],
      mainDir            = [[0.0 0.1 0.3]],
      maxAngleDif        = 150,
      badTargetCategory  = [[FIXEDWING GUNSHIP]],
      onlyTargetCategory = [[FIXEDWING LAND SINK TURRET SHIP SWIM FLOAT GUNSHIP HOVER]],
    },

  },


  weaponDefs          = {

    COR_REAP = {
      name                    = [[Medium Plasma Cannon]],
      areaOfEffect            = 32,
      burst                   = 1,
      burstRate               = 0.2,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
        default = 300.1,
      },

      explosionGenerator      = [[custom:DEFAULT]],
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      noSelfDamage            = true,
      range                   = 360,
      reloadtime              = 4,
      soundHit                = [[weapon/cannon/reaper_hit]],
      soundStart              = [[weapon/cannon/cannon_fire5]],
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 255,
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
