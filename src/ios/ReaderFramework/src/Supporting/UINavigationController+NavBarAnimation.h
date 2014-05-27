//
//  UINavigationController+NavBarAnimation.h
//  Reader
//
//  Created by Kiran Panesar on 21/05/2014.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ReaderNavigationBarAnimation) {
    ReaderNavigationBarAnimationFade
};

@interface UINavigationController (NavBarAnimation)

-(void)setNavigationBarHidden:(BOOL)hidden animation:(ReaderNavigationBarAnimation)animation;

@end
