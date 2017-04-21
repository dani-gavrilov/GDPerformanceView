Pod::Spec.new do |s|
  s.name         = "GDPerformanceView"
  s.version      = "1.3.2"
  s.summary      = "Shows FPS, CPU usage, app and iOS versions above the status bar and report FPS and CPU usage via delegate."
  s.homepage     = "https://github.com/dani-gavrilov/GDPerformanceView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Gavrilov Daniil" => "daniilmbox@gmail.com" }
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/dani-gavrilov/GDPerformanceView.git", :tag => "1.3.2" }
  s.source_files = "GDPerformanceView/GDPerformanceMonitoring/*"
  s.frameworks = "UIKit", "Foundation", "QuartzCore"  
  s.requires_arc = true
end
