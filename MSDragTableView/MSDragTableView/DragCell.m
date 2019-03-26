//
//  DragCell.m
//  MSDragTableView
//
//  Created by ypl on 2018/10/9.
//  Copyright © 2018年 ypl. All rights reserved.
//

#import "DragCell.h"

@implementation DragCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setDragModel:(DragModel *)dragModel {
    _dragModel = dragModel;
    if (dragModel) {
        self.titleLab.text = dragModel.title;
        if (dragModel.isMoving) {
            self.addBtn.hidden = YES;
        }else{
            self.addBtn.hidden = NO;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
