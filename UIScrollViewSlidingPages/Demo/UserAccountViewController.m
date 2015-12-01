//
//  UserAccountViewController.m
//  GroupProjectAccountPage
//
//  Created by Ramasamy Dayanand on 11/26/15.
//  Copyright © 2015 Dayanand Ramasamy. All rights reserved.
//

#import "UserAccountViewController.h"
#import "TTScrollSlidingPagesController.h"
#import "TTSliddingPageDelegate.h"
#import "TTSlidingPagesDataSource.h"
#import "TTSlidingPage.h"
#import "TTSlidingPageTitle.h"
#import "MyAccountInformationViewController.h"
#import "MyInterestsViewController.h"
#import "MyPurchasesAndCouponsViewController.h"

@interface UserAccountViewController () <TTSlidingPagesDataSource, TTSliddingPageDelegate>
@property (strong, nonatomic) TTScrollSlidingPagesController *slider;
@end

@implementation UserAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.slider = [[TTScrollSlidingPagesController alloc] init];
    self.slider.dataSource = self;
    
    self.slider.view.frame = self.view.frame;
    [self.view addSubview:self.slider.view];
    [self addChildViewController:self.slider];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(int)numberOfPagesForSlidingPagesViewController:(TTScrollSlidingPagesController *)source{
    return 3;
}

-(TTSlidingPage *)pageForSlidingPagesViewController:(TTScrollSlidingPagesController*)source atIndex:(int)index{
    UIViewController *viewController = [[UIViewController alloc] init];
    switch (index) {
        case 0:
            viewController = [[MyPurchasesAndCouponsViewController alloc] init];
            break;
        case 1:
            viewController = [[MyInterestsViewController alloc] init];
            break;
        case 2:
            viewController = [[MyAccountInformationViewController alloc] init];
            break;
    }
    
    return [[TTSlidingPage alloc] initWithContentViewController:viewController];
    
}

-(TTSlidingPageTitle *)titleForSlidingPagesViewController:(TTScrollSlidingPagesController *)source atIndex:(int)index{
    TTSlidingPageTitle *title;
    
    //all other pages just use a simple text header
    switch (index) {
        case 0:
            title = [[TTSlidingPageTitle alloc] initWithHeaderText:@"My Coupons/ Purchases"];
            break;
        case 1:
            title = [[TTSlidingPageTitle alloc] initWithHeaderText:@"Interests"];
            break;
        case 2:
            title = [[TTSlidingPageTitle alloc] initWithHeaderText:@"Account information"];
            break;
    }
    return title;
}

#pragma mark - delegate
-(void)didScrollToViewAtIndex:(NSUInteger)index
{
    NSLog(@"scrolled to view");
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
