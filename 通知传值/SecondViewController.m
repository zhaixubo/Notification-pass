//
//  SecondViewController.m
//  通知传值
//
//  Created by 翟旭博 on 2022/8/2.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2", nil];
    //注册通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"1" object:nil userInfo:dictionary];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(pressback) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 200, 200);
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];
}
- (void)pressback {
    [self dismissViewControllerAnimated:YES completion:nil];
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
