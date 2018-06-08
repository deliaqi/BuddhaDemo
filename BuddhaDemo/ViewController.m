//
//  ViewController.m
//  BuddhaDemo
//
//  Created by 刘家琪 on 2018/5/20.
//  Copyright © 2018年 刘家琪. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
//#import <time.h>

@interface ViewController ()
{
//    AVPlayerViewController *moviePlayer;
}

//@property (strong,nonatomic) AVPlayerViewController *moviePlayer;
//@property (strong,nonatomic) AVPlayer *player;
//@property (strong,nonatomic) AVPlayerItem *item;
//@property(nonatomic,strong)MPMoviePlayerController * moviePlayer;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // show images
//    UIImage *image = [UIImage imageNamed:@"1" ];
//
//    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
//
//    CGRect cr=[[UIScreen mainScreen] bounds];   //获取屏幕
//
//    imageView.frame = CGRectMake(0, 0, cr.size.width, cr.size.height);  //全屏显示图片
//
//    [imageView setContentMode:UIViewContentModeScaleToFill];  //拉伸模式
//
//    [imageView setClipsToBounds:YES];
//
//    [self.view addSubview:imageView];  //显示
//
//    [self.view sendSubviewToBack:imageView];  //背景设置
    
    // play videos
    [self playVideo:1];
    
    //NSURL *theurl=[NSURL fileURLWithPath:thePath];
    
    
    // Set Up the Stream
//    streamMac=[TGStreamForMac sharedInstance];
//    streamMac.delegate=self;
}

- (void)playVideo: (NSInteger)index
{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    //    moviePlayer = [[MPMoviePlayerViewController
    //                    alloc]initWithContentURL:[NSURL fileURLWithPath:path]];
    //    [self presentModalViewController:moviePlayer animated:NO];
    AVPlayerViewController *moviePlayer = [[AVPlayerViewController alloc] init];
    moviePlayer.player = [[AVPlayer alloc] initWithURL:url];
    moviePlayer.view.frame = self.view.frame;
    [self addChildViewController:moviePlayer];//这句不写貌似AVPlayerViewController也不会挂掉
    [self.view addSubview:moviePlayer.view];
    
    [moviePlayer.player play];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
