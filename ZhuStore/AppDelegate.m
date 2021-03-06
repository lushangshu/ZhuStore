//
//  AppDelegate.m
//  ZhuStore
//
//  Created by zhuzai on 17/3/21.
//  Copyright © 2017年 zhuzai. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNaviViewController.h"
#import "MainTabbarViewController.h"
#import "HomePageVC.h"
#import "StartUpAdsVC.h"
#import "AdImageTool.h"
#import "AdvertiseView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![[defaults objectForKey:@"isFirstLogin"] isEqualToString:@"NO" ]) {
//        StartUpAdsVC *vc = [[StartUpAdsVC alloc]init];
//        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//        [vc setNavigationBarHidden:YES];
//        self.window.rootViewController = vc;
//        [self.window makeKeyAndVisible];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"StartUpStoryBoard" bundle:nil];
        self.window.rootViewController = [storyboard instantiateInitialViewController];
        [self.window makeKeyAndVisible];

    }
    
    NSString *filePath = [AdImageTool getFilePathWithImageName:[defaults valueForKey:@"adImageName"]];
    BOOL isExist = [AdImageTool isFileExistWithFilePath:filePath];
    if (isExist) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"StartUpWithAds" bundle:nil];
        self.window.rootViewController = [storyboard instantiateInitialViewController];
        [self.window makeKeyAndVisible];
        
        AdvertiseView *adView = [[AdvertiseView alloc]initWithFrame:self.window.bounds];
        adView.filePath = filePath;
        [adView show];

    }
    return YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
