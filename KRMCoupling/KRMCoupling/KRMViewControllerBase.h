//
//  KRMViewController.h
//  KRMCoupling
//
//  Created by Moris Kramer on 25/5/15.
//  Copyright (c) 2015 Kramer Moris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KRMViewControllerBase : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *buttonBack;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)buttonBuyMeTapped:(UIButton *)sender;
- (IBAction)buttonBackTapped:(UIButton *)sender;
@end
