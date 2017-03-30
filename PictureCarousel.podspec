Pod::Spec.new do |s|
  s.name = 'PictureCarousel'
  s.version = '1.0.0'

  s.osx.deployment_target = '10.8'
  s.ios.deployment_target = '7.0'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.license = 'MIT'
  s.summary = 'Asynchronous image downloader with cache support with an UIImageView category.'
  s.homepage = 'https://github.com/rwpnyn/PictureCarousel'
  s.author = { 'Rocky' => '838086117@qq.com' }
  s.source = { :git => 'https://github.com/rwpnyn/PictureCarousel.git', :tag => s.version.to_s }
  s.source_files = 'PictureCarousel/*'

  s.description = '图片轮播'

  s.requires_arc = true
  s.framework = 'UIKit', 'Foundation'
  
  s.dependency = 'SDWebImage'



end
