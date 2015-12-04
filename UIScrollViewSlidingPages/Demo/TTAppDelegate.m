//
//  TTAppDelegate.m
//  UITableViewZoomController
//
//  Created by Thomas Thorpe on 25/02/2013.
//  Copyright (c) 2013 Thomas Thorpe. All rights reserved.
//

#import "TTAppDelegate.h"

#import "TableViews/TabTwoViewController.h"
#import "TTViewController.h"
#import "UserAccountViewController.h"
#import "WXTabBarController.h"
#import "ViewController.h"
#import "UserAccountViewController.h"

@interface TTAppDelegate ()

@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) UITabBarController *tabBarController;

@end

@implementation TTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UINavigationController *)navigationController {
    if (_navigationController == nil) {
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: self.tabBarController];//[[TabTwoViewController alloc] init]];
//        navigationController.navigationBar.tintColor = [UIColor colorWithRed:26 / 255.0 green:178 / 255.0 blue:10 / 255.0 alpha:0];
        [navigationController setNavigationBarHidden:YES animated:YES];
        _navigationController = navigationController;
    }
    return _navigationController;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/
- (UITabBarController *)tabBarController {
    if (_tabBarController == nil) {
        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        
        UserAccountViewController *userAccountViewController = ({
            UserAccountViewController *userAccountViewController = [[UserAccountViewController alloc] init];
            userAccountViewController.title = @"tab-1";
            
            userAccountViewController.view.backgroundColor = [UIColor colorWithRed:48 / 255.0 green:67 / 255.0 blue:78 / 255.0 alpha:1];
            
            userAccountViewController;
        });
        
        ViewController *contactsViewController = ({
            ViewController *contactsViewController = [[ViewController alloc] init];
            contactsViewController.title = @"tab-2";
            contactsViewController.view.backgroundColor = [UIColor colorWithRed:115 / 255.0 green:155 / 255.0 blue:6 / 255.0 alpha:1];
            
            contactsViewController;
        });
        
        tabBarController.title = @"微信";
        [tabBarController setViewControllers:[[NSArray alloc] initWithObjects:userAccountViewController, contactsViewController, nil]];
//        viewControllers = @[ mainframeViewController, contactsViewController];
        tabBarController.tabBar.tintColor = [UIColor colorWithRed:26 / 255.0 green:178 / 255.0 blue:10 / 255.0 alpha:1];
        
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

- (void)didClickAddButton:(id)sender {
    ViewController *viewController = [[ViewController alloc] init];
    
    viewController.title = @"添加";
    viewController.view.backgroundColor = [UIColor colorWithRed:26 / 255.0 green:178 / 255.0 blue:10 / 255.0 alpha:1];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

//- (WXTabBarController *)tabBarController {
//    if (_tabBarController == nil) {
//        WXTabBarController *tabBarController = [[WXTabBarController alloc] init];
//        
//        UserAccountViewController *userAccountViewController = ({
//                    UserAccountViewController *userAccountViewController = [[UserAccountViewController alloc] init];
//                    userAccountViewController.title = @"tab-1";
//        
//                    userAccountViewController.view.backgroundColor = [UIColor colorWithRed:48 / 255.0 green:67 / 255.0 blue:78 / 255.0 alpha:1];
//        
//                    userAccountViewController;
//                });
//
//        
//        ViewController *contactsViewController = ({
//            ViewController *contactsViewController = [[ViewController alloc] init];
//            
////            UIImage *contactsImage   = [[UIImage imageNamed:@"tabbar_contacts"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
////            UIImage *contactsHLImage = [[UIImage imageNamed:@"tabbar_contactsHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
////            
////            contactsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"通讯录" image:contactsImage selectedImage:contactsHLImage];
//            contactsViewController.view.backgroundColor = [UIColor colorWithRed:115 / 255.0 green:155 / 255.0 blue:6 / 255.0 alpha:1];
//            
//            contactsViewController;
//        });
//        
////        ViewController *discoverViewController = ({
////            ViewController *discoverViewController = [[ViewController alloc] init];
////            
////            UIImage *discoverImage   = [[UIImage imageNamed:@"tabbar_discover"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
////            UIImage *discoverHLImage = [[UIImage imageNamed:@"tabbar_discoverHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
////            
////            discoverViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:discoverImage selectedImage:discoverHLImage];
////            discoverViewController.view.backgroundColor = [UIColor colorWithRed:32 / 255.0 green:85 / 255.0 blue:128 / 255.0 alpha:1];
////            
////            discoverViewController;
////        });
////        
////        ViewController *meViewController = ({
////            ViewController *meViewController = [[ViewController alloc] init];
////            
////            UIImage *meImage   = [[UIImage imageNamed:@"tabbar_contacts"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
////            UIImage *meHLImage = [[UIImage imageNamed:@"tabbar_contactsHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
////            
////            meViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:meImage selectedImage:meHLImage];
////            meViewController.view.backgroundColor = [UIColor colorWithRed:199 / 255.0 green:135 / 255.0 blue:56 / 255.0 alpha:1];
////            
////            meViewController;
////        });
//        
//        tabBarController.title = @"微信";
//        [tabBarController setViewControllers:[[NSArray alloc] initWithObjects:userAccountViewController, contactsViewController, nil]];
////        tabBarController.viewControllers = @[ userAccountViewController, contactsViewController];
//        tabBarController.tabBar.tintColor = [UIColor colorWithRed:26 / 255.0 green:178 / 255.0 blue:10 / 255.0 alpha:1];
//        
//        tabBarController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_add"]
//                                                                                              style:UIBarButtonItemStylePlain
//                                                                                             target:self
//                                                                                             action:@selector(didClickAddButton:)];
//        
//        _tabBarController = tabBarController;
//    }
//    return _tabBarController;
//}

//- (void)didClickAddButton:(id)sender {
//    ViewController *viewController = [[ViewController alloc] init];
//    
//    viewController.title = @"添加";
//    viewController.view.backgroundColor = [UIColor colorWithRed:26 / 255.0 green:178 / 255.0 blue:10 / 255.0 alpha:1];
//    
//    [self.navigationController pushViewController:viewController animated:YES];
//}


@end
