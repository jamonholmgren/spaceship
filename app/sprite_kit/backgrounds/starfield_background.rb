module StarfieldBackground

  def starfield
    texture = SKTexture.textureWithImageNamed("stars.jpg")

    starfield = SKSpriteNode.spriteNodeWithTexture(texture)
    starfield.position = CGPointMake(mid_x, mid_y)
    starfield.name = "starfield"
    starfield.zPosition = -20
    starfield.scale = 6.00
    # starfield.runAction scroll_action(mid_x, 0.1)

    starfield
  end

  def mid_x
    CGRectGetMidX(self.frame)
  end

  def mid_y
    CGRectGetMidY(self.frame)
  end

end
