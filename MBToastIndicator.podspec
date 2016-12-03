
Pod::Spec.new do |s|

  s.name             = 'MBToastIndicator'
  s.version          = '0.3.0'
  s.summary          = 'A subclass of uiview that Provides Toast'

s.description      = <<-DESC
This CocoaPod provides the ability to use a UIView that may be show and hide Toaster.
DESC

  s.homepage         = 'https://github.com/ManickB/MBToastIndicator'
  s.license          = 'MIT'
  s.author           = { 'Manick' => 'manicktesting16@gmail.com' }
  s.source           = { :git => 'https://github.com/ManickB/MBToastIndicator.git', :tag => s.version.to_s }
 s.social_media_url = 'https://twitter.com/ManickThangaraj'
 s.platform     = :ios, '8.0'
 s.requires_arc = true

 s.source_files = 'Pod/Classes/**/*'
 s.resource_bundles = {
'MBToastIndicator' => ['Pod/Assets/*.png']
}
end
