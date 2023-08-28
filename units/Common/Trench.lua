return { trench = {
  unitname                      = [[trench]],
  name                          = [[Trench]],
  description                   = [[A defensive structure, blocks enemy movement, can be loaded with infantry]],
  activateWhenBuilt             = true,
  buildCostMetal                = 10,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 5,
  buildingGroundDecalSizeY      = 5,
  buildingGroundDecalType       = [[turretriot_aoplane.dds]],
  buildPic                      = [[turretriot.png]],
  category                      = [[TURRET]],
  collisionVolumeOffsets = [[0 0 0]],
  collisionVolumeScales  = [[50 45 60]],
  collisionVolumeType    = [[box]],
  selectionVolumeOffsets = [[0 0 0]],
  selectionVolumeScales  = [[50 45 60]],
  selectionVolumeType    = [[box]],
  corpse                        = [[DEAD]],

  customParams                  = {
    bait_level_target = 4,
    aimposoffset   = [[0 12 0]],
    midposoffset   = [[0 4 0]],
    aim_lookahead  = 50,
  },

  floater                       = false,
  maxWaterDepth                 = 22,
  footprintX                    = 3,
  footprintZ                    = 3,
  iconType                      = [[defenseriot]],
  levelGround                   = true,
  maxDamage                     = 1500,
  maxSlope                      = 18,
  noChaseCategory               = [[FIXEDWING LAND SHIP SWIM GUNSHIP SUB HOVER]],
  objectName                    = [[trench.dae]],
  script                        = "trench.lua",

  sightDistance                 = 499, -- Range*1.1 + 48 for radar overshoot
  useBuildingGroundDecal        = true,
  yardMap                       = [[ooo ooo ooo]],

  transportCapacity      = 4,
  transportSize          = 2,
  releaseHeld            = true,
  transportUnloadMethod  = 0,
  loadingRadius          = 150,
  isFirePlatform         = true,
  unloadSpread           = 0,

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
