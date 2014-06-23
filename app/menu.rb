module Menu
  def build_menu
    @main_menu = NSMenu.new

    app_name = NSBundle.mainBundle.infoDictionary['CFBundleName']
    add_menu(app_name) do
      addItemWithTitle("About #{app_name}", action: 'orderFrontStandardAboutPanel:', keyEquivalent: '')
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle('Preferences', action: 'openPreferences:', keyEquivalent: ',')
      addItem(NSMenuItem.separatorItem)
      servicesItem = addItemWithTitle('Services', action: nil, keyEquivalent: '')
      NSApp.servicesMenu = servicesItem.submenu = NSMenu.new
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle("Hide #{app_name}", action: 'hide:', keyEquivalent: 'h')
      item = addItemWithTitle('Hide Others', action: 'hideOtherApplications:', keyEquivalent: 'H')
      item.keyEquivalentModifierMask = NSCommandKeyMask|NSAlternateKeyMask
      addItemWithTitle('Show All', action: 'unhideAllApplications:', keyEquivalent: '')
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle("Quit #{app_name}", action: 'terminate:', keyEquivalent: 'q')
    end

    add_menu('File') do
      addItemWithTitle('New', action: 'newDocument:', keyEquivalent: 'n')
      addItemWithTitle('Open…', action: 'openDocument:', keyEquivalent: 'o')
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle('Close', action: 'performClose:', keyEquivalent: 'w')
      addItemWithTitle('Save…', action: 'saveDocument:', keyEquivalent: 's')
      addItemWithTitle('Revert to Saved', action: 'revertDocumentToSaved:', keyEquivalent: '')
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle('Page Setup…', action: 'runPageLayout:', keyEquivalent: 'P')
      addItemWithTitle('Print…', action: 'printDocument:', keyEquivalent: 'p')
    end

    add_menu('Edit') do
      addItemWithTitle('Undo', action: 'undo:', keyEquivalent: 'z')
      addItemWithTitle('Redo', action: 'redo:', keyEquivalent: 'Z')
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle('Cut', action: 'cut:', keyEquivalent: 'x')
      addItemWithTitle('Copy', action: 'copy:', keyEquivalent: 'c')
      addItemWithTitle('Paste', action: 'paste:', keyEquivalent: 'v')
      item = addItemWithTitle('Paste and Match Style', action: 'pasteAsPlainText:', keyEquivalent: 'V')
      item.keyEquivalentModifierMask = NSCommandKeyMask|NSAlternateKeyMask
      addItemWithTitle('Delete', action: 'delete:', keyEquivalent: '')
      addItemWithTitle('Select All', action: 'selectAll:', keyEquivalent: 'a')
    end

    fontMenu = create_menu('Font') do
      addItemWithTitle('Show Fonts', action: 'orderFrontFontPanel:', keyEquivalent: 't')
      addItemWithTitle('Bold', action: 'addFontTrait:', keyEquivalent: 'b')
      addItemWithTitle('Italic', action: 'addFontTrait:', keyEquivalent: 'i')
      addItemWithTitle('Underline', action: 'underline:', keyEquivalent: 'u')
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle('Bigger', action: 'modifyFont:', keyEquivalent: '+')
      addItemWithTitle('Smaller', action: 'modifyFont:', keyEquivalent: '-')
    end

    textMenu = create_menu('Text') do
      addItemWithTitle('Align Left', action: 'alignLeft:', keyEquivalent: '{')
      addItemWithTitle('Center', action: 'alignCenter:', keyEquivalent: '|')
      addItemWithTitle('Justify', action: 'alignJustified:', keyEquivalent: '')
      addItemWithTitle('Align Right', action: 'alignRight:', keyEquivalent: '}')
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle('Show Ruler', action: 'toggleRuler:', keyEquivalent: '')
      item = addItemWithTitle('Copy Ruler', action: 'copyRuler:', keyEquivalent: 'c')
      item.keyEquivalentModifierMask = NSCommandKeyMask|NSControlKeyMask
      item = addItemWithTitle('Paste Ruler', action: 'pasteRuler:', keyEquivalent: 'v')
      item.keyEquivalentModifierMask = NSCommandKeyMask|NSControlKeyMask
    end

    add_menu('Format') do
      addItem fontMenu
      addItem textMenu
    end

    add_menu('View') do
      item = addItemWithTitle('Show Toolbar', action: 'toggleToolbarShown:', keyEquivalent: 't')
      item.keyEquivalentModifierMask = NSCommandKeyMask|NSAlternateKeyMask
      addItemWithTitle('Customize Toolbar…', action: 'runToolbarCustomizationPalette:', keyEquivalent: '')
    end

    NSApp.windowsMenu = add_menu('Window') do
      addItemWithTitle('Minimize', action: 'performMiniaturize:', keyEquivalent: 'm')
      addItemWithTitle('Zoom', action: 'performZoom:', keyEquivalent: '')
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle('Bring All To Front', action: 'arrangeInFront:', keyEquivalent: '')
    end.menu

    NSApp.helpMenu = add_menu('Help') do
      addItemWithTitle("#{app_name} Help", action: 'showHelp:', keyEquivalent: '?')
    end.menu

    NSApp.mainMenu = @main_menu
  end

  private

  def add_menu(title, &b)
    item = create_menu(title, &b)
    @main_menu.addItem item
    item
  end

  def create_menu(title, &b)
    menu = NSMenu.alloc.initWithTitle(title)
    menu.instance_eval(&b) if b
    item = NSMenuItem.alloc.initWithTitle(title, action: nil, keyEquivalent: '')
    item.submenu = menu
    item
  end
end
