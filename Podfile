platform :ios, '10.0'
use_frameworks!

target 'BitUncle' do
    pod 'Firebase'
    pod 'Firebase/RemoteConfig'
    pod 'SDWebImage'
    pod 'Stanwood/Core'
    pod 'SwiftRichString'

    target 'BitUncleTests' do
        inherit! :search_paths
    end
    
end

target 'BitUncleKit' do
    pod 'Moya'
    pod 'ReachabilitySwift'
    pod 'Stanwood/Core'
    
    target 'BitUncleKitTests' do
        inherit! :search_paths
    end
end

target 'AcceptanceTests' do
    platform :osx, 10.14
    pod 'OCSlimProject'
end
