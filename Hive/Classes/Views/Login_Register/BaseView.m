//
//  BaseView.m
//  Hive
//
//  Created by BaoJun on 15/3/29.
//  Copyright (c) 2015年 wee. All rights reserved.
//

#import "BaseView.h"
#import "Utils.h"

@interface BaseView ()
//@property (strong, nonatomic)UILabel *titleLabel;
@property (strong, nonatomic) UIButton *nextBtn; // 下一步按钮
@property (strong, nonatomic) UIButton *backBtn;// 返回按钮
@end

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //[self initTopView];
        [self initButton];
    }
    return self;
}
//- (void)initTopView
//{
//    CGFloat titleY = 20;
//    CGFloat titleW = 60;
//    CGFloat titleH = 60;
//    CGFloat titleX = UIWIDTH/2 - titleW/2;
//    
//    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleX, titleY, titleW, titleH)];
//    self.titleLabel.text = @"Wee";
//    self.titleLabel.font = [UIFont fontWithName:Font_Medium size:22];
//    self.titleLabel.textColor = [UIColor blackColor];
//    self.titleLabel.textAlignment = NSTextAlignmentCenter;
//    self.titleLabel.layer.cornerRadius = titleW/2;
//    self.titleLabel.layer.masksToBounds = YES;
//    self.titleLabel.backgroundColor = [UIColor whiteColor];
//    [self addSubview:self.titleLabel];
//}

- (void)initButton
{
    CGFloat backBtnX = 20;
    CGFloat backBtnY = 0;
    CGFloat backBtnW = 60;
    CGFloat backBtnH = 44;
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backBtn.frame = CGRectMake(backBtnX, backBtnY, backBtnW, backBtnH);
    [self.backBtn setTitle:@"Back" forState:UIControlStateNormal];
    [self.backBtn setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.3] forState:UIControlStateNormal];
    self.backBtn.titleLabel.font = TitleFont;
    self.backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:self.backBtn];
    
    CGFloat nextBtnX = UIWIDTH - 90;
    CGFloat nextBtnY = 0;
    CGFloat nextBtnW = 70;
    CGFloat nextBtnH = 44;
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextBtn.frame = CGRectMake(nextBtnX, nextBtnY, nextBtnW, nextBtnH);
    [self.nextBtn setTitle:@"Next" forState:UIControlStateNormal];
    [self.nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.nextBtn.titleLabel.font = TitleFont;
    self.nextBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self addSubview:self.nextBtn];
    
    [self.backBtn addTarget:self action:@selector(navBackAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.nextBtn addTarget:self action:@selector(navNextAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)navBackAction:(UIButton *)sender{
    [self endEditing: YES];
}

- (void)navNextAction:(UIButton *)sender{
    if (![sender.titleLabel.text isEqualToString:@"Sign in"]) {
        [self endEditing: YES];
    }
}

// 设置按钮 标题
- (void)setNavNextBtnTitle:(NSString *)title
{
    if ([title isEqualToString:@"Sign in"]) {
        [self.backBtn removeFromSuperview];
    }
    [self.nextBtn setTitle:title forState:UIControlStateNormal];
}

- (void)dealloc
{
    self.nextBtn = nil;
    self.backBtn = nil;
}
@end
