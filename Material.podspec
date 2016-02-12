Pod::Spec.new do |s|
  s.name = 'Material'
  s.version = '1.31.6'
  s.license = 'BSD'
  s.summary = 'Material is an animation and graphics framework in Swift.'
  s.homepage = 'http://cosmicmind.io'
  s.social_media_url = 'https://www.facebook.com/graphkit'
  s.authors = { 'CosmicMind, Inc.' => 'support@cosmicmind.io' }
  s.source = { :git => 'https://github.com/CosmicMind/Material.git', :tag => s.version }
  s.ios.deployment_target = '8.0'
  s.source_files = 'Sources/*.swift'
  s.requires_arc = true
end
