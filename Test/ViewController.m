//
//  ViewController.m
//  Test
//
//  Created by jiangchenyi on 15/6/22.
//  Copyright (c) 2015年 jiangchenyi. All rights reserved.
//

#import "ViewController.h"



@interface NDCollectionViewFlowLayout : UICollectionViewFlowLayout
@end

// NDCollectionViewFlowLayout.m
@implementation NDCollectionViewFlowLayout
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *newAttributes = [NSMutableArray arrayWithCapacity:attributes.count];
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        if ((attribute.frame.origin.x + attribute.frame.size.width <= self.collectionViewContentSize.width) &&
            (attribute.frame.origin.y + attribute.frame.size.height <= self.collectionViewContentSize.height)) {
            [newAttributes addObject:attribute];
        }
    }
    return newAttributes;
}
@end


@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightContraint;
@property(nonatomic)UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _heightContraint.constant = 80;
//    [self.view layoutIfNeeded];
    /*
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    float space = .5f;
    [flow setItemSize:CGSizeMake((self.view.frame.size.width- 3*space)/3, 95)];
    [flow setMinimumLineSpacing:space];
    [flow setMinimumInteritemSpacing:0];
    [flow setSectionInset:UIEdgeInsetsMake(space, space, 0, space)];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 287) collectionViewLayout:flow];
    [_collectionView setBackgroundColor:[UIColor blackColor]];
    [_collectionView setDelegate:self];
    [_collectionView setDataSource:self];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
     */
    
//    [self.view addSubview:_collectionView];
    
//    [_collectionView setCollectionViewLayout:flow];
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout: (UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0.5, 0.5, 0, 0.5);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.view.frame.size.width- 3*0.5)/3, 95);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor whiteColor]];
    return cell;
}


- (void)viewDidAppear:(BOOL)animated{
    [self.collectionView.collectionViewLayout invalidateLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
