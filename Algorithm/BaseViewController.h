//
//  BaseViewController.h
//  Algorithm
//
//  Created by ma qi on 2021/2/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property (nonatomic, copy) NSString *aTitle;

- (void)btnClick:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
