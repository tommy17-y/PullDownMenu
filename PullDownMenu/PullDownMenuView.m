//
//  PullDownMenuView.m
//  PullDownMenu
//
//  Created by Yuki Tomiyoshi on 2013/12/29.
//  Copyright (c) 2013年 Yuki Tomiyoshi. All rights reserved.
//

#import "PullDownMenuView.h"
#import <QuartzCore/QuartzCore.h>

const NSInteger aroundMargin = 50;
const NSInteger margin = 10;

@implementation PullDownMenuView

@synthesize width = _width;
@synthesize height = _height;
@synthesize submittedComponentLabel = _submittedComponentLabel;
@synthesize selectedComponentLabel = _selectedComponentLabel;
@synthesize componentsTableView = _componentsTableView;
@synthesize submitButton = _submitButton;
@synthesize clearButton = _clearButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _width = self.frame.size.width;
        _height = self.frame.size.height;

    }
    return self;
}

- (UILabel*)submittedComponentLabel {
    if(!_submittedComponentLabel) {
        _submittedComponentLabel = [[UILabel alloc] init];
        _submittedComponentLabel.text = @"selected : none";
        [self addSubview:_submittedComponentLabel];
    }
    return _submittedComponentLabel;
}

- (UILabel*)selectedComponentLabel {
    if(!_selectedComponentLabel) {
        _selectedComponentLabel = [[UILabel alloc] init];
        _selectedComponentLabel.text = @"  ▼Please Select";
        [[_selectedComponentLabel layer] setBorderColor:[[UIColor grayColor] CGColor]];
        [[_selectedComponentLabel layer] setBorderWidth:1.0];
        [_selectedComponentLabel.layer setCornerRadius:10];
        [_selectedComponentLabel setClipsToBounds:YES];

        [self addSubview:_selectedComponentLabel];
    }
    return _selectedComponentLabel;
}

- (UITableView*)componentsTableView {
    if(!_componentsTableView) {
        _componentsTableView = [[UITableView alloc] init];
        [[_componentsTableView layer] setBorderColor:[[UIColor grayColor] CGColor]];
        [[_componentsTableView layer] setBorderWidth:1.0];
        [_componentsTableView.layer setCornerRadius:10];
        [_componentsTableView setClipsToBounds:YES];
        _componentsTableView.rowHeight = 30.0;
        _componentsTableView.allowsSelection = YES;
        [self addSubview:_selectedComponentLabel];
    }
    return _componentsTableView;
}

- (UIButton*)submitButton {
    if(!_submitButton) {
        _submitButton = [[UIButton alloc] init];
        [_submitButton setTitle:@"submit" forState:UIControlStateNormal];
        [_submitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _submitButton.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
        [_submitButton.layer setCornerRadius:5];
        [_submitButton setClipsToBounds:YES];
        [self addSubview:_submitButton];
    }
    return _submitButton;
}

- (UIButton*)clearButton {
    if(!_clearButton) {
        _clearButton = [[UIButton alloc] init];
        [_clearButton setTitle:@"clear" forState:UIControlStateNormal];
        [_clearButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _clearButton.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
        [_clearButton.layer setCornerRadius:5];
        [_clearButton setClipsToBounds:YES];
        [self addSubview:_clearButton];
    }
    return _clearButton;
}

- (void)layoutPullDownMenu {
    
    float submittedComponentLabelWidth = _width - aroundMargin * 2;
    float selectedComponentLabelWidth = _width - aroundMargin;
    float componentsTableViewWidth = selectedComponentLabelWidth;
    float submitButtonWidth = 100;
    float clearButtonWidth = _width / 5;

    NSInteger submittedComponentLabelHeight = 30;
    NSInteger selectedComponentLabelHeight = 30;
    NSInteger componentsTableViewHeight = _width / 3 * 2;
    NSInteger submitButtonHeight = 30;
    NSInteger clearButtonHeight = submittedComponentLabelHeight;
    
    _submittedComponentLabel.frame = CGRectMake(aroundMargin,
                                                aroundMargin,
                                                submittedComponentLabelWidth,
                                                submittedComponentLabelHeight);
    
    _selectedComponentLabel.frame = CGRectMake(aroundMargin / 2,
                                               aroundMargin + submittedComponentLabelHeight + margin,
                                               selectedComponentLabelWidth,
                                               selectedComponentLabelHeight);
    
    _componentsTableView.frame = CGRectMake(aroundMargin / 2,
                                            aroundMargin + submittedComponentLabelHeight + margin,
                                            componentsTableViewWidth,
                                            componentsTableViewHeight);
    
    _submitButton.frame = CGRectMake((_width - submitButtonWidth) / 2,
                                     aroundMargin+ submittedComponentLabelHeight + margin + selectedComponentLabelHeight + margin,
                                     submitButtonWidth,
                                     submitButtonHeight);
    
    _clearButton.frame = CGRectMake(_width - aroundMargin - clearButtonWidth,
                                    aroundMargin,
                                    clearButtonWidth,
                                    clearButtonHeight);

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
