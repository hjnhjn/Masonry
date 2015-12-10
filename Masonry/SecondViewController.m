//
//  SecondViewController.m
//  Masonry
//
//  Created by 惠绵金 on 15/12/10.
//  Copyright © 2015年 huimianjin. All rights reserved.
//
//只要添加了这个宏，就不用带mas_前缀
#define MAS_SHORTHAND
//只要添加了这个宏，equalTo就等价于mas_equalTo
#define MAS_SHORTHAND_GLOBALS
#import "SecondViewController.h"
#import <Masonry.h>
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpNavView];
    [self setUpImageView];
}
-(void)setUpNavView{
    
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    //添加约束
    [view mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.top.right.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.width.equalTo(self.view);
        make.height.equalTo(64);
    }];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor cyanColor];
    [button addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    //添加约束
    [button mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.mas_equalTo(view).with.offset(10);
        make.top.mas_equalTo(view).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    UILabel * lablel = [[UILabel alloc]init];
    lablel.text = @"标题2";
    lablel.textColor = [UIColor whiteColor];
    [self.view addSubview:lablel];
    //添加约束
    [lablel mas_makeConstraints:^(MASConstraintMaker * make){
        make.center.equalTo(view);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
}
-(void)setUpImageView{
    UIView * redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    //添加约束
    [redView makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(64);
        make.left.equalTo(0);
        make.right.equalTo(0);
        make.width.equalTo(self.view);
        make.height.equalTo(self.view).dividedBy(4);
    }];
    UIView * yellowView = [[UIView alloc]init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    UIView * blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    //添加约束
    [yellowView makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(redView.bottom).offset(10);
        make.left.equalTo(self.view.left).offset(10);
        make.right.equalTo(blueView.left).offset(-10);
        make.height.equalTo(self.view).dividedBy(5);
    }];
    [blueView makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(yellowView);
        make.right.equalTo(self.view.right).offset(-10);
        make.height.equalTo(yellowView);
        make.width.equalTo(yellowView);
    }];
    
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
    
    [view makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(yellowView.bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-50);
        //make.height.equalTo(self.view).dividedBy(3);
    }];

}
-(void)backButtonAction{
    [self dismissViewControllerAnimated:YES completion:nil];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
