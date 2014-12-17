//
//  AppDelegate.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/4.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "httpManager.h"
#import "baseTabBarViewController.h"
#import "recommend.h"
#import "search.h"
#import "personSelf.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
 
    [self UMengStatisticalData];
    
//    推送   IOS8有改变。。。else后面是 8一下版本
 /*   if (version >=8.0) {
        [[UIApplication sharedApplication]registerUserNotificationSettings:[UIUserNotificationSettings
            settingsForTypes:(UIUserNotificationTypeSound |UIUserNotificationTypeAlert | UIUserNotificationTypeBadge)
            categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        //这里还是原来的代码
        [[UIApplication sharedApplication]registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound |UIRemoteNotificationTypeAlert ];
    }
*/

//    获取版本号 然后对Plist里的version进行判断
 /*   [httpManager requestWithUrl:@"http://lw.cms.palmtrends.com/api_v2.php?action=list&sa=guandian&offset=0&count=15&uid=12070919&platform=a&mobile=XG+X800&pid=10074&e=27ece4f12e76de6e5a1bd0919956bd67" FinishBlock:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",dic);
        NSDictionary *dicPlist = plistWay;
        NSLog(@"%@",dicPlist[@"Version"]);
            NSString *str = @"1.0.0.0";
        NSLog(@"%d",[str compare:dicPlist[@"Version"]]);

        
        
        if ([str compare:dicPlist[@"Version"]] != 0 ) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"最新版本" message:[NSString stringWithFormat:@"%@",str] delegate:self cancelButtonTitle:@"哦" otherButtonTitles: nil];
            [alert show];
        }
        
        
    } FailedBlock:^{
        NSLog(@"failed");
    }];
 
 */
    
//    ViewController *vc = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
//    self.window.rootViewController = vc;
    
    
//    baseTabBarViewController *tabbar = [[baseTabBarViewController alloc]init];
//    tabbar.viewControllers = arr;
    //    [tabbar.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar"]];
/*
    
    [tabbar.tabBar setBarStyle:UIBarStyleBlack];
    
    self.window.rootViewController = tabbar;
*/
    
        
    NSMutableArray * viewControllers = [NSMutableArray array];
    NSArray * VCArray =@[@"recommend",@"search",@"personSelf"];
    for (NSString * className in VCArray) {
        
        Class vcClass =NSClassFromString(className);
        UIViewController * vc =[[vcClass alloc]init];
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [viewControllers addObject:nav];
    }
    UITabBarController * tbc = [[UITabBarController alloc]init];
    tbc.viewControllers = viewControllers;
    
    tbc.tabBar.backgroundImage = [UIImage imageNamed:@"dilan@2x.png"];
    [tbc.tabBar setTintColor:[UIColor whiteColor]];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor whiteColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    NSArray * imageName = @[@"tuijian-wei@2x.png",@"xunmi-wei@2x.png",@"wode-wei@2x.png"];
    NSArray * selectImageName = @[@"tuijian-xuan@2x.png",@"xunmi-xuan@2x.png",@"wode-xuan@2x.png"];
    NSArray * titleArray = @[@"推荐",@"寻觅",@"我的"];
    for (NSInteger i = 0; i<imageName.count; i++) {
        UITabBarItem * item = [tbc.tabBar.items objectAtIndex:i];
        item.image = [[UIImage imageNamed:imageName[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.title = titleArray[i];
        item.selectedImage = [[UIImage imageNamed:selectImageName[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    self.window.rootViewController = tbc;
    
    
    
    
    
    
    
    
    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}
#pragma mark  推送
//
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@"注册成功：%@",deviceToken);
//    成功拿到设备ID后 送给自己的服务器
    
}
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"注册失败:%@",error);
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"通知" message:@"我的消息" delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil];
    [alert show];
    NSLog(@"%@",userInfo);
}

#pragma mark 数据统计方法
-(void)UMengStatisticalData
{
    //reportPolicy:发送策略，只在模拟器和DEBUG模式下生效，真机release模式会自动改成BATCH。
    //channelId:应用推广渠道
    [MobClick startWithAppkey:UMAppKey reportPolicy:BATCH channelId:@"HelloCoffeeMan"];
    //设置APP版本号
    [MobClick setAppVersion:XcodeAppVersion];
   
    //设置打印sdk的log信息
//    发布时改NO
    [MobClick setLogEnabled:YES];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
