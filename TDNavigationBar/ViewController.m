//
//  ViewController.m
//  TDNavigationBar
//
//  Created by jojoting on 16/3/13.
//  Copyright © 2016年 jojoting. All rights reserved.
//

#import "ViewController.h"

static const NSInteger tableViewCellRows = 20;
static NSString *tableViewCellID = @"tableViewCell";

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) UINavigationBar   *navigationBar;

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
    [self initNavigationBar];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - init

- (void)initTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//    tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    tableView.delegate = self;
    tableView.dataSource = self;
    
    self.tableView = tableView;
    [self.view addSubview:tableView];
}

- (void)initNavigationBar{
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationController.navigationBarHidden = NO;
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


#pragma mark - private methods

- (UITableViewCell *)configCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath{
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld",indexPath.row];
    return cell;
}

@end
