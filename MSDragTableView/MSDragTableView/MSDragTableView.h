//
//  MSDragTableView.h
//  MSDragTableView
//
//  Created by ypl on 2018/10/9.
//  Copyright © 2018年 ypl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MSDragTableView;
@protocol MSDragTableViewDataSource <UITableViewDataSource>

@required
/**
 原始数组,cell数据发生改变时进行修改重排
 
 @param tableView tableView
 @return NSArray 原始数组
 */
- (NSArray *)originalArrayDataForTableView:(MSDragTableView *)tableView;

@end

@protocol MSDragTableViewDelegate <UITableViewDelegate>

@required
/**
 将修改重排后的数组传入，以便外部更新数据源
 
 @param tableView tableView
 @param newArray newArray
 */
- (void)tableView:(MSDragTableView *)tableView newArrayDataForDataSource:(NSArray *)newArray;
@optional
/**
 选中的cell准备好可以移动的时候
 
 @param tableView tableView
 @param indexPath indexPath 
 */
- (void)tableView:(MSDragTableView *)tableView cellReadyToMoveAtIndexPath:(NSIndexPath *)indexPath;
/**
 选中的cell将要移动，手势尚未松开
 
 @param tableView tableView
 */
- (void)cellWillMoveInTableView:(MSDragTableView *)tableView;

/**
 选中的cell正在移动，变换位置，手势尚未松开
 
 @param tableView tableView
 */
- (void)cellIsMovingInTableView:(MSDragTableView *)tableView;
/**
 选中的cell完成移动，手势已松开
 
 @param tableView tableView
 */
- (void)cellDidEndMovingInTableView:(MSDragTableView *)tableView;

@end

@interface MSDragTableView : UITableView

@property (nonatomic, assign) id<MSDragTableViewDataSource> dataSource;
@property (nonatomic, assign) id<MSDragTableViewDelegate> delegate;

@end
