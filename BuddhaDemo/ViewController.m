//
//  ViewController.m
//  BuddhaDemo
//
//  Created by 刘家琪 on 2018/5/20.
//  Copyright © 2018年 刘家琪. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // show images
    UIImage *image = [UIImage imageNamed:@"1" ];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    
    CGRect cr=[[UIScreen mainScreen] bounds];   //获取屏幕
    
    imageView.frame = CGRectMake(0, 0, cr.size.width, cr.size.height);  //全屏显示图片
    
    [imageView setContentMode:UIViewContentModeScaleToFill];  //拉伸模式
    
    [imageView setClipsToBounds:YES];
    
    [self.view addSubview:imageView];  //显示
    
    [self.view sendSubviewToBack:imageView];  //背景设置
    
    // Set Up the Stream
//    streamMac=[TGStreamForMac sharedInstance];
//    streamMac.delegate=self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
