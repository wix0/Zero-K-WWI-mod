return { gerplanefokker = {
  unitname               = [[gerplanefokker]],
  name                   = [[Fokker D.II]],
  description            = [[Fokker D.II Fighter]],
  brakerate              = 0.4,
  buildCostMetal         = 10,
  buildPic               = [[planefighter.png]],
  canFly                 = true,
  canGuard               = true,
  canMove                = true,
  canPatrol              = true,
  canSubmerge            = false,
  category               = [[FIXEDWING]],
  collide                = false,
  collisionVolumeOffsets = [[0 0 5]],
  collisionVolumeScales  = [[30 14 50]],
  collisionVolumeType    = [[ellipsoid]],
  selectionVolumeOffsets = [[0 0 10]],
  selectionVolumeScales  = [[50 50 70]],
  selectionVolumeType    = [[cylZ]],
  corpse                 = [[DEAD]],
  crashDrag              = 0.02,
  cruiseAlt              = 200,

  customParams           = {
    bait_level_default = 0,
    fighter_pullup_dist = 400,

    midposoffset   = [[0 3 0]],
    modelradius    = [[10]],
    refuelturnradius = [[80]],
    okp_damage = 130,

    outline_x = 1,
    outline_y = 1,
    outline_yoff = 16,
  },

  explodeAs              = [[GUNSHIPEX]],
  fireState              = 2,
  floater                = true,
  footprintX             = 2,
  footprintZ             = 2,
  frontToSpeed           = 0,
  iconType               = [[fighter]],
  maneuverleashlength    = [[1280]],
  maxAcc                 = 0.3,
  maxDamage              = 300,
  maxRudder              = 0.007,
  maxVelocity            = 6,
  mygravity              = 1,
  noAutoFire             = false,
  noChaseCategory        = [[TERRAFORM SATELLITE SUB LAND SINK TURRET SHIP SWIM FLOAT HOVER]],
  objectName             = [[fokkerd2.dae]],
  script                 = [[planefighterwwi.lua]],
  selfDestructAs         = [[GUNSHIPEX]],

  sfxtypes               = {

    explosiongenerators = {
      [[custom:MUZZLE_ORANGE]],
      [[custom:FF_PUFF]],
      [[custom:BEAMWEAPON_MUZZLE_RED]],
      [[custom:FLAMER]],
    },

  },
  sightDistance          = 520,
  speedToFront           = 0,
  turnRadius             = 150,
  turnRate               = 839,

  weapons             = {

    {
      def                = [[EMG]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 120,
      onlyTargetCategory = [[SWIM LAND SHIP SINK TURRET FLOAT GUNSHIP FIXEDWING HOVER]],
    },

  },


  weaponDefs          = {

    EMG = {
      name                    = [[Heavy Pulse MG]],
      areaOfEffect            = 20,
      avoidFeature            = false,
      burnBlow                = true,
      burst                   = 4,
      burstrate               = 0.1,
      collideFriendly         = false,
      craterBoost             = 0,
      craterMult              = 0,

      customparams = {
        combatrange = 630,
        light_camera_height = 2000,
        light_color = [[0.9 0.84 0.45]],
        light_ground_height = 120,
      },
      
      damage                  = {
        default = 19.3,
      },

      edgeEffectiveness       = 0.5,
      explosionGenerator      = [[custom:EMG_HIT_HE]],
      firestarter             = 70,
      impulseBoost            = 0,
      impulseFactor           = 0.2,
      interceptedByShieldType = 1,
      myGravity               = 0.15,
      noSelfDamage            = true,
      range                   = 600,
      reloadtime              = 0.433,
      rgbColor                = [[1 0.95 0.5]],
      --soundHit                = [[weapon/cannon/emg_hit]],
      soundStart              = [[weapon/RUS_Maxim.wav]],
      soundStartVolume        = 2.0,
      sprayAngle              = 200,
      tolerance               = 2000,
      turret                  = true,
      weaponTimer             = 1,
      weaponType              = [[Cannon]],
      weaponVelocity          = 800,
    },

  },


  featureDefs            = {

    DEAD  = {
      blocking         = true,
      featureDead      = [[HEAP]],
      footprintX       = 2,
      footprintZ       = 2,
      object           = [[fighter_dead.s3o]],
    },


    HEAP  = {
      blocking         = false,
      footprintX       = 2,
      footprintZ       = 2,
      object           = [[debris2x2c.s3o]],
    },

  },

} }
