//
//  DragModel.h
//  MSDragTableView
//
//  Created by ypl on 2018/10/9.
//  Copyright © 2018年 ypl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DragModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL isMoving;
@end
