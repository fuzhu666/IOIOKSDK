#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint test_plugins.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'test_plugins'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
  s.vendored_frameworks = 'Framework/*'
  

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }
  s.swift_version = '5.0'
  s.static_framework = true
  s.dependency 'GGOpenSDK', '~> 1.4.0'
  s.dependency 'Google-Mobile-Ads-SDK', '~> 11.10.0'
  s.dependency 'AppsFlyerFramework', '~> 6.15.3'
  s.dependency 'FBSDKCoreKit', '~> 17.4'
  s.dependency 'AppLovinSDK', '~> 13.0.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'test_plugins_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end
