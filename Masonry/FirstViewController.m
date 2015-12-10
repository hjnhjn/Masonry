//
//  FirstViewController.m
//  Masonry
//
//  Created by 惠绵金 on 15/12/10.
//  Copyright © 2015年 huimianjin. All rights reserved.
//
//只要添加了这个宏，就不用带mas_前缀
#define MAS_SHORTHAND
//只要添加了这个宏，equalTo就等价于mas_equalTo
#define MAS_SHORTHAND_GLOBALS
#import "FirstViewController.h"
#import "SecondViewController.h"
#import <Masonry.h>
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpNavView];
    [self setUpImageButton];
    //[self setUpFourView1];
    [self setUpFourView];
    [self setUpButton];
}
-(void)setUpButton{

    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.tag = 1000;
    //添加约束
    [button mas_makeConstraints:^(MASConstraintMaker * make){
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view.bottom).offset(-100);
        make.size.equalTo(CGSizeMake(50, 50));
        
    }];
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
    [button addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    //添加约束
    [button mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.mas_equalTo(view).with.offset(10);
        make.top.mas_equalTo(view).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    UILabel * lablel = [[UILabel alloc]init];
    lablel.text = @"标题";
    lablel.textColor = [UIColor whiteColor];
    [self.view addSubview:lablel];
    //添加约束
    [lablel mas_makeConstraints:^(MASConstraintMaker * make){
        make.center.equalTo(view);
        make.size.mas_equalTo(CGSizeMake(40, 30));
    
    }];
}
#pragma mark - =====设置并排于底部，间距20======
-(void)setUpImageButton{
    UIView * redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView * greenView = [[UIView alloc]init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    //添加约束
    [redView makeConstraints:^(MASConstraintMaker * make){
        //左间距
        make.left.equalTo(self.view.left).offset(20);
        //右间距
        make.bottom.equalTo (self.view.bottom).offset(-20);
        //右间距
        make.right.equalTo(greenView.left).offset(-20);
        make.height.equalTo(60);
    }];
    
    [greenView makeConstraints:^(MASConstraintMaker * make){
        //右间距
        make.right.equalTo(self.view.right).offset(-20);
        //和redView的底部间距相同
        make.bottom.equalTo(redView.bottom);
        //和redView的高度相同
        make.height.equalTo(redView);
        //和redView等宽
        make.width.equalTo(redView);
    }];
}
#pragma mark - 四个View平分整个项目
-(void)setUpFourView1{
    UIView * redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView * greenView = [[UIView alloc]init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    UIView * blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    UIView * purpleView = [[UIView alloc]init];
    purpleView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:purpleView];
    //添加约束
    [redView makeConstraints:^(MASConstraintMaker * make){
        make.top.and.left.equalTo(self.view);
        make.right.equalTo(self.view.centerX);
        make.bottom.equalTo(self.view.centerY);
    }];
    [greenView makeConstraints:^(MASConstraintMaker * make){
        make.left.equalTo(redView.right);
        make.right.equalTo(self.view);
        make.height.equalTo(redView);
        
    }];
    [blueView makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(redView.bottom);
        make.height.equalTo(redView);
        make.width.equalTo(redView);
    }];
    [purpleView makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(greenView.bottom);
        make.left.equalTo(blueView.right);
        make.height.equalTo(redView);
        make.width.equalTo(redView);
    
    
    }];
}
#pragma mark - =====其他方法的使用
-(void)setUpFourView{
    UIView * redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView * greenView = [[UIView alloc]init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    //添加约束
    [redView makeConstraints:^(MASConstraintMaker * make){
        //居中显示，直接设置距离四面的距离
          UIEdgeInsets eda = {100,100,100,100};
         make.edges.insets(eda);
    }];
    [greenView makeConstraints:^(MASConstraintMaker * make){
        make.center.equalTo(redView);
        make.height.equalTo(redView.height).multipliedBy(0.5);
        make.width.equalTo(redView.width).dividedBy(3).offset(20);
        
    
    
    }];
}
-(void)backButtonAction{
    [self presentViewController:[[SecondViewController alloc]init] animated:YES completion:nil];


}
-(void)backButtonAction:(UIButton * )button{
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
