//
//  DragCell.h
//  MSDragTableView
//
//  Created by ypl on 2018/10/9.
//  Copyright © 2018年 ypl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DragModel.h"

@interface DragCell : UITableViewCell
@property (nonatomic, strong) DragModel *dragModel;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end
