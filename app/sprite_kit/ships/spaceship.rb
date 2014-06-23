class Spaceship < SKSpriteNode
  def init
    self.initWithImageNamed("spaceship")
    # self.physicsBody = physics_body
    self.scale = 0.1
    self.name = "spaceship"
    # self.runAction some_action
    self
  end

  def constrain_rotation
    # keep it from going >= 360 degrees
    self.zRotation = self.zRotation % (Math::PI * 2)
  end

  def turn_to(degrees)
    rads = degrees_to_radians(degrees)
    runAction SKAction.rotateToAngle(rads, duration: 0.5, shortestUnitArc: true)
  end

  def turn(degrees)
    runAction SKAction.sequence([
      SKAction.rotateByAngle(degrees_to_radians(degrees), duration: 0.5),
      SKAction.runBlock(-> { constrain_rotation })
    ])
  end

  def degrees_to_radians(degrees)
    degrees * Math::PI / 180
  end

  def heading
    self.zRotation * 180 / Math::PI
  end
end
