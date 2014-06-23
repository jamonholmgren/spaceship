class Spaceship < SKSpriteNode
  def init
    self.initWithImageNamed("spaceship")
    # self.physicsBody = physics_body
    self.scale = 1.0
    self.name = "spaceship"
    # self.runAction some_action
    self
  end

  def turn_to(degrees)
    self.zRotation = degrees_to_radians(degrees % 360.0)
  end

  def turn(degrees)
    turn_to(heading + degrees)
  end

  def degrees_to_radians(degrees)
    degrees * Math::PI / 180
  end

  def heading
    self.zRotation * 180 / Math::PI
  end
end
