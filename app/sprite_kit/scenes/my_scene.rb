class MyScene < SKScene
  include KeyHelper

  def didMoveToView(view)
    super

    # physicsWorld.gravity = CGVectorMake(0.0, 0.0)
    # physicsWorld.contactDelegate = self

    self.backgroundColor = NSColor.blackColor
    @elements_added ||= add_elements
  end

  def add_elements
    add_stars
    add_planets
    add_spaceship
    add_pause_label
    add_key_responders
    true
  end

  def add_stars

  end

  def add_planets

  end

  def add_spaceship
    addChild spaceship
  end

  def add_pause_label

  end

  def spaceship
    @spaceship ||= begin
      s = Spaceship.new
      s.position = CGPointMake(400, 300)
      s.zRotation = 0.0
      s
    end
  end

  def add_key_responders
    key :up do |key_down|
      puts ":up"
    end

    key :down do |key_down|
      puts ":down"
    end

    key :left do |key_down|
      spaceship.turn 10 if key_down
    end

    key :right do |key_down|
      spaceship.turn -10 if key_down
    end

    key :space do |key_down|
      puts ":space"
    end

    key "i" do |key_down|
      puts "i"
    end
  end

end
