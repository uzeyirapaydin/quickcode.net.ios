platform :ios, '11.0'

workspace 'quickcode.net'

target 'quickcode.net' do
    use_frameworks!
    pod 'QuickCodeNetClient',  :path => './QuickCodeNetClient'
    pod 'LGSideMenuController'
    pod 'SwiftMessages'
    pod 'MaterialTextField'
    pod 'SwiftLocation'
    pod 'SwiftyButton'
    pod 'UITextField+Shake', '~> 1.2'
    pod 'SCLAlertView'
    pod 'GoogleMaps'
    pod 'GooglePlaces'
    pod 'FSCalendar'
    pod 'ALCameraViewController'
    pod 'PinCodeTextField'
    pod 'LRTextField'
    pod 'NVActivityIndicatorView'
    pod 'KMPlaceholderTextView'
    pod 'FontAwesome.swift'
end


target 'Utils' do
    project 'Utils/Utils.xcodeproj'
    pod 'QuickCodeNetClient',  :path => './QuickCodeNetClient'
    pod 'SwiftyButton'
    pod 'ALCameraViewController'
    pod 'LRTextField'
    pod 'FontAwesome.swift'
    pod 'KMPlaceholderTextView'
    pod 'NVActivityIndicatorView'
    use_frameworks!
end


post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
         config.build_settings.delete('CODE_SIGNING_ALLOWED')
         config.build_settings.delete('CODE_SIGNING_REQUIRED')
     end
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.name == 'Debug'
        config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      end
    end
  end
end
