
//
//  UIImage+Helper.m
//  
//
//  Created by BIN on 2017/7/31.
//  Copyright © 2017年 SHANG. All rights reserved.
//

#import "UIImage+Helper.h"
#import <Accelerate/Accelerate.h>

#import <NNGloble/NNGloble.h>
#import "UIColor+Helper.h"
#import "NSBundle+Helper.h"

@implementation UIImage (Helper)

+ (UIImage *)skull{
    return [UIImage imageNamed:@"Skull" podName:@"NNGloble"];
}

+ (UIImage *)btn_add{
    return [UIImage imageNamed:@"btn_add" podName:@"NNGloble"];
}

+ (UIImage *)btn_selected_NO{
    return [UIImage imageNamed:@"btn_selected_NO" podName:@"NNGloble"];
}

+ (UIImage *)btn_selected_YES{
    return [UIImage imageNamed:@"btn_selected_YES" podName:@"NNGloble"];
}

+ (UIImage *)icon_arowLeft_black{
    return [UIImage imageNamed:@"icon_arowLeft_black" podName:@"NNGloble"];
}

+ (UIImage *)icon_search_bar{
    return [UIImage imageNamed:@"icon_search_bar" podName:@"NNGloble"];
}

+ (UIImage *)img_NFC{
    return [UIImage imageNamed:@"img_NFC" podName:@"NNGloble"];
}

+ (UIImage *)img_arrowDown_black{
    return [UIImage imageNamed:@"img_arrowDown_black" podName:@"NNGloble"];
}

+ (UIImage *)img_arrowDown_gray{
    return [UIImage imageNamed:@"img_arrowDown_gray" podName:@"NNGloble"];
}

+ (UIImage *)img_arrowDown_orange{
    return [UIImage imageNamed:@"img_arrowDown_orange" podName:@"NNGloble"];
}

+ (UIImage *)img_arrowLeft_white{
    return [UIImage imageNamed:@"img_arrowLeft_white" podName:@"NNGloble"];
}

+ (UIImage *)img_arrowRight_gray{
    return [UIImage imageNamed:@"img_arrowRight_gray" podName:@"NNGloble"];
}

+ (UIImage *)img_arrowUp_blue{
    return [UIImage imageNamed:@"img_arrowUp_blue" podName:@"NNGloble"];
}

+ (UIImage *)img_dialog_inquiry{
    return [UIImage imageNamed:@"img_dialog_inquiry" podName:@"NNGloble"];
}

+ (UIImage *)img_dialog_update{
    return [UIImage imageNamed:@"img_dialog_update" podName:@"NNGloble"];
}

+ (UIImage *)img_dialog_warning{
    return [UIImage imageNamed:@"img_dialog_warning" podName:@"NNGloble"];
}

+ (UIImage *)img_elemet_decrease{
    return [UIImage imageNamed:@"img_elemet_decrease" podName:@"NNGloble"];
}

+ (UIImage *)img_elemet_increase{
    return [UIImage imageNamed:@"img_elemet_increase" podName:@"NNGloble"];
}

+ (UIImage *)img_failedDefault{
    return [UIImage imageNamed:@"img_failedDefault" podName:@"NNGloble"];
}

+ (UIImage *)img_failedDefault_S{
    return [UIImage imageNamed:@"img_failedDefault_S" podName:@"NNGloble"];
}

+ (UIImage *)img_like_H{
    return [UIImage imageNamed:@"img_like_H" podName:@"NNGloble"];
}

+ (UIImage *)img_like_W{
    return [UIImage imageNamed:@"img_like_W" podName:@"NNGloble"];
}

+ (UIImage *)img_location_H{
    return [UIImage imageNamed:@"img_location_H" podName:@"NNGloble"];
}

+ (UIImage *)img_more{
    return [UIImage imageNamed:@"img_more" podName:@"NNGloble"];
}

+ (UIImage *)img_notice{
    return [UIImage imageNamed:@"img_notice" podName:@"NNGloble"];
}

+ (UIImage *)img_pictureAdd{
    return [UIImage imageNamed:@"img_pictureAdd" podName:@"NNGloble"];
}

+ (UIImage *)img_pictureDelete{
    return [UIImage imageNamed:@"img_pictureDelete" podName:@"NNGloble"];
}

+ (UIImage *)img_portrait_H{
    return [UIImage imageNamed:@"img_portrait_H" podName:@"NNGloble"];
}

+ (UIImage *)img_portrait_N{
    return [UIImage imageNamed:@"img_portrait_N" podName:@"NNGloble"];
}

+ (UIImage *)img_scan{
    return [UIImage imageNamed:@"img_scan" podName:@"NNGloble"];
}

+ (UIImage *)img_sex_boy{
    return [UIImage imageNamed:@"img_sex_boy" podName:@"NNGloble"];
}

