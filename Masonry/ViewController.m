//
//  ViewController.m
//  Masonry
//
//  Created by 惠绵金 on 15/12/10.
//  Copyright © 2015年 huimianjin. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "FirstViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpButton];
    
}
#pragma mark - =======居中显示一个按钮=======
-(void)setUpButton{
    UIView * superView = self.view;
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    // 在使用autolayout之前一定要先将视图加到superView上，否则会报错
    [self.view addSubview:button];
   //用masonry函数来对你添加的View进行约束
    [button mas_makeConstraints:^(MASConstraintMaker * make){
        //设置居中
        make.centerX .equalTo(superView);
        //位于底部间距100
        make.bottom.equalTo(superView).offset(-100);
        //设置宽高
        make.size.mas_equalTo(CGSizeMake(130, 50));
    }];

}
#pragma maark -=====点击事件=======
-(void)buttonAction{
   
    [self  presentViewController:[[FirstViewController alloc]init] animated:YES completion:nil];
     
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
