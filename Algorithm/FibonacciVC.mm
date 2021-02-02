//
//  FibonacciVC.m
//  Algorithm
//
//  Created by ma qi on 2021/2/2.
//

#import "FibonacciVC.h"
#include <vector>
using namespace std;

@interface FibonacciVC ()

@end

@implementation FibonacciVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)btnClick:(UIButton *)sender {
    [self normal];
    [self normalM];
    [self normalDP];
    [self normalCur];
}

- (void)normal {
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    int a = fib(20);
    NSTimeInterval curInterval = [[NSDate date] timeIntervalSince1970];
    NSLog(@"%d, %f", a, curInterval - interval);
}

- (void)normalM {
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    int a = fibm(20);
    NSTimeInterval curInterval = [[NSDate date] timeIntervalSince1970];
    NSLog(@"%d, %f", a, curInterval - interval);
}

- (void)normalDP {
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    int a = fibDP(20);
    NSTimeInterval curInterval = [[NSDate date] timeIntervalSince1970];
    NSLog(@"%d, %f", a, curInterval - interval);
}

- (void)normalCur {
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    int a = fibCur(20);
    NSTimeInterval curInterval = [[NSDate date] timeIntervalSince1970];
    NSLog(@"%d, %f", a, curInterval - interval);
}

#pragma mark -
#pragma mark - 暴力递归

int fib(int N) {
    if (N == 1 || N == 2) return 1;
    return fib(N - 1) + fib(N - 2);
}

#pragma mark -
#pragma mark - 添加备忘录

int helper(vector<int>& memo, int n) {
    if (n == 1 || n == 2) return 1;
    //已经计算过
    if (memo[n] != 0) return memo[n];
    memo[n] = helper(memo, n - 1) + helper(memo, n - 2);
    return memo[n];
}

int fibm(int N) {
    if (N < 1) return N;
    vector<int> memo(N + 1, 0);
    return helper(memo, N);
}

#pragma mark -
#pragma mark - DP table

int fibDP(int N) {
    vector<int> dp(N + 1, 0);
    dp[1] = dp[2] = 1;
    for (int i = 3; i <= N; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[N];
}

#pragma mark -
#pragma mark - 记录最近 空间复杂度O(1)

int fibCur(int N) {
    if (N == 1 || N == 2) return 1;
    int prev = 1, curr = 1;
    for (int i = 3; i <= N; i++) {
        int sum = prev + curr;
        prev = curr;
        curr = sum;
    }
    return curr;
}


@end
