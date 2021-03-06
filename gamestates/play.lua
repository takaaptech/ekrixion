local shakycam = require 'lib.shakycam'
local gamera = require 'lib.gamera'
local Map = require 'Map'

local Play = {}

function Play:enteredState()
  local width, height = 2000, 2000

  local camera = gamera.new(0,0, width, height)
  self.camera = shakycam.new(camera)

  self.map = Map:new(width, height, self.camera)

  love.audio.setDistanceModel("linear clamped")
end

function Play:keypressed(key, isrepeat)
  if key == 'escape' then self:gotoState('Start')
  else
    self.map:keyPressed(key)
  end
end

function Play:exitedState()
  love.audio.setDistanceModel("none")
  self.map = nil
end

function Play:update(dt)
  self.map:update(dt, self.camera:getVisible())
  self.camera:setPosition(self.map:getPlayerPosition())
  self.camera:update(dt)
end

function Play:draw()
  local drawDebug = false
  self.camera:draw(function(l,t,w,h)
    self.map:draw(drawDebug, l,t,w,h)
  end)
end

return Play
