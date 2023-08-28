return { gerinfstorm = {
  unitname            = [[gerinfstorm]],
  name                = [[Sturmtruppen]],
  description         = [[German sturmtruppen is an elite infantry armed with submachinegun mp 18 and Stielhandgranate M17]],
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
  objectName          = [[gerinfstorm.dae]],
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


  weapons                       = {

   [5] = {
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
      range                   = 300,
      reloadtime              = 0.1,
      rgbColor                = [[1 0.95 0.4]],
      separation              = 1.5,
      --soundHit                = [[weapon/cannon/emg_hit]],
      soundStart              = [[weapon/RUSMaximSingle]],
      soundStartVolume        = 0.5,
      stages                  = 10,
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 1600,
    },
  },
} }
