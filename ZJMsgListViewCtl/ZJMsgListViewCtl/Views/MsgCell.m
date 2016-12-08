//
//  MsgCell.m
//  二级cell
//
//  Created by zj on 2016/12/7.
//  Copyright © 2016年 zj. All rights reserved.
//

#import "MsgCell.h"
#import "UIImageView+WebCache.h"

#define Color(r,g,b,a)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/1.0];

@interface MsgCell()
@property (nonatomic,strong) UIImageView        *   face ;
@property (nonatomic,strong) UILabel            *   titleLabel;
@property (nonatomic,strong) UILabel            *   timeLabel;
@property (nonatomic,strong) UILabel            *   isreadLabel;
@property (nonatomic,strong) UIImageView        *   isreadImageView;
@property (nonatomic,strong) UIImageView        *   rightIcon;

@end
@implementation MsgCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        #pragma 去掉点击效果
        self.selectionStyle = 0;
        
        
        
        _face = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 50, 50)];
        _face.contentMode=1;
        [self addSubview:_face];
        
        _isreadImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_face.frame)-10, CGRectGetMinY(_face.frame), 10, 10)];
        _isreadImageView.contentMode=1;
        [self addSubview:_isreadImageView];
        
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_face.frame)+10, 15, 80, 20)];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_titleLabel];
        
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-170, 15, 130,20)];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textAlignment=2;
        _timeLabel.textColor = Color(153, 153, 153, 1.0);
       
        [self addSubview:_timeLabel];
        
        _isreadLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_face.frame)+10, CGRectGetMaxY(_face.frame)-20, 100, 20)];
        _isreadLabel.textAlignment=0;
        _isreadLabel.font = [UIFont systemFontOfSize:15];
        _isreadLabel.textColor = Color(170, 170, 170, 1.0);
        [self addSubview:_isreadLabel];
        
        
        
        
        _rightIcon = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-30, 30, 20, 20)];
        _rightIcon.image = [UIImage imageNamed:@"旋转@2X.png"];
        [self addSubview:_rightIcon];
        
        
        UIView * line = [[UIView alloc]initWithFrame:CGRectMake(75, 79, [UIScreen mainScreen].bounds.size.width-75, 1)];
        line.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
        [self addSubview:line];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma 右边箭头改变
-(void)setIsOpen:(BOOL)isOpen
{
    if (isOpen==YES)//如果打开状态
    {
            _rightIcon.image = [UIImage imageNamed:@"旋转1@2X.png"];
    }
    else//如果不是打开状态
    {
            _rightIcon.image = [UIImage imageNamed:@"旋转@2X.png"];
    }
}


#pragma 数据进来赋值
-(void)setModel:(MsgListModel *)model
{
    [_face sd_setImageWithURL:[NSURL URLWithString:model.picUrl] placeholderImage:[UIImage imageNamed:@"超时背景.jpg"]];
    _titleLabel.text = model.title;//标题
    _isreadLabel.text = model.isRead;//地点
    _timeLabel.text = model.time;//时间
}

@end
