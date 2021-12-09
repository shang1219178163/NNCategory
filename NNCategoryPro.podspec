

Pod::Spec.new do |s|

  s.name         = "NNCategoryPro"
  s.version      = "7.8.1"
  s.summary      = "分类-项目通用方法封装."
  s.description  = "项目封装的实现主体,主要通过分类实现"

   s.homepage     = "https://github.com/shang1219178163/NNCategoryPro"
   # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

   s.license      = { :type => "MIT", :file => "LICENSE" }
   s.author       = { "BIN" => "shang1219178163@gmail.com" }
 
   s.platform     = :ios, '10.0'
   s.ios.deployment_target = '10.0'
   s.requires_arc = true

   s.source       = { :git => "https://github.com/shang1219178163/NNCategoryPro.git", :tag => "#{s.version}" }

   s.source_files = "NNCategoryPro/*"
   s.public_header_files = "NNCategoryPro/*.h"

   s.frameworks = 'UIKit', 'CoreFoundation', 'CoreGraphics', 'CoreImage',
   'CoreLocation','QuartzCore','WebKit'

   s.dependency 'NNGloble'

   s.dependency 'SDWebImage'
   s.dependency 'IQKeyboardManager'
   s.dependency 'GTMBase64'

end
