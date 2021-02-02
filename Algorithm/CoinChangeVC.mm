//
//  CoinChangeVC.m
//  Algorithm
//
//  Created by ma qi on 2021/2/2.
//

/*
 *  给你 k 种⾯值的硬币，⾯值分别为 c1, c2 ... ck ，每种硬 币的数量⽆限，再给⼀个总⾦额 amount ，问你最少需要⼏枚硬币凑出这个 ⾦额，如果不可能凑出，算法返回 -1 。
 */

#import "CoinChangeVC.h"
#include <vector>
using namespace std;

@interface CoinChangeVC ()

@end

@implementation CoinChangeVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)btnClick:(UIButton *)sender {
    [self normal];
}

- (void)normal {
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    vector<int> coins = {1, 2, 5};
    int a = coinChange(coins, 33);
    NSTimeInterval curInterval = [[NSDate date] timeIntervalSince1970];
    NSLog(@"%d, %f", a, curInterval - interval);
}

int coinChange(vector<int>& coins, int amount) {
    vector<int> dp(amount + 1, amount + 1);
    dp[0] = 0;
    for (int i = 0; i < dp.size(); i++) {
        for (int coin : coins) {
            NSLog(@"i= %d, %d", i, dp[i]);
            if (i - coin < 0) continue;
            dp[i] = min(dp[i], 1 + dp[i - coin]);
        }
    }
    return (dp[amount] == amount + 1) ? -1 : dp[amount];
}



@end
