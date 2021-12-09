
//
//  UIApplication+Helper.m
//  
//
//  Created by BIN on 2017/12/28.
//  Copyright © 2017年 SHANG. All rights reserved.
//

#import "UIApplication+Helper.h"
#import <objc/runtime.h>
#import <sys/utsname.h>

#import "UIImage+Helper.h"
#import "UIAlertController+Helper.h"
#import "UINavigationBar+Helper.h"
#import "UITabBarController+Helper.h"


NSString * const kJPush_type = @"into_page_type";
NSString * const kJPush_extras = @"extras";

@implementation UIApplication (Helper)

+ (UIWindow *)mainWindow{
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    if (!window) {
        window = [[UIWindow alloc]initWithFrame:UIScreen.mainScreen.bounds];
        window.backgroundColor = UIColor.whiteColor;
        [window makeKeyAndVisible];
        UIApplication.sharedApplication.delegate.window = window;
    }
    return window;
}

+ (void)setMainWindow:(UIWindow *)mainWindow{
    if (!mainWindow) return;
    [mainWindow makeKeyAndVisible];
    UIApplication.sharedApplication.delegate.window = mainWindow;
}

+ (UIViewController *)rootController{
    UIViewController *rootVC = UIApplication.mainWindow.rootViewController;
    return rootVC;
}

+(void)setRootController:(UIViewController *)rootVC{
    if (!rootVC) return;
    UIApplication.mainWindow.rootViewController = rootVC;
}

+ (nullable UITabBarController *)tabBarController{
    if ([UIApplication.rootController isKindOfClass:[UITabBarController class]]) {
        return (UITabBarController *)UIApplication.rootController;
    }
    return nil;
}

+ (nullable UINavigationController *)navController{
    if ([UIApplication.rootController isKindOfClass:UINavigationController.class]) {
        return (UINavigationController *)UIApplication.rootController;
    }
    
    if ([UIApplication.rootController isKindOfClass:[UITabBarController class]]) {
        UIViewController *selectedViewController = [(UITabBarController *)UIApplication.rootController selectedViewController];
        if ([selectedViewController isKindOfClass:UINavigationController.class]) {
            return (UINavigationController *)selectedViewController;
        }
        return nil;
    }
    return nil;
}

//- (UIWindow *)currentKeyWindow{
//    if (@available(iOS 13.0, *)) {
//        NSArray *list = [UIApplication.sharedApplication.windows filter:^BOOL(__kindof UIWindow * _Nonnull obj, NSUInteger idx) {
//            obj.isKeyWindow == true;
//        }];
//        return list[0];
//    }
//    return UIApplication.sharedApplication.keyWindow;
//}


static NSDictionary *_infoDic = nil;
+ (NSDictionary *)infoDic{
    if(!_infoDic){
        _infoDic = NSBundle.mainBundle.infoDictionary;
    }
    return _infoDic;
}

+(NSString *)appName{
    return self.infoDic[@"CFBundleDisplayName"] ? : self.infoDic[@"CFBundleName"];
}

+(NSString *)appBundleName{
    return self.infoDic[@"CFBundleExecutable"];
}

