//
//  MainViewController.m
//  CollectionDemo
//
//  Created by SeaMoonTime on 24/03/2018.
//  Copyright © 2018 SeaMoonTime. All rights reserved.
//

#import "MainViewController.h"
#import "UIViewController+SMT.h"

@interface MainViewController ()

@property(copy, nonatomic)NSArray *demoTitles;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *plistPath = [mainBundle pathForResource:@"DemoTitles" ofType:@"plist"];
    self.demoTitles = [[NSArray alloc]initWithContentsOfFile:plistPath];
    
    //表视图无内容则不显示空行
    self.tableView.tableFooterView = [[UIView alloc]init];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _demoTitles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell" forIndexPath:indexPath];
    NSDictionary *dict = _demoTitles[indexPath.row];
    cell.textLabel.text = dict[@"name"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = _demoTitles[indexPath.row];
//    [self smt_pushViewController:dict[@"className"]];
    [self smt_pushViewController:dict[@"className"] parameters:dict[@"parameters"]];
}




@end
