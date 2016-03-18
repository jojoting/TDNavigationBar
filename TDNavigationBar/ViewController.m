//
//  ViewController.m
//  TDNavigationBar
//
//  Created by jojoting on 16/3/13.
//  Copyright © 2016年 jojoting. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+Effect.h"

const NSInteger tableViewCellRows = 20;
static NSString *tableViewCellID = @"tableViewCell";
const CGFloat tableviewHeadViewHeight = 230;

@interface ViewController () <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) UITableView       *tableView;

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
    [self initNavigationBar];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - init

- (void)initTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    tableView.delegate = self;
    tableView.dataSource = self;
    
    self.tableView = tableView;
    [self.view addSubview:tableView];
}

- (void)initNavigationBar{

}

#pragma mark - table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableViewCellRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellID];
    }
    return [self configCell:cell withIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return tableviewHeadViewHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [self configHeadView];
}

#pragma mark - scroll view delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    UIColor *color = [UIColor lightGrayColor];
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    CGFloat changePointY = tableviewHeadViewHeight/3;
    
    if (contentOffsetY < 0) {
        self.navigationController.navigationBar.alpha = 0;
        [self.navigationController.navigationBar td_setBackgroundColor:[color colorWithAlphaComponent:0.f]];
    }
    
    if (contentOffsetY >= 0) {
        self.navigationController.navigationBar.alpha = 1;
        CGFloat alpha = MIN(1, contentOffsetY / (tableviewHeadViewHeight - changePointY));
        [self.navigationController.navigationBar td_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    }
}

#pragma mark - private methods

- (UITableViewCell *)configCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath{
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld",indexPath.row];
    return cell;
}

- (UIView *)configHeadView{
    UIImageView *headView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
    return headView;
}

@end
