Pod::Spec.new do |s|
  s.name         = 'NSDate-Extension'
  s.version      = '0.0.1'
  s.summary      = "Use NSDate-Extension to handle NSDate objects easily."
  s.homepage     = 'http://github.com/alexruperez/NSDate-Extension'
  s.screenshots  = 'http://raw.githubusercontent.com/alexruperez/NSDate-Extension/master/Example.png'
  s.license      = 'MIT'
  s.author       = { "alexruperez" => "contact@alexruperez.com" }
  s.social_media_url   = 'http://twitter.com/alexruperez'
  s.platform     = :ios
  s.source       = { :git => 'http://github.com/alexruperez/NSDate-Extension.git', :tag => '0.0.1' }
  s.source_files  = 'NSDate-Extension', "NSDate-Extension\ Example/NSDate-Extension/*.{h,m}"
  s.requires_arc = true
end
