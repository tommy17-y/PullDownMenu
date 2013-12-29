//
//  PullDownMenuView.h
//  PullDownMenu
//
//  Created by Yuki Tomiyoshi on 2013/12/29.
//  Copyright (c) 2013年 Yuki Tomiyoshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PullDownMenuView : UIView

@property float width;
@property float height;

@property (nonatomic, retain) UILabel *submittedComponentLabel;
@property (nonatomic, retain) UILabel *selectedComponentLabel;
@property (nonatomic, retain) UITableView *componentsTableView;
@property (nonatomic, retain) UIButton *submitButton;
@property (nonatomic, retain) UIButton *clearButton;

- (UILabel*)submittedComponentLabel;
- (UILabel*)selectedComponentLabel;
- (UITableView*)componentsTableView;
- (UIButton*)submitButton;
- (UIButton*)clearButton;

- (void)layoutPullDownMenu;

@end
