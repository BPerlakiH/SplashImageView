#  Be sure to run `pod spec lint SplashImageView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.

Pod::Spec.new do |s|

  s.name         = "SplashImageView"
  s.version      = "0.0.3"
  s.summary      = "Extend your launch image with an imageView. Responsive to device rotations."

  s.description  = <<-DESC
                   Easily extend your launch image screen, defined in your Launch xcasset.
                   Add it to your contoller in a form of UIImageView, and you can do your magick
                   later, eg. fade it out once everything is loaded.
                   DESC

  s.homepage     = "https://github.com/BPerlakiH/SplashImageView"
  s.license      = "MIT"
  s.author = "BPH"
  s.platform = :ios, "7.0"
  s.source       = { :git => "https://github.com/BPerlakiH/SplashImageView.git", :tag => "0.0.3" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  s.frameworks = "Foundation"
  s.requires_arc = true

  # s.dependency "JSONKit", "~> 1.4"

end
