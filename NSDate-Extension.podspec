Pod::Spec.new do |s|
  s.name         = 'NSDate-Extension'
  s.version      = '0.0.2'
  s.summary      = "Use NSDate-Extension to handle NSDate objects easily."
  s.homepage     = 'https://github.com/alexruperez/NSDate-Extension'
  s.screenshots  = 'https://raw.githubusercontent.com/alexruperez/NSDate-Extension/master/Example.png'
  s.license      = 'MIT'
  s.author       = { "alexruperez" => "contact@alexruperez.com" }
  s.social_media_url   = 'https://twitter.com/alexruperez'
  s.platform     = :ios
  s.source       = { :git => 'https://github.com/alexruperez/NSDate-Extension.git', :tag => '0.0.2' }
  s.source_files  = 'NSDate-Extension', "NSDate-Extension\ Example/NSDate-Extension/*.{h,m}"
  s.requires_arc = true
end
