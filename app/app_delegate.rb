class AppDelegate
  include Menu

  def applicationDidFinishLaunching(notification)
    build_menu
    build_window
    true
  end

  def build_window
    @main_window = NSWindow.alloc.initWithContentRect([[100, 100], [800, 600]],
      styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask,
      backing: NSBackingStoreBuffered,
      defer: false)
    @main_window.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
    @main_window.delegate = self
    @main_window.orderFrontRegardless

    spaceship # crash!
  end

  def spaceship
    @spaceship ||= Spaceship.alloc.init
  end

end
