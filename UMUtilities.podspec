Pod::Spec.new do |s|

  s.name         = "UMUtilities"
  s.version      = "0.1.0"
  s.summary      = "Biblioteca de Classes Utilitárias"
  s.homepage     = "https://github.com/ramonvic/UMUtilities"
  s.screenshots  = "https://github.com/ramonvic/UMUtilities/raw/master/Docs/screen1.png"
  s.license      = { :type => "MIT", :file => "LICENSE.md" }
  s.author       = { "Ramon Vicente" => "ramonvicentesilva@hotmail.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/ramonvic/UMUtilities.git", :tag => "0.1.0" }
  s.requires_arc = true
  s.ios.deployment_target = '7.1'

  s.source_files  = "UMUtilities/**/*.{h,m}"

  s.dependency 'AFNetworking', '~> 2.6.0'
  s.dependency 'YIInnerShadowView'
  s.dependency 'SDWebImage'
  s.dependency 'VMaskTextField', '~> 1.0.4'
  s.dependency 'Mantle', '~> 2.0'
end
