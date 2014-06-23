class GameView < SKView
  def initWithFrame(frame)
    super
    self.showsFPS = true
    self.presentScene(scene)
    self
  end

  def scene
    @scene ||= SpaceScene.alloc.initWithSize(frame.size)
  end
end
