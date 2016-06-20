platform :ios, '9.0'
inhibit_all_warnings!
use_frameworks!

target "Obesidad" do
    
    pod 'JSONModel'
    pod 'Fabric'
    pod 'Crashlytics'
    pod 'GoogleMaps'
    pod 'Google/CloudMessaging'
    pod 'IQKeyboardManager'
    pod 'JVFloatLabeledTextField'
    
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        puts "#{target.name}"
    end
end
