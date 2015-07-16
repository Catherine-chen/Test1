//
//  CHTCell.m
//  Test
//
//  Created by jiangchenyi on 15/7/6.
//  Copyright (c) 2015年 jiangchenyi. All rights reserved.
//

#import "CHTCell.h"
#import "JYGraphView.h"

@interface CHTCell()
@property (nonatomic)JYGraphView *graphView;
@end

@implementation CHTCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _graphView = [[JYGraphView alloc] initWithFrame:CGRectMake(0, 0, 280, 200)];
        _graphView.graphWidth = 280;
        [self.contentView addSubview:_graphView];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadCell{
    _graphView.graphData = @[[NSNumber numberWithInt:31],[NSNumber numberWithInt:31],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],];
    _graphView.belowGraphData = @[[NSNumber numberWithInt:19],[NSNumber numberWithInt:19],[NSNumber numberWithInt:20],[NSNumber numberWithInt:21],];
    [_graphView setNeedsDisplay];
}

@end
