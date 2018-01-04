//
//  AppDelegate.m
//  toone_lyWeb
//
//  Created by 上海同望 on 2018/1/2.
//  Copyright © 2018年 st. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path1 = [pathArray objectAtIndex:0];
    NSString *myPath = [path1 stringByAppendingPathComponent:@"xiaoxi.plist"];
    //根据之前保存的容器类型读取数据
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:myPath];
    if (dataDictionary == nil) {
       [self loadPlist];
    }
    return YES;
}

-(void)loadPlist {
    NSString *filePatch = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"xiaoxi.plist"];
    //    //写入数据到plist文件
    NSMutableDictionary *dic0 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"质量安全隐患排查APP",@"banhezhanminchen",@"http://192.168.10.202:10080/finddanger/login",@"departid",@"隐患排查.png",@"icon",nil];
    NSMutableDictionary *dic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"质量安全隐患分析系统",@"banhezhanminchen",@"http://121.40.111.204:18080/ny1/login",@"departid",@"隐患分析.png",@"icon",nil];
    NSMutableDictionary *dic2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"重要工点视频监控系统",@"banhezhanminchen",@"http://119.135.189.2/doc/page/login.asp?",@"departid",@"视频监控.png",@"icon",nil];
    NSMutableDictionary *dic3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"劳务工考勤系统",@"banhezhanminchen",@"http://119.135.189.2:8080/accounts/login/?next=/data/index/",@"departid",@"考勤.png",@"icon",nil];
    NSMutableDictionary *dic4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"BIM系统",@"banhezhanminchen",@"http://117.40.181.125:801/admin/login.aspx",@"departid",@"BIM.png",@"icon",nil];
    NSMutableDictionary *dic5 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"智能张拉压浆监控系统",@"banhezhanminchen",@"http://115.28.52.169:88/ADMIN/login.aspx",@"departid",@"张拉压浆.png",@"icon",nil];
    NSMutableDictionary *dic6 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"沥青拌合站数据同步系统",@"banhezhanminchen",@"http://112.124.12.254:8082/lygsmss/login.jsp",@"departid",@"沥青.png",@"icon",nil];
    NSMutableDictionary *dic7 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"中铁四局微课堂",@"banhezhanminchen",@"http://tp.ctce.com.cn/jzsstms_common/page/DoorPage/Loginlone.aspx",@"departid",@"微课堂.png",@"icon",nil];
    NSMutableDictionary *dic8 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"我添加的新内容",@"banhezhanminchen",@"http://www.jd.com",@"departid",@"微课堂.png",@"icon",nil];
        //将上面2个小字典保存到大字典里面
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
    [dataDic setObject:dic0 forKey:@"num0"];
    [dataDic setObject:dic1 forKey:@"num1"];
    [dataDic setObject:dic2 forKey:@"num2"];
    [dataDic setObject:dic3 forKey:@"num3"];
    [dataDic setObject:dic4 forKey:@"num4"];
    [dataDic setObject:dic5 forKey:@"num5"];
    [dataDic setObject:dic6 forKey:@"num6"];
    [dataDic setObject:dic7 forKey:@"num7"];
    [dataDic setObject:dic8 forKey:@"num8"];
    
    [dataDic writeToFile:filePatch atomically:YES];        //读取plist文件的内容
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
//        NSLog(@"---plist一开始保存时候的内容---%@",dataDictionary);
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
