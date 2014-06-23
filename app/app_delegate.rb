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
    @main_window.setContentView game_view
    @main_window.orderFrontRegardless

  end

  def game_view
    @game_view ||= GameView.alloc.initWithFrame(@main_window.contentView.bounds)
  end

end
