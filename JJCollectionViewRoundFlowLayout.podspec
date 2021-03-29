#
# Be sure to run `pod lib lint JJCollectionViewRoundFlowLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JJCollectionViewRoundFlowLayout'
  s.version          = '2.6.0'
  s.summary          = 'JJCollectionViewRoundFlowLayout可设置CollectionView的BackgroundColor，设置简单，可自定义背景颜色偏移等功能。'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO:JJCollectionViewRoundFlowLayout可设置CollectionView的BackgroundColor，可根据用户Cell个数计算背景图尺寸，可自定义是否包括计算CollectionViewHeaderView、CollectionViewFootererView或只计算Cells。设置简单，可自定义背景颜色偏移，设置显示方向（竖向、横向）显示,不同Section设置不同的背景颜色。支持Cell对齐模式。支持左、中、右、右开启模式。支持背景图点击事件响应.
                       DESC

  s.homepage         = 'https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kingjiajie' => 'kingjiajie@sina.com' }
  s.source           = { :git => 'https://github.com/kingjiajie/JJCollectionViewRoundFlowLayout.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'JJCollectionViewRoundFlowLayout/Classes/**/*'
  s.frameworks       = 'UIKit'
  
end
