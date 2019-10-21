# YPDragTableView
自定义拖动组件，支持拖动排序

### YPDragTableView使用说明：
/**
 将修改重排后的数组传入，以便外部更新数据源
 
 @param tableView tableView
 @param newArray newArray
 */

```
- (void)tableView:(MSDragTableView *)tableView newArrayDataForDataSource:(NSArray *)newArray;
```

@optional
/**
 选中的cell准备好可以移动的时候
 
 @param tableView tableView
 @param indexPath indexPath 
 */

```
- (void)tableView:(MSDragTableView *)tableView cellReadyToMoveAtIndexPath:(NSIndexPath *)indexPath;
```

/**
 选中的cell将要移动，手势尚未松开
 
 @param tableView tableView
 */

```
- (void)cellWillMoveInTableView:(MSDragTableView *)tableView;
```


/**
 选中的cell正在移动，变换位置，手势尚未松开
 
 @param tableView tableView
 */

```
- (void)cellIsMovingInTableView:(MSDragTableView *)tableView;
```

/**
 选中的cell完成移动，手势已松开
 
 @param tableView tableView
 */

```
- (void)cellDidEndMovingInTableView:(MSDragTableView *)tableView;
```
