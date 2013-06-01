class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    # Create a window that is the same size as the screen
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    # Set the countdown view controller as the window's root view controller
    @window.rootViewController = CountdownViewController.alloc.init

    @window.makeKeyAndVisible
    true
  end
end
