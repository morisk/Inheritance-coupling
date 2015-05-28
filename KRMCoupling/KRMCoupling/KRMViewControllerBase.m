//
//  KRMViewController.m
//  KRMCoupling
//
//  Created by Moris Kramer on 25/5/15.
//  Copyright (c) 2015 Kramer Moris. All rights reserved.
//

#import "KRMViewControllerBase.h"

@interface KRMViewControllerBase ()
@property (strong, nonatomic) IBOutlet UIView *baseView;

@end

@implementation KRMViewControllerBase

- (void)viewDidLoad {
  [super viewDidLoad];
  [self addSubviewsFromNib];
  // some additional logic
  [self setupButtons];
}
#pragma mark - LOGIC GOES HERE
#pragma mark Init view elements
-(void) setupButtons {
  self.buttonBack.hidden = ([self.navigationController.viewControllers count] > 1) ? NO : YES;
  //fake loader
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [self.activityIndicator stopAnimating];
  });
}

#pragma mark - Events
- (IBAction)buttonBuyMeTapped:(UIButton *)sender {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Lets Play?"
                                                  message:@""
                                                 delegate:self
                                        cancelButtonTitle:@"Cancel"
                                        otherButtonTitles:nil];
  [alert show];
}

- (IBAction)buttonBackTapped:(UIButton *)sender {
  if (self.navigationController) {
    [self.navigationController popViewControllerAnimated:YES];
  }
}

#pragma mark - PRIVATE
- (void)addSubviewsFromNib
{
  //saving current view
  UIView *selfView = self.view;
  UIView *nibView;
  @try {
    // override currrent view from nib
    nibView = [[NSBundle.mainBundle loadNibNamed:NSStringFromClass([self superclass])
                                           owner:self
                                         options:nil] firstObject];
  }
  @catch (NSException *exception) {
    NSLog(@"Error while loading base nib");
    return;
  }
  //return our current view and and newly added nibview
  self.view = selfView;
  nibView.frame = self.view.frame;
  [self.view addSubview:nibView];
  [self.view sendSubviewToBack:self.baseView];
  //send whole nibView back if you need
  //[self.view sendSubviewToBack:nibView];
}


@end
