#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint ffi_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'celest_auth'
  s.version          = '0.0.1'
  s.summary          = 'Shared iOS/macOS platform code of Celest Auth.'
  s.description      = <<-DESC
  Shared iOS/macOS platform code of Celest Auth.
                       DESC
  s.homepage         = 'https://celest.dev'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Dillon Nys' => 'dillon@celest.dev' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  
  s.ios.dependency 'Flutter'
  s.osx.dependency 'FlutterMacOS'
  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.11'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.module_name = 'celest_auth'
  s.swift_version = '5.0'
end
