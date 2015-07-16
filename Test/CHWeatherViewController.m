//
//  CHWeatherViewController.m
//  Test
//
//  Created by jiangchenyi on 15/7/3.
//  Copyright (c) 2015年 jiangchenyi. All rights reserved.
//

#import "CHWeatherViewController.h"
#import "JYGraphView.h"

@interface CHWeatherViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CHWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    JYGraphView *graphView = [[JYGraphView alloc] initWithFrame:CGRectMake(0, 0, 400, 200)];
    graphView.graphWidth = 400;
    graphView.backgroundColor = [UIColor clearColor];
    graphView.strokeWidth = 1;//线条宽度
    graphView.strokeColor = [UIColor whiteColor];
    graphView.pointFillColor = [UIColor redColor];
    graphView.graphData = @[[NSNumber numberWithInt:-10],[NSNumber numberWithInt:25],[NSNumber numberWithInt:27],[NSNumber numberWithInt:30],[NSNumber numberWithInt:29],[NSNumber numberWithInt:30]];
    [self.view addSubview:graphView];
//    [_imageView setImage:[graphView graphImage]];
//    [NSNumber numberWithInt:-10]
    
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
