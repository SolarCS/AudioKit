Pod::Spec.new do |s|
  s.name     = 'AudioKit'
  s.version  = '4.7.1'
  s.license  = 'MIT'
  s.summary  = 'Open-source audio synthesis, processing, & analysis platform.'
  s.homepage = 'http://audiokit.io/'
  s.authors  = { 'Aurelius Prochazka' => 'audiokit@audiokit.io' }
  s.source   = { :git => 'https://github.com/audiokit/AudioKit.git', :tag => 'v4.7.1' }
  s.static_framework = true

  s.frameworks = 'AVFoundation'
  s.library = 'c++'

  s.swift_version = '5.0'
  s.cocoapods_version = '>= 1.5.0'

  s.user_target_xcconfig = {
        "ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES": "YES",
        "LIBRARY_SEARCH_PATHS": "$(TOOLCHAIN_DIR)/usr/lib/swift/$(PLATFORM_NAME)"
  }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '10.0'

  s.subspec 'Core' do |ss|
    ss.osx.source_files = 'macOS/AudioKit.framework/Versions/A/Headers/*.h'
    ss.osx.public_header_files = 'macOS/AudioKit.framework/Versions/A/Headers/*.h'
    ss.osx.vendored_libraries   = 'macOS/AudioKit.framework'

    ss.ios.source_files = 'iOS/AudioKit.framework/Headers/*.h'
    ss.ios.public_header_files = 'iOS/AudioKit.framework/Headers/*.h'
    ss.ios.vendored_libraries   = 'iOS/AudioKit.framework'

    ss.tvos.source_files = 'tvOS/AudioKit.framework/Headers/*.h'
    ss.tvos.public_header_files = 'tvOS/AudioKit.framework/Headers/*.h'
    ss.tvos.vendored_libraries   = 'tvOS/AudioKit.framework'
  end

  s.subspec 'UI' do |ss|
    ss.dependency 'AudioKit/Core'
    ss.osx.source_files = 'macOS/AudioKitUI.framework/Versions/A/Headers/*.h'
    ss.osx.public_header_files = 'macOS/AudioKitUI.framework/Versions/A/Headers/*.h'
    ss.osx.vendored_libraries   = 'macOS/AudioKitUI.framework'

    ss.ios.source_files = 'iOS/AudioKitUI.framework/Headers/*.h'
    ss.ios.public_header_files = 'iOS/AudioKitUI.framework/Headers/*.h'
    ss.ios.vendored_libraries   = 'iOS/AudioKitUI.framework'
    
    ss.tvos.source_files = 'tvOS/AudioKitUI.framework/Headers/*.h'
    ss.tvos.public_header_files = 'tvOS/AudioKitUI.framework/Headers/*.h'
    ss.tvos.vendored_libraries   = 'tvOS/AudioKitUI.framework'
  end
end
