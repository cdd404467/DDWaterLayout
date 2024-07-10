# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

inhibit_all_warnings!

target 'DDWaterLayout' do
  use_frameworks!


  pod 'SnapKit'



  target 'DDWaterLayoutTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'DDWaterLayoutUITests' do
    # Pods for testing
  end

end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      deployment_target = config.build_settings['IPHONEOS_DEPLOYMENT_TARGET']
      if !deployment_target.nil? && !deployment_target.empty? && deployment_target.to_f < 14.0
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      end
      # Exclude the 'ExampleFramework' from the simulator build
      
      
    end
  end
end