+ (UIImage *)img_sex_gril{
    return [UIImage imageNamed:@"img_sex_gril" podName:@"NNGloble"];
}

- (NSString *)contentType{
    NSData * imgData = UIImageJPEGRepresentation(self, 1.0f);
    return [UIImage contentTypeForImageData:imgData];
}

- (NSArray *)ciDetectorFeatures{
    NSDictionary *options = @{CIDetectorAccuracy: CIDetectorAccuracyHigh,
                            };
    CIImage *cImage = [CIImage imageWithCGImage: self.CGImage];
    
    NSDictionary *imageOptions = @{CIDetectorImageOrientation: @(5),
                                   };
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeFace context:nil options:options];
    NSArray *features = [detector featuresInImage:cImage options:imageOptions];
    return features;
}

UIImage * UIImageColor(UIColor * color){
    return [UIImage imageWithColor:color];
}

UIImage * UIImageColorHexAlpha(NSInteger hex, CGFloat alpha){
    return UIImageColor(UIColorHexValueAlpha(hex, alpha));
}

/**
 NSString->UIImage
 */
UIImage * UIImageNamed(NSString * obj){
    return [UIImage imageNamed:obj];
}

UIImage * UIImageFromName(NSString *obj, UIImageRenderingMode renderingMode){
    return [[UIImage imageNamed:obj] imageWithRenderingMode:renderingMode];
}

/**
 id类型->UIImage
 */
UIImage * UIImageObj(id obj){
    if ([obj isKindOfClass:[NSString class]]) {
        return UIImageNamed(obj);
    }
    else if ([obj isKindOfClass:[UIColor class]]) {
        return UIImageColor(obj);
    }
    else if ([obj isKindOfClass:[UIImage class]]) {
        return obj;
    }
    else if ([obj isKindOfClass:[NSData class]]) {
        return [UIImage imageWithData:obj];
    }
    else if ([obj isKindOfClass:[CIImage class]]) {
        return [UIImage imageWithCIImage:obj];
    }
    return nil;
}

- (void)saveImageToPhotosAlbum:(void(^)(NSError *error))block{
    UIImageWriteToSavedPhotosAlbum(self,
                                   self,
                                   @selector(image:didFinishSavingWithError:contextInfo:),
                                   (__bridge_retained void *)[block copy]);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    void(^block)(NSError *) = CFBridgingRelease(contextInfo);
    if (block) {
        block(error);
    }
}

bool UIImageEquelToImage(UIImage *image0, UIImage *image1){
    NSData *data0 = UIImagePNGRepresentation(image0);
    NSData *data1 = UIImagePNGRepresentation(image1);
    return  [data0 isEqualToData:data1];
}

+ (UIImage *)imageNamed:(NSString *)imgName podName:(NSString *)podName{
    NSBundle *resource_bundle = [NSBundle bundleWithPodName:podName bundleName:podName];
    UIImage *image = [UIImage imageNamed:imgName inBundle:resource_bundle compatibleWithTraitCollection:nil];
    return image;
}

+ (NSString *)contentTypeForImageData:(NSData *)data{
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
        case 0x4D:
            return @"tiff";
        case 0x52:
            if ([data length] < 12) {
                return nil;
            }
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return @"webp";
            }
            return nil;
    }
    return nil;
}

+ (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.mainScreen.scale);

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)snapshotImageWithView:(UIView *)view{
    if (nil == view) {
        return nil;
    }
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, UIScreen.mainScreen.scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)croppedImage:(CGRect)cropRect{
    CGImageRef croppedCGImage = CGImageCreateWithImageInRect(self.CGImage ,cropRect);
    UIImage *croppedImage = [UIImage imageWithCGImage:croppedCGImage scale:1 orientation:self.imageOrientation];
    CGImageRelease(croppedCGImage);
    return croppedImage;
}

- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees{
    UIImage *image = self;

    CGFloat width = CGImageGetWidth(image.CGImage);
    CGFloat height = CGImageGetHeight(image.CGImage);
    
    CGSize rotatedSize;
    
    rotatedSize.width = width;
    rotatedSize.height = height;
    
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    CGContextRotateCTM(bitmap, degrees * M_PI / 180);
    CGContextRotateCTM(bitmap, M_PI);
    CGContextScaleCTM(bitmap, -1.0, 1.0);
    CGContextDrawImage(bitmap, CGRectMake(-rotatedSize.width/2, -rotatedSize.height/2, rotatedSize.width, rotatedSize.height), image.CGImage);
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)normalizedImage {
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [self drawInRect:(CGRect){0, 0, self.size}];
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}

