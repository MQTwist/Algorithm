//
//  DeviceTool.m
//  Algorithm
//
//  Created by ma qi on 2021/2/2.
//

#import "DeviceTool.h"
#import "SceneDelegate.h"

@implementation DeviceTool

+ (UIWindow *)getKWindow {
    if (@available(iOS 13.0, *)) {
        NSArray *arr = UIApplication.sharedApplication.connectedScenes.allObjects;
        UIWindowScene *windowScene = (UIWindowScene *)arr[0];
        SceneDelegate *delegate = (SceneDelegate *)windowScene.delegate;
        return delegate.window;
    } else {
        return UIApplication.sharedApplication.delegate.window;
    }
}

+ (CGFloat)safeBottom {
    UIWindow *window = [self getKWindow];
    if (@available(iOS 11.0, *)) {
        return window.safeAreaInsets.bottom;
    } else {
        return 0;
    }
}

+ (CGFloat)statusBarHeight {
    if (@available(iOS 13.0, *)) {
        UIStatusBarManager *manager = UIApplication.sharedApplication.windows.firstObject.windowScene.statusBarManager;
        return manager.statusBarFrame.size.height;
    } else {
        return UIApplication.sharedApplication.statusBarFrame.size.height;
    }
}

@end
