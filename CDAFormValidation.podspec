#
# Be sure to run `pod lib lint CDAFormValidation.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "CDAFormValidation"
  s.version          = "0.1.1"
  s.summary          = "Simple Formvalidation Library"
  s.description      = <<-DESC
                       Block based library to add validations to the forms in your app.
                       DESC
  s.homepage         = "https://github.com/Codedazur/form-validator-ios"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "tamarabernad" => "tamara@codedazur.es" }
  s.source           = { :git => "https://github.com/Codedazur/form-validator-ios.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'CDAFormValidation' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
