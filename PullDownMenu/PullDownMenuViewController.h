//
//  PullDownMenuViewController.h
//  PullDownMenu
//
//  Created by Yuki Tomiyoshi on 2013/12/29.
//  Copyright (c) 2013年 Yuki Tomiyoshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullDownMenuView.h"

@interface PullDownMenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property PullDownMenuView *pullDownMenuView;

@end
