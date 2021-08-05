//
//  UINavigationController+Hook.m
//  NNCategoryPro
//
//  Created by Bin Shang on 2019/12/27.
//

#import "UINavigationController+Hook.h"
#import "NSObject+Hook.h"
#import "UIViewController+Helper.h"
#import <NNCategoryPro/NNCategoryPro.h>

@implementation UINavigationController (Hook)
 
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hookInstanceMethod(self.class, @selector(pushViewController:animated:), @selector(hook_PushViewController:animated:));
    });
}

- (void)hook_PushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([self.viewControllers containsObject:viewController]) return;
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIView *customView = [viewController createBackItem:UIImage.icon_arowLeft_black];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:customView];
    }
    [self hook_PushViewController:viewController animated:animated];
}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
//    if ([gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
//        return  self.navigationController.viewControllers.count > 1;
//    }
//    return YES;
//}

@end
