//
//  MsgListModel.h
//  二级cell
//
//  Created by zj on 2016/12/7.
//  Copyright © 2016年 zj. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MsgListModel : NSObject
@property (nonatomic,assign) BOOL isOpen;//是否打开

@property(nonatomic,strong) NSString            *   picUrl;//图标地址
@property(nonatomic,strong) NSString            *   title;//标题
@property(nonatomic,strong) NSString            *   time;//时间
@property(nonatomic,strong) NSString            *   isRead;//是否已读取
@property(nonatomic,strong) NSString            *   content;//内容详情

@end
