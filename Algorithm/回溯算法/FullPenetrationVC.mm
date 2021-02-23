//
//  FullPenetrationVC.m
//  Algorithm
//
//  Created by ma qi on 2021/2/22.
//

/*
 *  for 选择 in 选择列表:
    # 做选择
        将该选择从选择列表移除
        路径.add(选择)
        backtrack(路径, 选择列表)
    # 撤销选择
        路径.remove(选择)
        将该选择再加⼊选择列表
 */

#import "FullPenetrationVC.h"
#include <iostream>
using namespace std;

@interface FullPenetrationVC ()

@end

@implementation FullPenetrationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)btnClick:(UIButton *)sender {
    int list[] = {1, 2, 3};
    int count = sizeof(list) / sizeof(int) - 1;
    perm(list, 0, count);
}



void swap(int &a,int &b){
    int temp=a;
    a=b;
    b=temp;
}

void perm(int list[], int low, int high) {
    if(low == high) {   //当low==high时,此时list就是其中一个排列,输出list
        for(int i = 0; i <= low; i++) {
            cout<<list[i];
        }
        cout<<endl;
    }else {
        for(int i = low; i <= high; i++) {
            swap(list[i], list[low]);//每个元素与第一个元素交换
            perm(list, low+1, high); //交换后,得到子序列,用函数perm得到子序列的全排列
            swap(list[i], list[low]);//最后,将元素交换回来,复原,然后交换另一个元素
        }
    }
}



@end
