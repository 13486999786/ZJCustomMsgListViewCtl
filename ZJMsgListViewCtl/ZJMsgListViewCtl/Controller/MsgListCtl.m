//
//  MshListCtl.m
//  二级cell
//
//  Created by zj on 2016/12/7.
//  Copyright © 2016年 zj. All rights reserved.
//

#import "MsgListCtl.h"
#import "MsgCell.h"
#import "MsgListModel.h"

@interface MsgListCtl ()
@property (nonatomic,assign) NSUInteger                 section;
@property (nonatomic,strong) NSIndexPath            *   indexpath;//记录点击
@end

@implementation MsgListCtl


#pragma 初始化项目
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setNav];//设置导航条
    
    [self setTableView];//设置表格
}



#pragma 设置Nav
-(void)setNav
{
    self.title = @"消息列表";
}

#pragma 设置表格
-(void)setTableView
{
    [self.tableView registerClass:[MsgCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell1"];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.allMsgs.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        MsgListModel * model =self.allMsgs[indexPath.section];
        MsgCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.clipsToBounds=YES;
        cell.isOpen = model.isOpen;
        cell.model = self.allMsgs[indexPath.section];
        return cell;
    }
    else
    {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        MsgListModel * model = self.allMsgs[indexPath.section];
        cell.clipsToBounds=YES;
        cell.textLabel.text = model.content;
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MsgListModel * model = self.allMsgs[indexPath.section];
    
    NSLog(@"%d",model.isOpen);
    
    if (indexPath.row==0)
    {
        return 80;
    }
    else
    {
        if (model.isOpen==YES)
        {
            return 80;
        }
        else
        {
            return 0.0001;
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001;
}


#pragma 点击某一行效果
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
    for (MsgListModel *model in self.allMsgs)
    {
        NSUInteger index = [self.allMsgs indexOfObject:model];//去的下标
        if (index==indexPath.section)//如果对得到
        {
            model.isOpen=!model.isOpen;
        }
        else
        {
             model.isOpen=NO;
        }
    }
    NSIndexPath * index0 = [NSIndexPath indexPathForRow:0   inSection:indexPath.section];
    NSIndexPath * index = [NSIndexPath indexPathForRow:1   inSection:indexPath.section];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:index0,index,self.indexpath,nil] withRowAnimation:UITableViewRowAnimationFade];//刷新某一行
     self.indexpath=index0;
        
    }
}

#pragma 滑动删除效果
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.allMsgs removeObjectAtIndex:indexPath.section];//删除数据源
    
    [tableView reloadData];
    
    //想网络请求删除此条数据
    self.deleteBlock(indexPath.section);
    
}




@end