- (UIImage *)fixOrientation {
    
    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL,
                                             self.size.width,
                                             self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

/**
 高性能圆角
 */
- (UIImage *)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect
                                                byRoundingCorners:UIRectCornerAllCorners
                                                      cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(ctx,path.CGPath);
    CGContextClip(ctx);
    [self drawInRect:rect];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

-(UIImage *)coreBlurNumber:(CGFloat)blur {
    UIImage *image = self;
    //博客园-FlyElephant
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage  *inputImage=[CIImage imageWithCGImage:image.CGImage];
    //设置filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:@(blur) forKey: @"inputRadius"];
    //模糊图片
    CIImage *result=[filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage=[context createCGImage:result fromRect:[result extent]];
    UIImage *blurImage=[UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
}

-(UIImage *)boxBlurNumber:(CGFloat)blur {
    UIImage *image = self;
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = image.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    
    void *pixelBuffer;
    //从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    //设置从CGImage获取对象的属性
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) *
                         CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer,
                                       &outBuffer,
                                       NULL,
                                       0,
                                       0,
                                       boxSize,
                                       boxSize,
                                       NULL,
                                       kvImageEdgeExtend);
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}

- (BOOL)isEquelImage:(id)image{
    NSParameterAssert([image isKindOfClass: NSString.class] || [image isKindOfClass: UIImage.class]);
    
    NSData *imageData = UIImageJPEGRepresentation(self, 1.0);
    if ([image isKindOfClass:[NSString class]]) {
        UIImage *image1 = [UIImage imageNamed:image];
        NSData *imageData1 = UIImageJPEGRepresentation(image1, 1.0);
        return [imageData isEqualToData:imageData1];
    }
    
    NSData *imageData1 = UIImageJPEGRepresentation(image, 1.0);
    return [imageData isEqualToData:imageData1];
}

+ (BOOL)image:(UIImage *)image1 isEqualTo:(UIImage *)image2{
    NSData *data1 = UIImageJPEGRepresentation(image1, 1.0);
    NSData *data2 = UIImageJPEGRepresentation(image2, 1.0);
    return [data1 isEqualToData:data2];
}

//根据图片获取图片的主色调
- (UIColor *)mostColor{
    UIImage *image = self;
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;

    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize = CGSizeMake(image.size.width/2, image.size.height/2);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    if (data == NULL) return nil;
    NSCountedSet *cls = [NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    
    for (int x = 0; x < thumbSize.width; x++) {
        for (int y = 0; y < thumbSize.height; y++) {
            int offset = 4*(x*y);
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha = data[offset+3];
            if (alpha>0) {//去除透明
                if (red == 255 && green == 255 && blue == 255) {//去除白色
                } else {
                    NSArray *clr = @[@(red),@(green),@(blue),@(alpha)];
                    [cls addObject:clr];
                }
                
            }
        }
    }
    CGContextRelease(context);
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    NSArray *MaxColor = nil;
    NSUInteger MaxCount = 0;
    while ( (curColor = [enumerator nextObject]) != nil )
    {
        NSUInteger tmpCount = [cls countForObject:curColor];
        if ( tmpCount < MaxCount ) continue;
        MaxCount = tmpCount;
        MaxColor = curColor;
        
    }
    //    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
    
    NSInteger r = [MaxColor[0] intValue];
    NSInteger g = [MaxColor[1] intValue];
    NSInteger b = [MaxColor[2] intValue];
    NSInteger a = [MaxColor[3] intValue];
    
    //    NSLog(@"{%@,%@,%@,%@}",@(r),@(g),@(b),@(a));
    return [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:(a/255.0f)];
}

//获取图像某一点的颜色
- (UIColor *)colorAtPixel:(CGPoint)point {
    UIImage * image = self;
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, image.size.width, image.size.height), point)) {
        return nil;
    }
    
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = image.CGImage;
    NSUInteger width = image.size.width;
    NSUInteger height = image.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData,
                                                 1,
                                                 1,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

#pragma mark - - 压缩
+ (UIImage *)resizeImage:(UIImage *)image toMaxSize:(CGSize)maxSize {
    CGFloat widthRatio = maxSize.width / image.size.width;
    CGFloat heightRatio = maxSize.height / image.size.height;
    CGFloat scaleRatio = widthRatio < heightRatio ? widthRatio : heightRatio;
    CGSize newSize = CGSizeMake(image.size.width * scaleRatio, image.size.height * scaleRatio);
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, image.scale);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resizedImage;
}
// 大图缩小为显示尺寸的图
- (UIImage *)downsampleImageAt:(NSURL *)imageURL to:(CGSize)pointSize scale:(CGFloat)scale {
    // 利用图像文件地址创建 image source
    NSDictionary *imageSourceOptions =
  @{
    (__bridge NSString *)kCGImageSourceShouldCache: @NO // 原始图像不要解码
    };
    CGImageSourceRef imageSource =
    CGImageSourceCreateWithURL((__bridge CFURLRef)imageURL, (__bridge CFDictionaryRef)imageSourceOptions);

    // 下采样
    CGFloat maxDimensionInPixels = MAX(pointSize.width, pointSize.height) * scale;
    NSDictionary *downsampleOptions =
    @{
      (__bridge NSString *)kCGImageSourceCreateThumbnailFromImageAlways: @YES,
      (__bridge NSString *)kCGImageSourceShouldCacheImmediately: @YES,  // 缩小图像的同时进行解码
      (__bridge NSString *)kCGImageSourceCreateThumbnailWithTransform: @YES,
      (__bridge NSString *)kCGImageSourceThumbnailMaxPixelSize: @(maxDimensionInPixels)
       };
    CGImageRef downsampledImage =
    CGImageSourceCreateThumbnailAtIndex(imageSource, 0, (__bridge CFDictionaryRef)downsampleOptions);
    UIImage *image = [[UIImage alloc] initWithCGImage:downsampledImage];
    CGImageRelease(downsampledImage);
    CFRelease(imageSource);

    return image;
}

