//
//  UINavigationController+NavBarAnimation.m
//  Reader
//
//  Created by Kiran Panesar on 21/05/2014.
//
//

#import "UINavigationController+NavBarAnimation.h"

@implementation UINavigationController (NavBarAnimation)

-(void)setNavigationBarHidden:(BOOL)hidden animation:(ReaderNavigationBarAnimation)animation {
    if (hidden) {
        if (animation == ReaderNavigationBarAnimationFade) {
            
            [UIView animateWithDuration:0.3 animations:^{
                [self.navigationBar setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
                [self setNavigationBarHidden:YES animated:NO];
            }];
        } else {
            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
            [self setNavigationBarHidden:YES];
        }
    } else {
        if (animation == ReaderNavigationBarAnimationFade) {
            
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.005 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self setNavigationBarHidden:NO animated:NO];
                    [self.navigationBar setAlpha:0.0f];

                    [UIView animateWithDuration:0.3 animations:^{
                        [self.navigationBar setAlpha:1.0f];
                    }];
                });
            });
        } else {
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
            [self setNavigationBarHidden:NO];
        }
    }
}

@end
