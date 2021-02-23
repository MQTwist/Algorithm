//
//  N_QueenVC.m
//  Algorithm
//
//  Created by ma qi on 2021/2/23.
//


/*
 *  这个问题很经典了，简单解释⼀下：
 给你⼀个 N×N 的棋盘，让你放置 N 个 皇后，使得它们不能互相攻击。
 PS：皇后可以攻击同⼀⾏、同⼀列、左上、左下、右上、右下、四个⽅向的任意单位。
 这个问题本质上跟全排列问题差不多，决策树的每⼀层表⽰棋盘上的每⼀ ⾏；
 每个节点可以做出的选择是，在该⾏的任意⼀列放置⼀个皇后。
 */

#import "N_QueenVC.h"
#include <vector>
#include <string>
#include <iostream>
using namespace std;

@interface N_QueenVC ()

@end

@implementation N_QueenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)btnClick:(UIButton *)sender {
    vector<vector<string>> res = solveNQueens(8);
    if (res.size() == 0) {
        NSLog(@">>>不存在");
    }
    for (int i = 0; i < res.size(); i++) {
        vector<string> temp = res.at(i);
        cout << i + 1 << endl;
        for (int j = 0; j < temp.size(); j++) {
            cout << temp.at(j);
            cout << endl;
        }
        cout << endl;
    }
}

vector<vector<string>> res;
/* 输⼊棋盘边⻓ n，返回所有合法的放置 */
vector<vector<string>> solveNQueens(int n) {
    // '.' 表⽰空，'Q' 表⽰皇后，初始化空棋盘。
    vector<string> board(n, string(n, '.'));
    backtrack(board, 0);
    return res;
}
// 路径：board 中⼩于 row 的那些⾏都已经成功放置了皇后
// 选择列表：第 row ⾏的所有列都是放置皇后的选择
// 结束条件：row 超过 board 的最后⼀⾏
void backtrack(vector<string>& board, int row) {
    // 触发结束条件
    if (row == board.size()) {
        res.push_back(board);
        return;
    }
    int n = (int)board[row].size();
    for (int col = 0; col < n; col++) {
        // 排除不合法选择
        if (!isValid(board, row, col)) continue;
        // 做选择
        board[row][col] = 'Q';
        // 进⼊下⼀⾏决策
        backtrack(board, row + 1);
        // 撤销选择
        board[row][col] = '.';
    }
    
}
/* 是否可以在 board[row][col] 放置皇后？ */
bool isValid(vector<string>& board, int row, int col) {
    int n = (int)board.size();
    // 检查列是否有皇后互相冲突
    for (int i = 0; i < n; i++) {
        if (board[i][col] == 'Q')
            return false;
    }
    // 检查右上⽅是否有皇后互相冲突
    for (int i = row - 1, j = col + 1; i >= 0 && j < n; i--, j++) {
        if (board[i][j] == 'Q')
            return false;
    }
    // 检查左上⽅是否有皇后互相冲突
    for (int i = row - 1, j = col - 1; i >= 0 && j >= 0; i--, j--) {
        if (board[i][j] == 'Q')
            return false;
    }
    return true;
}


@end
