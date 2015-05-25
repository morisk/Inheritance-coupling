//
//  KRMViewController.m
//  KRMCoupling
//
//  Created by Moris Kramer on 25/5/15.
//  Copyright (c) 2015 Kramer Moris. All rights reserved.
//

#import "KRMViewControllerBase.h"

@interface KRMViewControllerBase ()

@end

@implementation KRMViewControllerBase

- (void)viewDidLoad {
  [super viewDidLoad];
  [self addSubviewsFromNib];
  // some additional logic
  [self setupButtons];
}
#pragma mark - Init
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

#pragma mark - Private
- (void)addSubviewsFromNib
{
  UIView *selfView = self.view;
  UIView *nibView;
  @try {
    nibView = [[NSBundle.mainBundle loadNibNamed:NSStringFromClass([self superclass])
                                           owner:self
                                         options:nil] firstObject];
  }
  @catch (NSException *exception) {
    NSAssert(NO, @"Error while loading base nib");
  }
  //NSArray *viewConstraints = [self.view constraints];

  self.view = selfView;
  NSMutableArray *viewList = [NSMutableArray new];
  for (UIView *view in nibView.subviews) {
    [viewList addObject:view];
  }
  // reverse views to because we got them last first
  NSArray *reversed = [[[viewList reverseObjectEnumerator] allObjects] copy];
  for (UIView *view in reversed) {
    [self.view addSubview:view];
    [self.view sendSubviewToBack:view];
  }
  //TODO: FIX CONSTRAINS LOADING
  //[self.view addConstraints:viewConstraints];
}


@end
