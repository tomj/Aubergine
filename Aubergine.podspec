Pod::Spec.new do |s|
  s.name             = "Aubergine"
  s.version          = "0.0.4"
  s.summary          = "An iOS SDK for the Uber API"
  s.homepage         = "https://github.com/tomj/Aubergine"
  s.license          = 'MIT'
  s.author           = { "Tom Jowett" => "tom@tomjowett.com" }
  s.source           = { :git => "https://github.com/tomj/Aubergine.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Aubergine/Classes/**/*'
  s.dependency 'AFNetworking', '~> 2.4'
  s.dependency 'Mantle', '~> 1.5.4'  
end