Pod::Spec.new do |s|


s.name         = "PictureCarousel"
s.version      = "0.0.1"
s.summary      = '图片轮播'
s.description  = <<-DESC
非常好用的图片轮播
DESC
s.homepage     = 'https://github.com/rwpnyn/PictureCarousel'
s.license      = { :type => "MIT", :file => "LICENSE" }

s.author = { 'Rocky' => '838086117@qq.com' }
s.platform     = :ios, "7.0"
s.source       = { :git => "https://github.com/rwpnyn/PictureCarousel.git", :tag => s.version }
s.source_files = "PictureCarousel/*.{h,m}"
s.resources    = "PictureCarousel/*.png"
s.frameworks   = "UIKit", "Foundation"
s.requires_arc = true
s.dependency "SDWebImage"

end