+(UIImage *)appIcon{
    NSString *icon = [[self.infoDic valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    UIImage *image = [UIImage imageNamed:icon];
    return image;
}

+(NSString *)appVer{
    return self.infoDic[@"CFBundleShortVersionString"];
}

+(NSString *)appBuild{
    return self.infoDic[@"CFBundleVersion"];
}

+(NSString *)phoneSystemVer{
    return UIDevice.currentDevice.systemVersion ? : @"";
}

+(NSString *)phoneSystemName{
    return UIDevice.currentDevice.systemName ? : @"";
}

+(NSString *)phoneName{
    return UIDevice.currentDevice.name ? : @"";
}

+(NSString *)phoneModel{
    return UIDevice.currentDevice.model ? : @"";
}

+(NSString *)phoneLocalizedModel{
    return UIDevice.currentDevice.localizedModel ?  : @"";
}

+ (NSString *)phoneType{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *identifier = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return [UIApplication phoneTypeDic][identifier];
}

static NSDictionary *_phoneTypeDic = nil;
+ (NSDictionary *)phoneTypeDic{
    if (!_phoneTypeDic) {
        _phoneTypeDic = @{
                        @"iPhone3,1": @"iPhone 4",
                        @"iPhone3,2": @"iPhone 4",
                        @"iPhone3,3": @"iPhone 4",
                        @"iPhone4,1": @"iPhone 4S",
                        @"iPhone5,1": @"iPhone 5",
                        @"iPhone5,2": @"iPhone 5 (GSM+CDMA)",
                        @"iPhone5,3": @"iPhone 5c (GSM)",
                        @"iPhone5,4": @"iPhone 5c (GSM+CDMA)",
                        @"iPhone6,1": @"iPhone 5s (GSM)",
                        @"iPhone6,2": @"iPhone 5s (GSM+CDMA)",
                        @"iPhone7,1": @"iPhone 6 Plus",
                        @"iPhone7,2": @"iPhone 6",
                        @"iPhone8,1": @"iPhone 6s",
                        @"iPhone8,2": @"iPhone 6s Plus",
                        @"iPhone8,4": @"iPhone SE",
                        // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
                        @"iPhone9,1": @"国行、日版、港行iPhone 7",
                        @"iPhone9,2": @"港行、国行iPhone 7 Plus",
                        @"iPhone9,3": @"美版、台版iPhone 7",
                        @"iPhone9,4": @"美版、台版iPhone 7 Plus",
                        @"iPhone10,1": @"iPhone_8",
                        @"iPhone10,4": @"iPhone_8",
                        @"iPhone10,2": @"iPhone_8_Plus",
                        @"iPhone10,5": @"iPhone_8_Plus",
                        @"iPhone10,3": @"iPhone_X",
                        @"iPhone10,6": @"iPhone_X",
                        @"iPod1,1": @"iPod Touch 1G",
                        @"iPod2,1": @"iPod Touch 2G",
                        @"iPod3,1": @"iPod Touch 3G",
                        @"iPod4,1": @"iPod Touch 4G",
                        @"iPod5,1": @"iPod Touch (5 Gen)",
                        @"iPad1,1": @"iPad",
                        @"iPad1,2": @"iPad 3G",
                        @"iPad2,1": @"iPad 2 (WiFi)",
                        @"iPad2,2": @"iPad 2",
                        @"iPad2,3": @"iPad 2 (CDMA)",
                        @"iPad2,4": @"iPad 2",
                        @"iPad2,5": @"iPad Mini (WiFi)",
                        @"iPad2,6": @"iPad Mini",
                        @"iPad2,7": @"iPad Mini (GSM+CDMA)",
                        @"iPad3,1": @"iPad 3 (WiFi)",
                        @"iPad3,2": @"iPad 3 (GSM+CDMA)",
                        @"iPad3,3": @"iPad 3",
                        @"iPad3,4": @"iPad 4 (WiFi)",
                        @"iPad3,5": @"iPad 4",
                        @"iPad3,6": @"iPad 4 (GSM+CDMA)",
                        @"iPad4,1": @"iPad Air (WiFi)",
                        @"iPad4,2": @"iPad Air (Cellular)",
                        @"iPad4,4": @"iPad Mini 2 (WiFi)",
                        @"iPad4,5": @"iPad Mini 2 (Cellular)",
                        @"iPad4,6": @"iPad Mini 2",
                        @"iPad4,7": @"iPad Mini 3",
                        @"iPad4,8": @"iPad Mini 3",
                        @"iPad4,9": @"iPad Mini 3",
                        @"iPad5,1": @"iPad Mini 4 (WiFi)",
                        @"iPad5,2": @"iPad Mini 4 (LTE)",
                        @"iPad5,3": @"iPad Air 2",
                        @"iPad5,4": @"iPad Air 2",
                        @"iPad6,3": @"iPad Pro 9.7",
                        @"iPad6,4": @"iPad Pro 9.7",
                        @"iPad6,7": @"iPad Pro 12.9",
                        @"iPad6,8": @"iPad Pro 12.9",
                        
                        @"AppleTV2,1": @"Apple TV 2",
                        @"AppleTV3,1": @"Apple TV 3",
                        @"AppleTV3,2": @"Apple TV 3",
                        @"AppleTV5,3": @"Apple TV 4",
                        
                        @"i386": @"Simulator",
                        @"x86_64": @"Simulator",
                        };
    }
    return _phoneTypeDic;
}


+ (void)setupAppearance:(UIColor *)tintColor barTintColor:(UIColor *)barTintColor{
    
    UINavigationBar.appearance.tintColor = tintColor;
    UINavigationBar.appearance.barTintColor = barTintColor;
//    [UINavigationBar.appearance setBackgroundImage:UIImageColor(barTintColor) forBarMetrics:UIBarMetricsDefault];
//    [UINavigationBar.appearance setShadowImage:UIImageColor(barTintColor)];
    UINavigationBar.appearance.titleTextAttributes = @{NSForegroundColorAttributeName: tintColor,};
    if (@available(iOS 11.0, *)) {
        [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[UIDocumentBrowserViewController.class]].tintColor = nil;
    }
    
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *barAppearance = [UINavigationBarAppearance create:tintColor barTintColor:barTintColor shadowColor:nil font:[UIFont systemFontOfSize:15]];
        UINavigationBar.appearance.standardAppearance = barAppearance;
        UINavigationBar.appearance.scrollEdgeAppearance = barAppearance;

        UITabBarAppearance *tabBarAppearance = [UITabBarAppearance create:barTintColor barTintColor:tintColor font:nil];
        UITabBar.appearance.standardAppearance = tabBarAppearance;
    }
    
    NSDictionary *attDic = @{NSForegroundColorAttributeName: UIColor.blackColor,};
    UIBarButtonItem *speacilItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[UIImagePickerController.class, UIDocumentPickerViewController.class]];
    [speacilItem setTitleTextAttributes:attDic forState:UIControlStateNormal];


//    [UIBarButtonItem.appearance setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColor.whiteColor,} forState: UIControlStateNormal];
//    [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses: @[UISearchBar.class]];
    
    
    UIButton *speacilButton = [UIButton appearanceWhenContainedInInstancesOfClasses:@[UINavigationBar.class, ]];
    [speacilButton setTitleColor:tintColor forState:UIControlStateNormal];
    speacilButton.titleLabel.adjustsFontSizeToFitWidth = true;
    speacilButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    speacilButton.exclusiveTouch = true;
    speacilButton.adjustsImageWhenHighlighted = false;
    
    
    [UIButton.appearance setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    UIButton.appearance.titleLabel.adjustsFontSizeToFitWidth = true;
    UIButton.appearance.imageView.contentMode = UIViewContentModeScaleAspectFit;
    UIButton.appearance.exclusiveTouch = true;
    UIButton.appearance.adjustsImageWhenHighlighted = false;
    
    
    if ([NSClassFromString(@"UICalloutBarButton") isKindOfClass:UIButton.class]) {
        [[NSClassFromString(@"UICalloutBarButton") appearance] setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    }
    
    UISegmentedControl *speacilSegmentedControl = [UISegmentedControl appearanceWhenContainedInInstancesOfClasses:@[UINavigationBar.class, ]];
    speacilSegmentedControl.tintColor = tintColor;
    [speacilSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName: tintColor} forState:UIControlStateNormal];
    [speacilSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName: barTintColor} forState:UIControlStateSelected];

    UISegmentedControl.appearance.tintColor = tintColor;

    
    UIScrollView.appearance.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    UIScrollView.appearance.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    UIScrollView.appearance.showsHorizontalScrollIndicator = false;
    UIScrollView.appearance.exclusiveTouch = true;
    if (@available(iOS 11.0, *)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    
    UITableView.appearance.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    UITableView.appearance.separatorInset = UIEdgeInsetsZero;
    UITableView.appearance.rowHeight = 60;
    UITableView.appearance.backgroundColor = UIColor.groupTableViewBackgroundColor;
    if (@available(iOS 11.0, *)) {
        UITableView.appearance.estimatedRowHeight = 0.0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0.0;
        UITableView.appearance.estimatedSectionFooterHeight = 0.0;
    }
    
    
    UITableViewCell.appearance.layoutMargins = UIEdgeInsetsZero;
    UITableViewCell.appearance.separatorInset = UIEdgeInsetsZero;
    UITableViewCell.appearance.selectionStyle = UITableViewCellSelectionStyleNone;
    UITableViewCell.appearance.backgroundColor = UIColor.whiteColor;

    
    UICollectionView.appearance.scrollsToTop = false;
    UICollectionView.appearance.pagingEnabled = false;

    
    UICollectionViewCell.appearance.layoutMargins = UIEdgeInsetsZero;
    UICollectionViewCell.appearance.backgroundColor = UIColor.whiteColor;
    
    
    UIImageView.appearance.userInteractionEnabled = true;
    
    UILabel.appearance.userInteractionEnabled = true;

    
    UIPageControl.appearance.pageIndicatorTintColor = barTintColor;
    UIPageControl.appearance.currentPageIndicatorTintColor = tintColor;
    UIPageControl.appearance.userInteractionEnabled = true;
    UIPageControl.appearance.hidesForSinglePage = true;
    
    
    UIProgressView.appearance.progressTintColor = barTintColor;
    UIProgressView.appearance.trackTintColor = UIColor.clearColor;
    
    
    UIDatePicker.appearance.datePickerMode = UIDatePickerModeDate;
    UIDatePicker.appearance.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    UIDatePicker.appearance.backgroundColor = UIColor.whiteColor;
    if (@available(iOS 13.4, *)) {
        UIDatePicker.appearance.preferredDatePickerStyle = UIDatePickerStyleWheels;
    }
    
    
    UISlider.appearance.minimumTrackTintColor = tintColor;
    UISlider.appearance.autoresizingMask = UIViewAutoresizingFlexibleWidth;


    UISwitch.appearance.onTintColor = tintColor;
    UISwitch.appearance.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

/**
 打开网络链接(prefix为 http://或 tel:// )
 */
+ (void)openURLString:(NSString *)string prefix:(NSString *)prefix completion:(void (^ __nullable)(BOOL success))completion{
    if (![string hasPrefix:prefix]) {
        string = [prefix stringByAppendingString:string];
    }
    
    NSURL *URL = [NSURL URLWithString:string];
    UIApplication *app = UIApplication.sharedApplication;
    if (![app canOpenURL:URL]) {
        completion(false);
        return ;
    }
    [UIApplication openURL:URL completion:completion];
}

+ (void)openURL:(NSURL *)url completion:(void (^ __nullable)(BOOL success))completion{
    [UIApplication.sharedApplication openURL:url
                                     options:@{UIApplicationOpenURLOptionUniversalLinksOnly: @YES}
                           completionHandler:completion];
}

/**
 远程推送deviceToken处理
 */
+ (NSString *)deviceTokenStringWithDeviceToken:(NSData *)deviceToken {
    NSString *deviceString = @"";
    if (@available(iOS 13.0, *)) {
        NSMutableString *deviceTokenString = [NSMutableString string];
        const char *bytes = deviceToken.bytes;
        NSInteger count = deviceToken.length;
        for (int i = 0; i < count; i++) {
            [deviceTokenString appendFormat:@"%02x", bytes[i]&0x000000FF];
        }
        deviceString = [NSString stringWithString:deviceTokenString];
        
    } else {
        deviceString = [deviceToken.description stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<> "]];
    }
#if DEBUG
    NSLog(@"%@", deviceString);
#endif
    return deviceString;
}

/**
 block内任务后台执行(block为空可填入AppDelegate.m方法 applicationDidEnterBackground中)
 */
+ (void)didEnterBackgroundBlock:(void (^_Nullable)(void))block{
    UIApplication *application = UIApplication.sharedApplication;
    __block UIBackgroundTaskIdentifier bgTask;
    bgTask = [application beginBackgroundTaskWithExpirationHandler:^{
        // End the task if time expires.
        if (bgTask != UIBackgroundTaskInvalid) {
            [application endBackgroundTask:bgTask];
            bgTask = UIBackgroundTaskInvalid;
        }
    }];
    
    if(block != nil) {
        block();
        // End the task assertion.
        [application endBackgroundTask:bgTask];
    }
    bgTask = UIBackgroundTaskInvalid;
}

/**
 配置app图标(传 @"AppIcon"/@"默认"/@"", 换为默认值)
 */
+ (void)setAppIconWithName:(NSString *)iconName {
    if (@available(iOS 10.3, *)) {
        if (!UIApplication.sharedApplication.supportsAlternateIcons) {
            return;
        }
        
        iconName = [@[@"AppIcon", @"默认", @"",] containsObject: iconName] ? nil : iconName;
        [UIApplication.sharedApplication setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"更换app图标发生错误了 ： %@",error);
            }
        }];
    }
}


@end
