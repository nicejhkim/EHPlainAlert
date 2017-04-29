#
# Be sure to run `pod lib lint EHPlainAlert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "EHPlainAlert"
  s.version          = "1.2.7"
  s.summary          = "Simple plain-style system-wide alertview"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
  This is simple extension for presenting multiple plain-style system-wide alertview from bottom of device screen.
                       DESC

  s.homepage         = "https://github.com/josshad/EHPlainAlert/"
  # s.screenshots     = "https://github.com/josshad/EHPlainAlert/blob/master/assets/EHPlainAlert.gif"
  s.license          = 'MIT'
  s.author           = { "Danila Gusev" => "jos.shad@gmail.com" }
  s.source           = { :git => "https://github.com/josshad/EHPlainAlert.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.1'
  s.requires_arc = true

  s.source_files = 'EHPlainAlert/*'
  s.public_header_files = 'EHPlainAlert/*.h'
  s.resource_bundles = {
    'EHPlainAlert' => ['EHPlainAlert/icons/*.png']
  }

  
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'UIColor-HexRGB'
end
