return { starfort = {
  unitname                      = [[starfort]],
  name                          = [[Starfort]],
  description                   = [[Concrete fortification with artillery]],
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
    outline_yoff = 13.5,
  },

  --explodeAs                     = [[LARGE_BUILDINGEX]],
  floater                       = false,
  maxWaterDepth                 = 22,
  footprintX                    = 3,
  footprintZ                    = 3,
  iconType                      = [[defenseriot]],
  levelGround                   = true,
  maxDamage                     = 1500,
  maxSlope                      = 18,
  noChaseCategory               = [[FIXEDWING LAND SHIP SWIM GUNSHIP SUB HOVER]],
  objectName                    = [[starfort.dae]],
  script                        = [[starfort.lua]],
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
      def                = [[vehriot_WEAPON]],
      badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING LAND SINK TURRET SHIP SWIM FLOAT GUNSHIP HOVER]],
      --mainDir            = [[0 1 0]],
      --maxAngleDif        = 240,
    },

  },

  weaponDefs                    = {

    vehriot_WEAPON = {
      name                    = [[Impulse Cannon]],
      areaOfEffect            = 144,
      avoidFeature            = true,
      avoidFriendly           = true,
      burst                   = 4,
      burstRate               = 0.266,
      burnblow                = true,
      craterBoost             = 1,
      craterMult              = 0.5,

      customParams            = {
        gatherradius = [[90]],
        smoothradius = [[60]],
        smoothmult   = [[0.08]],
        force_ignore_ground = [[1]],

        light_camera_height = 1500,
      },
      
      damage                  = {
        default = 260.2,
        planes  = 260.2,
      },

      edgeEffectiveness       = 0.75,
      explosionGenerator      = [[custom:FLASH64]],
      impulseBoost            = 30,
      impulseFactor           = 0.6,
      interceptedByShieldType = 1,
      noSelfDamage            = true,
      range                   = 600,
      reloadtime              = 3, -- don't forget to tweak the high-alpha threshold at the bottom of `LuaRules/Configs/target_priority_defs.lua`
      soundHit                = [[weapon/cannon/generic_cannon]],
      soundStart              = [[weapon/cannon/outlaw_gun]],
      soundStartVolume        = 3,
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 400,
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
