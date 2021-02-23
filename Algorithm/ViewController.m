//
//  ViewController.m
//  Algorithm
//
//  Created by ma qi on 2021/2/2.
//

#import "ViewController.h"
#import "FibonacciVC.h"
#import "CoinChangeVC.h"
#import "FullPenetrationVC.h"
#import "N_QueenVC.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArr;

@end

static NSString *const cellId = @"cellId";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"算法学习";
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(HEIGHT_TOP);
        make.left.right.bottom.equalTo(0);
    }];
}

#pragma mark -
#pragma mark - delegate ---> tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    NSDictionary *dic = self.titleArr[indexPath.row];
    cell.textLabel.text = dic[@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = self.titleArr[indexPath.row];
    Class class = dic[@"class"];
    BaseViewController *vc = [class alloc];
    vc.aTitle = dic[@"title"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -
#pragma mark - getter ---> data

- (NSArray *)titleArr {
    return @[@{@"title":@"斐波那契数列",
               @"class":FibonacciVC.class},
             @{@"title":@"凑零钱",
               @"class":CoinChangeVC.class},
             @{@"title":@"全排列",
               @"class":FullPenetrationVC.class},
             @{@"title":@"N皇后",
               @"class":N_QueenVC.class}];
}

#pragma mark -
#pragma mark - setter ---> view

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, HEIGHT_SAFE_BOTTOM, 0);
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    }
    return _tableView;
}


@end
