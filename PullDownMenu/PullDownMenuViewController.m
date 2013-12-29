//
//  PullDownMenuViewController.m
//  PullDownMenu
//
//  Created by Yuki Tomiyoshi on 2013/12/29.
//  Copyright (c) 2013年 Yuki Tomiyoshi. All rights reserved.
//

#import "PullDownMenuViewController.h"
#import "PullDownMenuView.h"

@interface PullDownMenuViewController ()

@end

@implementation PullDownMenuViewController

@synthesize pullDownMenuView = _pullDownMenuView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _pullDownMenuView = [[PullDownMenuView alloc] initWithFrame:CGRectMake(0,
                                                                           0,
                                                                           self.view.frame.size.width,
                                                                           self.view.frame.size.height)];
    _pullDownMenuView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_pullDownMenuView];
    
    [_pullDownMenuView submittedComponentLabel];
    
    [_pullDownMenuView selectedComponentLabel];
    _pullDownMenuView.selectedComponentLabel.userInteractionEnabled = YES;
    [_pullDownMenuView.selectedComponentLabel addGestureRecognizer:
     [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedComponentsTableView)]];
    
    [_pullDownMenuView componentsTableView];
    _pullDownMenuView.componentsTableView.delegate = self;
    _pullDownMenuView.componentsTableView.dataSource = self;

    [_pullDownMenuView submitButton];
    [_pullDownMenuView.submitButton addTarget:self
            action:@selector(tappedSubmitButton) forControlEvents:UIControlEventTouchUpInside];
    
    [_pullDownMenuView clearButton];
    [_pullDownMenuView.clearButton addTarget:self
                                       action:@selector(tappedClearButton) forControlEvents:UIControlEventTouchUpInside];
    
    [_pullDownMenuView layoutPullDownMenu];
    
    _pullDownMenuView.componentsTableView.hidden = YES;
    
    [_pullDownMenuView addSubview:_pullDownMenuView.submittedComponentLabel];
    [_pullDownMenuView addSubview:_pullDownMenuView.selectedComponentLabel];
    [_pullDownMenuView addSubview:_pullDownMenuView.componentsTableView];
    [_pullDownMenuView addSubview:_pullDownMenuView.submitButton];
    [_pullDownMenuView addSubview:_pullDownMenuView.clearButton];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] init];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d", (int)indexPath.row + 1];

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_pullDownMenuView.componentsTableView cellForRowAtIndexPath:indexPath];
    
    _pullDownMenuView.selectedComponentLabel.text =
        [NSString stringWithFormat:@"  %@", cell.textLabel.text];
    
    _pullDownMenuView.componentsTableView.hidden = YES;
    _pullDownMenuView.submitButton.hidden = NO;

}

/*
- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    return @"States";
}
 */

- (void)tappedComponentsTableView {
    _pullDownMenuView.componentsTableView.hidden = NO;
    _pullDownMenuView.submitButton.hidden = YES;
}

- (void)tappedSubmitButton {
    _pullDownMenuView.submittedComponentLabel.text =
        [NSString stringWithFormat:@"selected  :%@", _pullDownMenuView.selectedComponentLabel.text];
}

- (void)tappedClearButton {
    _pullDownMenuView.submittedComponentLabel.text = @"selected : none";
    _pullDownMenuView.selectedComponentLabel.text = @"  ▼Please Select";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
