return { brinfrifle = {
  unitname            = [[brinfrifle]],
  name                = [[British Rifle Infantry]],
  description         = [[British Rifle Infantry]],
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
  collisionVolumeOffsets = [[0 5.5 0]],
  collisionVolumeScales  = [[11 11 11]],
  collisionVolumeType    = [[CylY]],
  selectionVolumeOffsets = [[0 5.5 0]],
  selectionVolumeScales  = [[11 11 11]],
  selectionVolumeType    = [[CylY]],
  corpse              = [[DEAD]],

  customParams        = {
    soundok_vol = [[0.58]],
    soundselect_vol = [[0.5]],
    soundbuild = [[builder_start]],
    bait_level_default = 0,
    aimposoffset      = [[0 0 0]],
    midposoffset      = [[0 0 0]],
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
  objectName          = [[britinf.dae]],
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
      def                = [[GAUSS]],
      mainDir            = [[0.0 0.1 0.3]],
      maxAngleDif        = 150,
      badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING LAND SINK TURRET SHIP SWIM FLOAT GUNSHIP HOVER]],
    },

  },


  weaponDefs          = {
    
    GAUSS = {
      name                    = [[Gauss Rifle]],
      alphaDecay              = 0.75,
      areaOfEffect            = 1,
      avoidfeature            = false,
      burnblow                = true,
      bouncerebound           = 0.15,
      bounceslip              = 1,
      --cegTag                  = [[gauss_tag_l]],
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
        default = 140,
        planes  = 140,
      },
      
      customParams = {
        single_hit = true,
      },

      explosionGenerator      = [[custom:EMG_HIT_HE]],
      --explosionGenerator      = [[custom:gauss_hit_l]],
      groundbounce            = 1,
      impactOnly              = true,
      collideFriendly         = false,
      avoidFriendly           = false,
      impulseBoost            = 0,
      impulseFactor           = 0,
      interceptedByShieldType = 0,
      noExplode               = true,
      noSelfDamage            = true,
      numbounce               = 40,
      range                   = 420,
      reloadtime              = 2.5,
      rgbColor                = [[1 0.95 0.4]],
      separation              = 1.5,
      size                    = 0.8,
      sizeDecay               = -0.1,
      --soundHit                = [[weapon/gauss_hit]],
      soundHitVolume          = 3,
      soundStart              = [[weapon/GBR_Enfield]],
      soundStartVolume        = 2.5,
      stages                  = 32,
      turret                  = true,
      waterbounce             = 1,
      weaponType              = [[Cannon]],
      weaponVelocity          = 2200,
    },

  },
  
} }
