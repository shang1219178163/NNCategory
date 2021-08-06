//
//  UIViewController+Helper.h
//  
//
//  Created by BIN on 2017/8/14.
//  Copyright © 2017年 SHANG. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIViewController+AddView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Helper)

/// 字符串->UIViewController
FOUNDATION_EXPORT UIViewController * _Nullable UIControllerFromString(NSString *obj);
/// 字符串->UINavigationController
FOUNDATION_EXPORT UINavigationController * _Nullable UINavCtrFromObj(id obj);

@property (nonatomic, strong, readonly) NSString * _Nullable vcName;
@property (nonatomic, strong, readonly) UIViewController * _Nullable currentVC;


- (BOOL)isCurrentVisibleVC;

- (UIButton *)createBackItem:(UIImage *)image;

- (void)setupContentInsetAdjustmentBehavior:(BOOL)isAutomatic;
///避免多个呈现造成的 app 崩溃
- (void)present:(BOOL)animated completion:(void (^ __nullable)(void))completion;

///判断上一页是哪个页面
- (BOOL)pushFromVC:(Class)cls;

/// [源]创建UISearchController(设置IQKeyboardManager.shared.enable = false;//避免searchbar下移)
- (UISearchController *)createSearchVC:(UIViewController *)resultsVC;

- (UIViewController *)addControllerName:(NSString *)vcName;
/// 添加子控制器(对应方法 removeControllerVC)
- (void)addControllerVC:(UIViewController *)vc;

- (void)removeFromSuperVC;
/// 显示controller(手动调用viewWillAppear和viewDidAppear,viewWillDisappear)
- (void)transitionToVC:(UIViewController *)controller;

- (void)popGestureClose;

- (void)popGestureOpen;

@end


@interface UINavigationController (Helper)

- (__kindof UIViewController * _Nullable)findVC:(Class)classVC;

- (__kindof UIViewController * _Nullable)findVCName:(NSString *)vcName;

@end


NS_ASSUME_NONNULL_END
