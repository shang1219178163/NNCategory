//
//  UIButton+Helper.h
//  
//
//  Created by BIN on 2017/12/27.
//  Copyright © 2017年 SHANG. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "NSObject+Helper.h"//优点全部子类使用;使用性能较差需要一级级去查找
NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Helper)

- (void)setBackgroundColor:(nullable UIColor *)color forState:(UIControlState)state;

/*
 UIButton 创建
 @param type 0:白色背景黑色字体灰色边框,
         type 1://主题背景白色字体无圆角,
         type 2://白色背景灰色字体无边框,
         type 3://地图定位按钮一类,
         type 4://白色背景主题色字体和边框,
         type 5://白色背景主题字体无边框,
         type 6://红色背景白色字体,
         type 7://灰色背景黑色字体无边框,
         type 8://白色背景红色字体无边框,
 */

+ (instancetype)createRect:(CGRect)rect title:(NSString *)title image:(NSString *_Nullable)image type:(NSNumber *)type;
    
- (NSMutableAttributedString *)setContent:(NSString *)content attDic:(NSDictionary *)attDic forState:(UIControlState)state;

/**
 导航栏按钮
 */
+(UIButton *)buttonWithSize:(CGSize)size
                 image_N:(id)image_N
                 image_H:(id)image_H
         imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets;

/**
 导航栏按钮
 */
+(UIButton *)buttonWithSize:(CGSize)size
                   title:(NSString *)title
                    font:(NSUInteger)font
            titleColor_N:(UIColor *)titleColor_N
            titleColor_H:(UIColor *)titleColor_H
         titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets;


/**
 验证码倒计时默认60s
 */
- (void)startCountdown60s;

- (void)startCountdown:(NSTimeInterval)count;

- (void)startTime:(NSInteger)timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;

- (void)startDisplayLink;

- (CGSize)btnSizeByHeight:(CGFloat)height;

- (void)showImageType:(NSNumber *)type image:(id)image;

/// 上 左 下 右
- (void)layoutStyle:(NSInteger )style space:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
