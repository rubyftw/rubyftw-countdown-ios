class CountdownViewController < UIViewController

  def viewDidLoad
    # always call super!
    super

    setupCountdownLabel

    # start a timer that calls 'updateCountdown' every second
    @timer = NSTimer.scheduledTimerWithTimeInterval(1,
                                                    target: self,
                                                    selector: 'updateCountdown',
                                                    userInfo: nil,
                                                    repeats: true)

  end

  def setupCountdownLabel

    # create a label that is the same size as the view controller's view
    @label = UILabel.alloc.initWithFrame(self.view.bounds)

    # note: to_color is provided by the bubble-wrap gem
    @label.backgroundColor = "#991139".to_color

    @label.textColor = UIColor.whiteColor

    # note: UIFont only knows of the fonts included in iOS
    @label.font = UIFont.fontWithName("Avenir-Roman", size: 36)

    @label.textAlignment = NSTextAlignmentCenter

    # numberOfLines = 0 means the line count won't be limited
    @label.numberOfLines = 0

    # allow the window to rotate (cmd + arrows in simulator)
    @label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth

    # add the label to the view
    self.view.addSubview(@label)

  end

  def dateWeAreCountingDownTo
    # change this to the time you're counting down to
    # YEAR, MONTH, DAY, HOUR, MINUTES, SECONDS
    Time.local(2013,"may",29,16,00,0)
  end

  def updateCountdown
    secondsToGo = (dateWeAreCountingDownTo - Time.now).to_i
    minutes = (secondsToGo % 3600) / 60
    seconds = (secondsToGo % 3600) % 60

    message = messageToDisplayWithMinutesRemaining(minutes)

    if secondsToGo < 0
      # stop the timer
      @timer.invalidate
      @label.text = messageToDisplayWhenCountdownIsOver
    else
      @label.text = "#{message}\n#{minutes}:%02d" % seconds
    end

  end

  def messageToDisplayWithMinutesRemaining(minutes)
    "This shows up when five minutes from the end" if minutes < 5
    "More text here during the countdown!" if minutes < 2
    "Last chance to run to the bathroom!" if minutes < 1
    "Welcome to RubyFTW!\nWifi: wifiname\npw: password"
  end

  def messageToDisplayWhenCountdownIsOver
    "Welcome!"
  end

end