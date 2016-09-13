Pod::Spec.new do |s|
  s.name         = "Watches"
  s.version      = "0.1"
  s.summary      = "A Simple stopwatches written in Swift."
  s.description  = <<-DESC
                   A Simple swift stopwatches helps you easily logging out the elapsed time, execution time of any function, closure.
                   DESC
  s.homepage     = "https://github.com/untouchable741/Watches"
  s.license      = "MIT (example)"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Tai Vuong" => "vhuutai@gmail.com" }
  s.source       = { :git => "https://github.com/untouchable741/Watches.git", :tag => "#{s.version}" }
  s.source_files = "WatchesExample/Watches/*.swift"
end
