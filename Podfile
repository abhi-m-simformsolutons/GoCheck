# Uncomment the next line to define a global platform for your project
 platform :ios, '12.4'

# ignore all warnings from all pods
inhibit_all_warnings!

def sharedPods
  pod 'ReachabilitySwift', '~> 4.3.1'
end

def podInstaller
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
      end
    end
  end
end


target 'WireGuardCheck' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for Layer
  
  pod 'R.swift', '~> 5.3.0'
  
  pod 'Alamofire', '~>  4.8.2'
  
  pod 'AlamofireImage', '~> 3.5.2'
  
  pod 'SwiftMessages', '~> 7.0.1'
  
  pod 'Dip', '~> 7.0.1'
  
  pod 'AWSS3', '~> 2.9.10'

  pod 'Sentry', :git => 'https://github.com/getsentry/sentry-cocoa.git', :tag => '5.0.0-beta.0'

  sharedPods
  
end

target 'vpn-tunnel' do
  use_frameworks!
  
  inherit! :search_paths
  
  sharedPods
  
end

