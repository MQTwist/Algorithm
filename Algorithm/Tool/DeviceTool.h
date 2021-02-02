//
//  DeviceTool.h
//  Algorithm
//
//  Created by ma qi on 2021/2/2.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeviceTool : NSObject

+ (UIWindow *)getKWindow;
+ (CGFloat)safeBottom;
+ (CGFloat)statusBarHeight;

@end

NS_ASSUME_NONNULL_END
