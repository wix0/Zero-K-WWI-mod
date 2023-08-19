return { pillbox = {
  unitname                      = [[pillbox]],
  name                          = [[Pillbox]],
  description                   = [[Concrete fortification with machineuns]],
  activateWhenBuilt             = true,
  buildCostMetal                = 10,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 5,
  buildingGroundDecalSizeY      = 5,
  buildingGroundDecalType       = [[turretriot_aoplane.dds]],
  buildPic                      = [[turretriot.png]],
  category                      = [[TURRET]],
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[45 45 45]],
  collisionVolumeType           = [[ellipsoid]],
  corpse                        = [[DEAD]],

  customParams                  = {
    bait_level_target = 4,
    aimposoffset   = [[0 12 0]],
    midposoffset   = [[0 4 0]],
    aim_lookahead  = 50,
    outline_x = 0,
    outline_y = 0,
    outline_yoff = 0,
  },

  --explodeAs                     = [[LARGE_BUILDINGEX]],
  floater                       = false,
  maxWaterDepth                 = 22,
  footprintX                    = 3,
  footprintZ                    = 3,
  iconType                      = [[defenseriot]],
  levelGround                   = false,
  maxDamage                     = 1500,
  maxSlope                      = 18,
  noChaseCategory               = [[FIXEDWING LAND SHIP SWIM GUNSHIP SUB HOVER]],
  objectName                    = [[pillbox.dae]],
  script                        = "pillbox.lua",
  --selfDestructAs                = [[LARGE_BUILDINGEX]],

  sfxtypes                      = {

    explosiongenerators = {
      [[custom:WARMUZZLE]],
      [[custom:DEVA_SHELLS]],
    },

  },

  sightDistance                 = 499, -- Range*1.1 + 48 for radar overshoot
  useBuildingGroundDecal        = true,
  yardMap                       = [[ooo ooo ooo]],

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
      soundStart              = [[weapon/VickersSingle]],
      soundStartVolume        = 0.5,
      stages                  = 10,
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 1600,
    },

  },

  featureDefs                   = {

    DEAD  = {
      blocking         = true,
      featureDead      = [[HEAP]],
      footprintX       = 3,
      footprintZ       = 3,
      object           = [[afury_dead.s3o]],
    },

    HEAP  = {
      blocking         = false,
      footprintX       = 3,
      footprintZ       = 3,
      object           = [[debris4x4b.s3o]],
    },

  },

} }
