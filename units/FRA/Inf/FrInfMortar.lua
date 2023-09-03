return { frinfmortar = {
  unitname            = [[frinfmortar]],
  name                = [[French Mortar Infantry]],
  description         = [[French Mortar Infantry]],
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
  highTrajectory                = 1,

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
  objectName          = [[frinfmort.dae]],
  script              = [[InfantryMortar.lua]],

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


  weapons             = {
    [5] = {
      def                = [[Mortar]],
      mainDir            = [[0 0 1]],
      badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING LAND SINK TURRET SHIP SWIM FLOAT GUNSHIP HOVER]],
    },

  },


  weaponDefs          = {
    
    Mortar = {
      name                    = [[Mortar]],
      accuracy                = 220,
      areaOfEffect            = 16,
      craterBoost             = 0,
      craterMult              = 0,

      customParams        = {
        light_camera_height = 1400,
        light_color = [[0.80 0.54 0.23]],
        light_radius = 200,
      },

      damage                  = {
        default = 140.1,
        planes  = 140.1,
      },

      edgeEffectiveness       = 0.5,
      explosionGenerator      = [[custom:MARY_SUE]],
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      myGravity               = 0.16,
      noSelfDamage            = true,
      range                   = 550,
      reloadtime              = 6,
      soundHit                = [[explosion/ex_med5]],
      soundStart              = [[weapon/cannon/cannon_fire1]],
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 270,
    },

  },

} }
