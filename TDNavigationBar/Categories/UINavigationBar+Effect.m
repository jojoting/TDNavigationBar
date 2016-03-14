//
//  UINavigationBar+Effect.m
//  YouPinKu
//
//  Created by jojoting on 15/12/23.
//  Copyright © 2015年 李昭宏. All rights reserved.
//

#import "UINavigationBar+Effect.h"
#import <objc/runtime.h>

@implementation UINavigationBar (Effect)

static char overlayKey;
static char effectViewKey;


- (UIView *)overlay{
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)effectView{
    return objc_getAssociatedObject(self, &effectViewKey);
}

- (void)setEffectView:(UIView *)effectView{
    objc_setAssociatedObject(self, &effectViewKey, effectView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (void)td_creatEffectViewWithView:(UIView *)view{
    if(!self.effectView){
        self.effectView = view;
        [self addSubview:view];
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    }
   
}

- (void)td_setEffectFrame:(CGRect )frame{
    if (!self.effectView) {
        self.effectView = [[UIView alloc]initWithFrame:frame];
        [self addSubview:self.effectView];

    }
    self.effectView.hidden = NO;
    self.effectView.frame = frame;
//    [self layoutIfNeeded];
}

- (void)td_setBackgroundColor:(UIColor *)backgroundColor{
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        //初始化overlay视图
        CGFloat statusBarH = 20;
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, - statusBarH, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + statusBarH)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
    
        [self insertSubview:self.overlay atIndex:0];
    }
    self.overlay.backgroundColor = backgroundColor;
}

- (void)td_reset{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.overlay removeFromSuperview];
    self.overlay = nil;
    self.effectView.hidden = YES;

}
@end
