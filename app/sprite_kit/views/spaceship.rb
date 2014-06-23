class Spaceship < SKView
  def init
    super
    # self.showsFPS = true
    # self.presentScene(scene)
    # self
  end

  def scene
    @scene ||= MyScene.alloc.initWithSize(bounds.size)
  end
end
