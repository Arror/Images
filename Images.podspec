Pod::Spec.new do |s|
  s.name = 'Images'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.summary = 'Images.'
  s.homepage = 'https://github.com/Arror/Images'
  s.authors = { 'Arror' => 'hallo.maqiang@gmail.com' }
  s.source = { git: 'https://github.com/Arror/Images.git', tag: s.version }
  s.source_files = 'Sources/*.swift'
  s.ios.deployment_target = '8.0'
  s.dependency "YYWebImage"
end