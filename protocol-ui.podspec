Pod::Spec.new do |s|
  s.name = 'Protocol-UI'
  s.version = '0.1.2'
  s.license = 'MIT'
  s.summary = 'Framework for customizing UIKit using protocol extensions.'
  s.homepage = 'https://github.com/VojtaStavik/ProtocolUI'
  s.screenshots = "https://raw.githubusercontent.com/Vaberer/Font-Awesome-Swift/master/resources/image1.png"
  s.social_media_url = 'http://twitter.com/VojtaStavik'
  s.authors = { "Vojta Stavik" => "stavik@outlook.com" }
  s.source = { :git => 'https://github.com/VojtaStavik/ProtocolUI', :tag => s.version, :branch => 'version_0_1' }
  s.ios.deployment_target = '8.0'
  s.source_files   = 'ProtocolUI/*.swift'
  s.frameworks = 'UIKit'
  s.requires_arc = true
end
