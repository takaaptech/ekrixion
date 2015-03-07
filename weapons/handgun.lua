local class = require 'lib.middleclass'
local Weapon = require 'weapons.weapon'
local Bullet = require 'entities.projectiles.bullet'

local Handgun = class('Handgun', Weapon)

function Handgun:initialize(world)
  Weapon:initialize(world, {
    spread   = 0.01, -- radians
    coolDown = 0.7, -- seconds
    bulletsPerShot  = 1,
    projectileClass = Bullet
  })
end

return Handgun