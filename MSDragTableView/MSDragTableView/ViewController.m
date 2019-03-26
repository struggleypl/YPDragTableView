//
//  ViewController.m
//  MSDragTableView
//
//  Created by ypl on 2018/10/9.
//  Copyright © 2018年 ypl. All rights reserved.
//

#import "ViewController.h"
#import "MSDragTableView.h"
#import "DragCell.h"
#import "DragModel.h"
#import "MSMenuView.h"

@interface ViewController () <MSDragTableViewDataSource,MSDragTableViewDelegate>
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NSMutableArray *actionArr;
@end

@implementation ViewController

-(NSMutableArray *)actionArr {
    if (!_actionArr) {
        _actionArr = [NSMutableArray new];
    }
    return _actionArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    MSDragTableView *tableView = [[MSDragTableView alloc]init];
    tableView.allowsSelection = YES;
    [self.view addSubview:tableView];
    tableView.frame = self.view.bounds;
    tableView.dataSource = self;
    tableView.delegate = self;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width/2, 40);
    [btn addTarget:self action:@selector(addCustomCellAction:) forControlEvents:UIControlEventTouchUpInside];
    tableView.tableHeaderView = btn;
    
    MSMenuAction *action = [MSMenuAction actionWithTitle:@"图片" image:nil handler:^(MSMenuAction *action) {
        NSLog(@"点击了%@",action.title);
    }];
    MSMenuAction *action1 = [MSMenuAction actionWithTitle:@"文字" image:nil handler:^(MSMenuAction *action) {
        NSLog(@"点击了%@",action.title);
    }];
    MSMenuAction *action2 = [MSMenuAction actionWithTitle:@"文字" image:nil handler:^(MSMenuAction *action) {
        NSLog(@"点击了%@",action.title);
    }];
    MSMenuAction *action3 = [MSMenuAction actionWithTitle:@"文字" image:nil handler:^(MSMenuAction *action) {
        NSLog(@"点击了%@",action.title);
    }];
    [self.actionArr addObject:action];
    [self.actionArr addObject:action1];
    [self.actionArr addObject:action2];
    [self.actionArr addObject:action3];
}

- (void)addCustomCellAction:(UIButton *)sender {
    MSMenuView *view = [MSMenuView menuWithActions:self.actionArr width:70*self.actionArr.count relyonView:sender];
    [view show];
}

- (NSArray *)data{
    if (!_data) {
        NSMutableArray *arr = [NSMutableArray array];
        int numberOfScections = 4;
//        for (int i = 0; i < numberOfScections; i ++) {
//            NSMutableArray *arr2 = [NSMutableArray array];
            for (int j = 0; j < 4 ; j ++) {
                DragModel *model = [[DragModel alloc]init];
                model.title = [NSString stringWithFormat:@"%d - %d",0,j];
                [arr addObject:model];
            }
//            [arr addObject:arr2];
//        }
        _data = arr;
    }
    return _data;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DragCell *cell = (DragCell *)[[NSBundle mainBundle] loadNibNamed:@"DragCell" owner:self options:nil].firstObject;
    DragModel *model = _data[indexPath.row];
    cell.dragModel = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSArray *)originalArrayDataForTableView:(MSDragTableView *)tableView{
    return _data;
}

- (void)tableView:(MSDragTableView *)tableView newArrayDataForDataSource:(NSArray *)newArray{
    _data = newArray;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DragModel *model = _data[indexPath.row];
    NSLog(@"%@",model.title);
}

- (void)cellWillMoveInTableView:(MSDragTableView *)tableView {
    for (DragModel *model in _data) {
        model.isMoving = YES;
    }
    tableView.tableHeaderView.hidden = YES;
    [tableView reloadData];
}

- (void)cellDidEndMovingInTableView:(MSDragTableView *)tableView {
    for (DragModel *model in _data) {
        model.isMoving = NO;
    }
    tableView.tableHeaderView.hidden = NO;
    [tableView reloadData];
}

@end
