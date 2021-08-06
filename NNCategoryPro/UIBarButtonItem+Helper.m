//
//  UIBarButtonItem+Helper.m
//  
//
//  Created by BIN on 2018/11/28.
//

#import "UIBarButtonItem+Helper.h"
#import <objc/runtime.h>
#import "UIColor+Helper.h"
#import "UIButton+Helper.h"

@implementation UIBarButtonItem (Helper)

/**
 [源] 导航栏 UIBarButtonItem
 */
+ (instancetype)createItem:(NSString *)obj style:(UIBarButtonItemStyle)style target:(id _Nullable)target action:(SEL _Nullable)action{
    UIImage *image = [UIImage imageNamed:obj];
    if (image) {
        UIImage *img = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        UIBarButtonItem *barItem = [[self alloc] initWithImage:img
                                                         style:style
                                                        target:target
                                                        action:action];
        return barItem;
    }
    UIBarButtonItem *barItem = [[self alloc] initWithTitle:obj
                                                     style:style
                                                    target:target
                                                    action:action];
    return barItem;
}


+ (instancetype)customViewWithButton:(NSString *)obj handler:(void(^)(UIButton *sender))handler{
    UIButton *sender = [UIButton buttonWithType:UIButtonTypeSystem];
    if ([UIImage imageNamed:obj]) {
        [sender setImage:[UIImage imageNamed:obj] forState:UIControlStateNormal];
    } else {
        [sender setTitle:obj forState:UIControlStateNormal];
    }
    [sender addActionHandler:handler forControlEvents:UIControlEventTouchUpInside];
   
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithCustomView:sender];
    return barItem;
}

- (void)addActionBlock:(void (^)(UIBarButtonItem *item))block{
    if (!block) { return; }
    
    [self willChangeValueForKey:@"block"];
    objc_setAssociatedObject(self, _cmd, block, OBJC_ASSOCIATION_COPY_NONATOMIC);

    self.target = self;
    self.action = @selector(p_invoke:);
    [self didChangeValueForKey:@"block"];
}

- (void)p_invoke:(UIBarButtonItem *)sender {
    void(^block)(UIBarButtonItem *item) = objc_getAssociatedObject(self, @selector(addActionBlock:));
    if (block) {
        block(sender);
    }
}

- (void)setHidden:(BOOL)hidden{
    self.enabled = !hidden;
    self.tintColor = !hidden ? UIColor.themeColor : UIColor.clearColor;
}


@end
