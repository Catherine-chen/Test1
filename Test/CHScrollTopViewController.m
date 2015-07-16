//
//  CHScrollTopViewController.m
//  Test
//
//  Created by jiangchenyi on 15/7/1.
//  Copyright (c) 2015年 jiangchenyi. All rights reserved.
//

#import "CHScrollTopViewController.h"

@interface CHScrollTopViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>{
    CGFloat lastOffsetY;
    BOOL isDecelerating;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *topView;
@end

@implementation CHScrollTopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"begin");
    [self.tableView setContentOffset:CGPointMake(0, -40)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    isDecelerating = YES;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    isDecelerating = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(scrollView.frame.size.height >= scrollView.contentSize.height)
        return;
    if(scrollView.contentOffset.y > -40 && scrollView.contentOffset.y <= 0){
        scrollView.contentInset = UIEdgeInsetsMake(40,0,0,0);
        _topView.frame = CGRectMake(_topView.frame.origin.x, _topView.frame.origin.y, _topView.frame.size.width, 40);
    }
    else if(scrollView.contentOffset.y >= scrollView.contentInset.top){
        scrollView.contentInset = UIEdgeInsetsZero;
        _topView.frame = CGRectMake(_topView.frame.origin.x, _topView.frame.origin.y, _topView.frame.size.width, 0);
    }
    
//    if(lastOffsetY < scrollView.contentOffset.y && scrollView.contentOffset.y >= -40){//moving up
//        
//        if(self.navigationController.navigationBar.frame.size.height + self.navigationController.navigationBar.frame.origin.y  > 0){//not yet hidden
//            float newY = self.navigationController.navigationBar.frame.origin.y - (scrollView.contentOffset.y - lastOffsetY);
//            if(newY < -self.navigationController.navigationBar.frame.size.height)
//                newY = -self.navigationController.navigationBar.frame.size.height;
//            self.navigationController.navigationBar.frame = CGRectMake(self.navigationController.navigationBar.frame.origin.x,
//                                                                       newY,
//                                                                       self.navigationController.navigationBar.frame.size.width,
//                                                                       self.navigationController.navigationBar.frame.size.height);
//        }
//    }else
//        if(self.navigationController.navigationBar.frame.origin.y < [UIApplication sharedApplication].statusBarFrame.size.height  &&
//           (self.scrollForHideNavigation.contentSize.height > self.scrollForHideNavigation.contentOffset.y + self.scrollForHideNavigation.frame.size.height)){//not yet shown
//            float newY = self.navigationController.navigationBar.frame.origin.y + (lastOffsetY - scrollView.contentOffset.y);
//            if(newY > [UIApplication sharedApplication].statusBarFrame.size.height)
//                newY = [UIApplication sharedApplication].statusBarFrame.size.height;
//            self.navigationController.navigationBar.frame = CGRectMake(self.navigationController.navigationBar.frame.origin.x,
//                                                                       newY,
//                                                                       self.navigationController.navigationBar.frame.size.width,
//                                                                       self.navigationController.navigationBar.frame.size.height);
//        }
    
    lastOffsetY = scrollView.contentOffset.y;
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [cell.textLabel setText:@"no no"];
    return cell;
}

@end
