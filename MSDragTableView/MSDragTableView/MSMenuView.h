//
//  MSMenuView.h
//  MSDragTableView
//
//  Created by ypl on 2018/10/9.
//  Copyright © 2018年 ypl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MSMenuAction;
@interface MSMenuView : UIView

@property (nonatomic,assign) CGFloat cornerRaius;
@property (nonatomic,strong) UIColor *separatorColor;
@property (nonatomic,strong) UIColor *menuColor;
//设置菜单单元格高度  default = 44
@property (nonatomic,assign) CGFloat menuCellHeight;
//最大显示数量  default = 5
@property (nonatomic,assign) NSInteger maxDisplayCount;
@property (nonatomic,assign,getter = isShadowShowing)BOOL   isShowShadow;
//选择菜单选项后消失 default = YES
@property (nonatomic,assign) BOOL dismissOnselected;
//点击菜单外消失 default = YES
@property (nonatomic,assign) BOOL dismissOnTouchOutside;
//设置字体大小 default = 15
@property (nonatomic,assign) UIFont *textFont;
//设置字体颜色 default = 黑色
@property (nonatomic,strong) UIColor *textColor;
//设置偏移距离 default = 0（与触摸点在Y轴上的偏移）
@property (nonatomic,assign)  CGFloat offset;

+ (instancetype)menuWithActions:(NSArray<MSMenuAction *> *)actions width:(CGFloat)width atPoint:(CGPoint)point;
// 从关联视图创建（可以是UIView和UIBarButtonItem）
+ (instancetype)menuWithActions:(NSArray<MSMenuAction *> *)actions width:(CGFloat)width relyonView:(id)view;
- (void)show;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@end

@interface MSMenuAction : NSObject
@property (nonatomic, readonly) NSString      *title;
@property (nonatomic, readonly) UIImage       *image;
@property (nonatomic,copy, readonly) void (^handler)(MSMenuAction *action);
+ (instancetype)actionWithTitle:(NSString *)title image:(UIImage *)image handler:(void (^)(MSMenuAction *action))handler;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@end
