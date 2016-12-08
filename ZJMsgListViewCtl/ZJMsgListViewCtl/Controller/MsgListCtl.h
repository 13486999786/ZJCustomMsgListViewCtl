//
//  MshListCtl.h
//  二级cell
//
//  Created by zj on 2016/12/7.
//  Copyright © 2016年 zj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MsgListCtl : UITableViewController
@property(nonatomic,strong) NSMutableArray            *   allMsgs;//所有消息
@property(nonatomic,strong) void(^deleteBlock)(NSUInteger );//删除的代码


@end
