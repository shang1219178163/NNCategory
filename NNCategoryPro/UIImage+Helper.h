//
//  UIImage+Helper.h
//  
//
//  Created by BIN on 2017/7/31.
//  Copyright © 2017年 SHANG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Helper)

@property (nonatomic, strong, readonly, class) UIImage *skull;
@property (nonatomic, strong, readonly, class) UIImage *btn_add;
@property (nonatomic, strong, readonly, class) UIImage *btn_selected_NO;
@property (nonatomic, strong, readonly, class) UIImage *btn_selected_YES;
@property (nonatomic, strong, readonly, class) UIImage *icon_arowLeft_black;
@property (nonatomic, strong, readonly, class) UIImage *icon_search_bar;
@property (nonatomic, strong, readonly, class) UIImage *img_NFC;
@property (nonatomic, strong, readonly, class) UIImage *img_arrowDown_black;
@property (nonatomic, strong, readonly, class) UIImage *img_arrowDown_gray;
@property (nonatomic, strong, readonly, class) UIImage *img_arrowDown_orange;
@property (nonatomic, strong, readonly, class) UIImage *img_arrowLeft_white;
@property (nonatomic, strong, readonly, class) UIImage *img_arrowRight_gray;
@property (nonatomic, strong, readonly, class) UIImage *img_arrowUp_blue;
@property (nonatomic, strong, readonly, class) UIImage *img_dialog_inquiry;
@property (nonatomic, strong, readonly, class) UIImage *img_dialog_update;
@property (nonatomic, strong, readonly, class) UIImage *img_dialog_warning;
@property (nonatomic, strong, readonly, class) UIImage *img_elemet_decrease;
@property (nonatomic, strong, readonly, class) UIImage *img_elemet_increase;
@property (nonatomic, strong, readonly, class) UIImage *img_failedDefault;
@property (nonatomic, strong, readonly, class) UIImage *img_failedDefault_S;
@property (nonatomic, strong, readonly, class) UIImage *img_like_H;
@property (nonatomic, strong, readonly, class) UIImage *img_like_W;
@property (nonatomic, strong, readonly, class) UIImage *img_location_H;
@property (nonatomic, strong, readonly, class) UIImage *img_more;
@property (nonatomic, strong, readonly, class) UIImage *img_notice;
@property (nonatomic, strong, readonly, class) UIImage *img_pictureAdd;
@property (nonatomic, strong, readonly, class) UIImage *img_pictureDelete;
@property (nonatomic, strong, readonly, class) UIImage *img_portrait_H;
@property (nonatomic, strong, readonly, class) UIImage *img_portrait_N;
@property (nonatomic, strong, readonly, class) UIImage *img_scan;
@property (nonatomic, strong, readonly, class) UIImage *img_sex_boy;
@property (nonatomic, strong, readonly, class) UIImage *img_sex_gril;


@property (nonatomic, strong, readonly) NSString *contentType;

@property (nonatomic, strong, readonly) NSArray *ciDetectorFeatures;

/// UIColor->UIImage
FOUNDATION_EXPORT UIImage * UIImageColor(UIColor *color);
/// 十六进制数值->UIImage
FOUNDATION_EXPORT UIImage * UIImageColorHexAlpha(NSInteger hex, CGFloat alpha);
/// 获取->UIImage
FOUNDATION_EXPORT UIImage * UIImageNamed(NSString *obj);

FOUNDATION_EXPORT UIImage * UIImageFromName(NSString *obj, UIImageRenderingMode renderingMode);

FOUNDATION_EXPORT UIImage * UIImageObj(id obj);

///保存到相册
- (void)saveImageToPhotosAlbum:(void(^)(NSError *error))block;

/// UIImage是否相等
FOUNDATION_EXPORT bool UIImageEquelToImage(UIImage *image0, UIImage *image1);
/// 获取第三方库bundle中图像资源
+ (UIImage *)imageNamed:(NSString *)imgName podName:(NSString *)podName;

/// 通过图片Data数据第一个字节 来获取图片扩展名
+ (NSString *)contentTypeForImageData:(NSData *)data;

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)snapshotImageWithView:(UIView *)view;

- (UIImage *)croppedImage:(CGRect)cropRect;

- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

- (UIImage *)normalizedImage;

- (UIImage *)fixOrientation;

- (UIImage *)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size;

/**
 区别:
 效果:第一种Core Image设置模糊之后会在周围产生白边，vImage使用不存在任何问题；
 性能:图像模糊处理属于复杂的计算，大部分图片模糊选择的是vImage，性能最佳
 
 Core Image是苹果提供的一个相当强大专门用于处理图片的库。稍微试了一下，不仅能实现毛玻璃效果，还能实现很多其他的效果。但是，在使用过程中发现使用Core Image来实现这些效果，非常占用内存。查看文档:createCGImage:outputImage : fromRect:方法会单独开辟一个临时的缓存区，出现离屏渲染，这可能是一个使得内存增大的重要原因。
 
 *  CoreImage图片高斯模糊
 *  @param blur  模糊数值(默认是10)
 *
 *  @return 重新绘制的新图片
 */

-(UIImage *)coreBlurNumber:(CGFloat)blur;

/**
 *  vImage模糊图片(推荐)
 *
 *  @param blur  模糊数值(0-1)
 *
 *  @return 重新绘制的新图片
 */
-(UIImage *)boxBlurNumber:(CGFloat)blur;

- (BOOL)isEquelImage:(id)image;

+ (BOOL)image:(UIImage *)image1 isEqualTo:(UIImage *)image2;

- (UIColor *)mostColor;

//获取图像某一点的颜色
- (UIColor *)colorAtPixel:(CGPoint)point;

#pragma mark -压缩图片
+ (UIImage *)resizeImage:(UIImage *)image toMaxSize:(CGSize)maxSize;

// 大图缩小为显示尺寸的图
- (UIImage *)downsampleImageAt:(NSURL *)imageURL to:(CGSize)pointSize scale:(CGFloat)scale;

//1.自动缩放到指定大小
- (UIImage *)thumbnailToFileSize:(CGSize)asize;

//2.保持原来的长宽比，生成一个缩略图
- (UIImage *)thumbnailWithoutScaleToFileSize:(CGSize)asize;

// 调整图片分辨率/尺寸（等比例缩放）
- (UIImage *)newSizeImage:(CGSize)size;

//递归缩小压缩系数,返回压缩后imageData
- (NSData *)compressToFileSize:(NSInteger)fileSize;

/**
 保证图片清晰度,先压缩图片质量。如果要使图片一定小于指定大小，压缩图片尺寸可以满足。对于后一种需求，还可以先压缩图片质量，如果已经小于指定大小，就可得到清晰的图片，否则再压缩图片尺寸。
 @param maxLength 文件大小
 @return uiimage
 */
- (UIImage *)compressImageToByte:(NSUInteger)maxLength;

@end

NS_ASSUME_NONNULL_END
