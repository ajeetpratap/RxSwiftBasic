use_frameworks!

target 'YOUR_TARGET_NAME' do
  pod 'RxSwift', '4.0.0'
  
end



post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.0'
        end
    end
end
