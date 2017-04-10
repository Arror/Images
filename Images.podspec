Pod::Spec.new do |s|

  s.name = 'Images'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'Images.'
  s.homepage = 'https://github.com/Arror/Images'
  s.authors = { 'Arror' => 'hallo.maqiang@gmail.com' }
  s.source = { git: 'https://github.com/Arror/Images.git', tag: s.version }

  s.default_subspec = 'Core'
  s.platform = :ios, '8.0'

  s.subspec 'Core' do |core|
    core.ios.source_files = 'Sources/Core/*.swift'
    core.dependency "YYWebImage"
  end

  s.subspec 'Qiniu' do |qiniu|
    qiniu.ios.source_files = 'Sources/Qiniu/*.swift'
    qiniu.dependency "Images/Core"
  end

end