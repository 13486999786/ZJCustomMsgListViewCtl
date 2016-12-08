//
//  MsgCell.h
//  二级cell
//
//  Created by zj on 2016/12/7.
//  Copyright © 2016年 zj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MsgListModel.h"
@interface MsgCell : UITableViewCell
@property(nonatomic,assign) BOOL            isOpen;//是否打开

@property(nonatomic,strong) MsgListModel            *   model;//单个模型
@end
