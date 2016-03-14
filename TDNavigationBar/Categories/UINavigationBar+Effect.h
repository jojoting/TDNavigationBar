//
//  UINavigationBar+Effect.h
//  YouPinKu
//
//  Created by jojoting on 15/12/23.
//  Copyright © 2015年 李昭宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Effect)

- (void)td_setBackgroundColor:(UIColor *)backgroundColor;
- (void)td_reset;
- (UIView *)effectView;
- (void)setEffectView:(UIView *)effectView;
- (void)td_setEffectFrame:(CGRect )frame;
- (void)td_creatEffectViewWithView:(UIView *)view;
@end
