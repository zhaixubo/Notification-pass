//
//  FirstViewController.m
//  通知传值
//
//  Created by 翟旭博 on 2022/8/2.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    //注册观察者用于接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notice:) name:@"1" object:nil];
    
    
    _firstlabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    _secondlabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 200, 100, 100)];
    [self.view addSubview:_firstlabel];
    [self.view addSubview:_secondlabel];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(pressgo) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 200, 200);
    [button setTitle:@"进入" forState:UIControlStateNormal];
    [self.view addSubview:button];
}

- (void)pressgo {
    SecondViewController *viewcontroller = [[SecondViewController alloc] init];
    viewcontroller.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:viewcontroller animated:YES completion:nil];
}

- (void)notice:(NSNotification *) sender {
    _firstlabel.text = sender.userInfo[@"key1"];
    _secondlabel.text = sender.userInfo[@"key2"];

}

- (void)dealloc {
    //移除所有通知
    //[[NSNotificationCenter defaultCenter] removeObserver:self];
    
    //移除某个通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"1" object:nil];
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
