//
//  ViewController.m
//  ZJMsgListViewCtl
//
//  Created by zj on 2016/12/7.
//  Copyright © 2016年 zj. All rights reserved.
//

#import "ViewController.h"
#import "MsgListCtl.h"
#import "MsgListModel.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    //需要传入的模型数组,可根据内容自定义
    NSMutableArray * allmsgs = [NSMutableArray array];
    for (int i =0; i<5; i++)
    {
        MsgListModel * model = [[MsgListModel alloc]init];
        model.picUrl = @"http://image.baidu.com/search/detail?ct=503316480&z=0&tn=baiduimagedetail&ipn=d&cl=2&cm=1&sc=0&lm=-1&ie=gbk&pn=0&rn=1&di=71007564430&ln=30&word=%CD%BC%C6%AC&os=159233822,272436753&cs=4155302816,1201715785&objurl=http%3A%2F%2Fpic33.nipic.com%2F20130916%2F3420027_192919547000_2.jpg&bdtype=0&simid=3235028088,3077875656&pi=0&adpicid=0&fr=ala&ala=1&alatpl=others&pos=1";
        model.title = [NSString stringWithFormat:@"标题%d",i+1];
        model.time = [NSString stringWithFormat:@"2016年12月10日"];
        model.isRead = @"是否已经读取";
        model.content = [NSString stringWithFormat:@"第%d行的详情",i+1];
        [allmsgs addObject:model];
    }
    
    //写删除数据的网络请求
    void(^blockName)(NSUInteger ) = ^(NSUInteger rowNum)
    {
        NSLog(@"%@",[NSString stringWithFormat:@"删除了第%ld行",rowNum]);
    };
    
    
    
    
    MsgListCtl * ctl = [[MsgListCtl alloc]initWithStyle:UITableViewStyleGrouped];
    ctl.allMsgs = allmsgs;//把网络获取的模型数组传进去
    ctl.deleteBlock = blockName;//把删除数据的请求代码块传递进去
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:ctl];
    [self presentViewController:nav animated:YES completion:nil];
    
}


@end
