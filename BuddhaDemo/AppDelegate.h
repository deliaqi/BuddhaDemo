//
//  AppDelegate.h
//  BuddhaDemo
//
//  Created by 刘家琪 on 2018/5/20.
//  Copyright © 2018年 刘家琪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : NSObject <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (NSString *)searchForDevice:(NSString *)deviceName;


@end

