Pod::Spec.new do |s|
  s.name             = 'flutter_ioioksdk'
  s.version          = '0.0.1'
  s.summary          = 'flutter version of IOIOKSDK.'
  s.description      = <<-DESC
flutter version of IOIOKSDK.
                       DESC
  s.homepage         = 'https://github.com/fuzhu666'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'fuzhu' => 'fuzhu177@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'
  s.vendored_frameworks = 'Framework/*'
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

end