Pod::Spec.new do |s|
  s.name         = "Watches"
  s.version      = "0.5"
  s.summary      = "A Simple Stopwatches written in Swift help you easily measure the execution time of function, block of code or async callback."
  s.description  = <<-DESC
                   A Simple swift stopwatches helps you easily logging out the elapsed time between 2 timestamps , find out execution time of function, a block of code or async callback.
                   DESC
  s.homepage     = "https://github.com/untouchable741/Watches"
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.swift_version = '4.2'
  s.license      = "MIT (example)"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Tai Vuong" => "vhuutai@gmail.com" }
  s.source       = { :git => "https://github.com/untouchable741/Watches.git", :tag => "#{s.version}" }
  s.source_files = "Watches/*.swift"
end