//1.自动缩放到指定大小
- (UIImage *)thumbnailToFileSize:(CGSize)asize{
    UIImage *image = (UIImage *)self;
    UIImage *newimage = nil;
    if (image != nil) {
        UIGraphicsBeginImageContext(asize);
        [image drawInRect:CGRectMake(0, 0, asize.width, asize.height)];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}

//2.保持原来的长宽比，生成一个缩略图
- (UIImage *)thumbnailWithoutScaleToFileSize:(CGSize)asize{
    UIImage *image = (UIImage *)self;
    UIImage *newimage = nil;
    
    if (image != nil) {
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            rect.size.width = asize.height * oldsize.width/oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width)/2;
            rect.origin.y = 0;
            
        }
        else{
            rect.size.width = asize.width;
            rect.size.height = asize.width * oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height)/2;
            
        }
        
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, UIColor.clearColor.CGColor);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}

#pragma mark 调整图片分辨率/尺寸（等比例缩放）
- (UIImage *)newSizeImage:(CGSize)size{
    UIImage *source_image = (UIImage *)self;
    
    CGSize newSize = CGSizeMake(source_image.size.width, source_image.size.height);
    
    CGFloat tempHeight = newSize.height / size.height;
    CGFloat tempWidth = newSize.width / size.width;
    
    if (tempWidth > 1.0 && tempWidth > tempHeight) {
        newSize = CGSizeMake(source_image.size.width / tempWidth, source_image.size.height / tempWidth);
    }
    else if (tempHeight > 1.0 && tempWidth < tempHeight){
        newSize = CGSizeMake(source_image.size.width / tempHeight, source_image.size.height / tempHeight);
    }
    
    UIGraphicsBeginImageContext(newSize);
    [source_image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark 二分法
- (NSData *)halfFuntion:(NSArray *)arr
                  image:(UIImage *)image
             sourceData:(NSData *)finallImageData
                maxSize:(NSInteger)maxSize {
    NSData *tempData = [NSData data];
    NSUInteger start = 0;
    NSUInteger end = arr.count - 1;
    NSUInteger index = 0;
    
    NSUInteger difference = NSIntegerMax;
    while(start <= end) {
        index = start + (end - start)/2;
        
        finallImageData = UIImageJPEGRepresentation(image,[arr[index] floatValue]);
        
        NSUInteger sizeOrigin = finallImageData.length;
        NSUInteger sizeOriginKB = sizeOrigin / 1024;
//        DDLog(@"当前降到的质量：%ld", (unsigned long)sizeOriginKB);
//        DDLog(@"%lu----%lf", (unsigned long)index, [arr[index] floatValue]);
        
        if (sizeOriginKB > maxSize) {
            start = index + 1;
        } else if (sizeOriginKB < maxSize) {
            if (maxSize-sizeOriginKB < difference) {
                difference = maxSize-sizeOriginKB;
                tempData = finallImageData;
            }
            end = index - 1;
        } else {
            break;
        }
    }
    return tempData;
}

- (NSData *)compressToFileSize:(NSInteger)fileSize{
    UIImage *image = (UIImage *)self;
    CGFloat compression = 1.0f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while (imageData.length > fileSize && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
        DDLog(@"压缩后图片大小:%@M__压缩系数:%@", @(imageData.length/1024), @(compression));

    }
    DDLog(@"压缩后图片大小:%@M__压缩系数:%@", @(imageData.length/1024), @(compression));
    return imageData;
}

- (UIImage *)compressImageToByte:(NSUInteger)maxLength {
    UIImage *image = (UIImage *)self;

    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength) return image;
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (NSInteger i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        }
        else if (data.length > maxLength) {
            max = compression;
        }
        else {
            break;
        }
    }
    UIImage *resultImage = [UIImage imageWithData:data];
    if (data.length < maxLength) return resultImage;
    
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    
    return resultImage;
}

@end
