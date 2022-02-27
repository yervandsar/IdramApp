Pod::Spec.new do |s|
s.name             = 'IdramApp'
s.version          = '1.0.1'
s.summary          = 'Idram payment handler manager'

s.homepage         = 'https://github.com/yervandsar/IdramApp'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Yervand Saribekyan' => 'yervandsar@gmail.com' }
s.source           = { :git => 'https://github.com/yervandsar/IdramApp.git', :tag => s.version.to_s }

s.ios.deployment_target = '11.0'
s.source_files     = "Sources/IdramApp/*/*.swift"

end
