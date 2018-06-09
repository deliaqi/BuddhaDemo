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
#import "VideoPlayerView.h"
//#import <time.h>

@interface ViewController ()
{
//    AVPlayerViewController *moviePlayer;
}
@property (nonatomic,strong) VideoPlayerView *videoView;
//@property (strong,nonatomic) AVPlayerViewController *moviePlayer;
//@property (strong,nonatomic) AVPlayer *player;
//@property (strong,nonatomic) AVPlayerItem *item;
//@property(nonatomic,strong)MPMoviePlayerController * moviePlayer;

@end

@implementation ViewController

- (VideoPlayerView *)videoView {
    if (!_videoView) {
        //        NSString *p = [[NSBundle mainBundle] pathForResource:@"123" ofType:@"mp4"];
        //        _videoView = [[VideoPlayerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 350) andPath:p];
        NSString *path=[[NSBundle mainBundle] pathForResource:@"1" ofType:@"mov"];
//        NSURL *url = [NSURL fileURLWithPath:path];
        
//        NSString *path = @"http://v.tourzj.gov.cn/slyj/zww/SPW%20WAP/E3zj20160512ZHEJIANGWENHUAMEISHILVYOUJIEDENGLUXIANGGANGwap.mp4";
        _videoView = [[VideoPlayerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 700) andPath:path];
        
        
    }
    return _videoView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.videoView];
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
//    [self playVideo:1];
    
    //NSURL *theurl=[NSURL fileURLWithPath:thePath];
    
    
    // Set Up the Stream
//    streamMac=[TGStreamForMac sharedInstance];
//    streamMac.delegate=self;
    
    NSString *devicePort = [AppDelegate searchForDevice:@"TGAM-Port"];
    NSLog(@"devicePort: %@", devicePort);
    
    //tty.BrainLink-SerialPort
    //-/dev/tty.MindWaveMobile-DevA    --- /dev/tty.BrainLink-SerialPort
//    TGStreamInstance=[TGStream sharedInstance:devicePort];
    
    
    TGStreamInstance=[TGStream sharedInstance];
    TGStreamInstance.delegate = self;
    
    [TGStreamInstance enableLog:true];
    
    TextViewString=[NSString stringWithFormat:@"Stream SDK Log \n\nStream Version: %@\n\n",[TGStreamInstance getVersion]];
    _TextView.font=[UIFont fontWithName:@"Optima" size:14];
    _TextView.text=TextViewString;
}

- (void)playVideo: (NSInteger)index
{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    AVPlayerViewController *moviePlayer = [[AVPlayerViewController alloc] init];
    moviePlayer.player = [[AVPlayer alloc] initWithURL:url];
    moviePlayer.videoGravity = AVLayerVideoGravityResize;
    moviePlayer.view.frame = self.view.frame;
    [self addChildViewController:moviePlayer];//这句不写貌似AVPlayerViewController也不会挂掉
    [self.view addSubview:moviePlayer.view];
//    [self presentViewController:moviePlayer animated:YES completion:nil];
    [moviePlayer.player play];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    NSLog(@"size = w = %f h = %f -----",size.width,size.height);
    
    [self.videoView resetFrame:size];
}

// Stream SDK
#pragma mark -
-(void) setupButtons{
    
    NSArray *ButtonsArray=[NSArray arrayWithObjects:
                           _recordEnd,
                           _recordBegin,
                           _InitFile,
                           _InitBT,
                           _TearDown,
                           _clearLog,
                           nil];
    
    for (UIButton *button in ButtonsArray)
    {
        button.layer.borderColor=[UIColor blueColor].CGColor;
        button.layer.borderWidth=2;
        button.titleLabel.font=[UIFont fontWithName:@"Optima" size:14];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
}


-(NSString *) NowString{
    
    NSDate *date=[NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *DateString = [dateFormatter stringFromDate:date];
    
    return  DateString;
}


#pragma mark -
-(void) onDataReceived:(NSInteger)datatype data:(int)data obj:(NSObject *)obj deviceType:(DEVICE_TYPE)deviceType{
    
    NSLog(@"dataType:%d data:%d deviceType:%d",(int)datatype,data,(int)deviceType);
    
    if (obj) {
        
        TGSEEGPower *TGSEEGPowerInstance=(TGSEEGPower *)obj;
        NSString *TGSEEGPowerString=[NSString stringWithFormat:@"%@\n EEGPower delta-- %d\n EEGPower theta-- %d\n EEGPower lowAlpha-- %d\n EEGPower highAlpha-- %d\n EEGPower lowBeta-- %d\n EEGPower highAlpha-- %d\n EEGPower lowGamma-- %d\n EEGPower lowGamma-- %d\n ",
                                     [self NowString],
                                     TGSEEGPowerInstance.delta,
                                     TGSEEGPowerInstance.theta,
                                     TGSEEGPowerInstance.lowAlpha,
                                     TGSEEGPowerInstance.highAlpha,
                                     TGSEEGPowerInstance.lowBeta,
                                     TGSEEGPowerInstance.highAlpha,
                                     TGSEEGPowerInstance.lowGamma,
                                     TGSEEGPowerInstance.lowGamma];
        NSLog(@"%@",TGSEEGPowerString);
        
    }
    
}

static NSUInteger checkSum=0;

-(void) onChecksumFail:(Byte *)payload length:(NSUInteger)length checksum:(NSInteger)checksum{
    
    checkSum++;
    NSString *ChecksumFail=[NSString stringWithFormat:@"%@\n Check sum Fail:%lu\n",[self NowString],(unsigned long)checkSum];
    TextViewString=[TextViewString stringByAppendingString:ChecksumFail];
    [self updateTextView];
    
    NSLog(@"CheckSum lentgh:%lu  CheckSum:%lu",(unsigned long)length,(unsigned long)checksum);
}

-(void)onStatesChanged:(ConnectionStates)connectionState{
    
    NSString *connectState;
    
    switch (connectionState) {
            
        case STATE_INIT:
            connectState=@"0 - STATE_INIT";
            break;
            
        case STATE_CONNECTING:
            connectState=@"1 - STATE_CONNECTING";
            break;
            
        case STATE_CONNECTED:
            connectState=@"2 - STATE_CONNECTED";
            break;
            
        case STATE_WORKING:
            connectState=@"3 - STATE_WORKING";
            break;
            
        case STATE_STOPPED:
            connectState=@"4 - STATE_STOPPED";
            break;
            
        case STATE_DISCONNECTED:
            connectState=@"5 - STATE_DISCONNECTED";
            break;
            
        case STATE_COMPLETE:
            connectState=@"6 - STATE_COMPLETE";
            break;
            
        case STATE_RECORDING_START:
            connectState=@"7 - STATE_RECORDING_START";
            break;
            
        case STATE_RECORDING_END:
            connectState=@"8 - STATE_RECORDING_END";
            break;
            
        case STATE_FAILED:
            connectState=@"100 - STATE_FAILED";
            break;
            
        case STATE_ERROR:
            connectState=@"101 - STATE_ERROR";
            break;
            
        default:
            break;
    }
    
    NSString *StatesChanged=[NSString stringWithFormat:@"%@\n Connection States:%@\n",[self NowString],connectState];
    TextViewString=[TextViewString stringByAppendingString:StatesChanged];
    NSLog(@"Connection States:%d",(int)connectionState);
    if (connectionState==101) {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Connection Error" message:@"Please Check If The Device Is Paired" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            [alert show];
            
        });
    }
    
    if (connectionState== 4 || connectionState== 100 || connectionState== 101) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([_indicatorView isAnimating]) {
                [_indicatorView stopAnimating];
                
            }
            
        });
        
    }
    
    
    [self updateTextView];
    
}

-(void) onRecordFail:(RecrodError)flag{
    
    NSString *RecordFail=[NSString stringWithFormat:@"%@\n Record Fail:%d\n",[self NowString],(int)flag];
    TextViewString=[TextViewString stringByAppendingString:RecordFail];
    [self updateTextView];
    
}

-(void) updateTextView{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        _TextView.text=TextViewString;
        
    });
}


//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//}

#pragma mark -
- (IBAction)recordBegin:(id)sender {
    
    [TGStreamInstance setRecordStreamFilePath];
    [TGStreamInstance startRecordRawData];
    
    
}

- (IBAction)recordEnd:(id)sender {
    
    [TGStreamInstance stopRecordRawData];
}

- (IBAction)InitFile:(id)sender {
    checkSum=0;
    
    _InitBT.hidden=YES;
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *filePath = [mainBundle pathForResource:@"sample_data" ofType:@"txt"];
    
    [TGStreamInstance initConnectWithFile:filePath];
    
    [_indicatorView startAnimating];
}

- (IBAction)InitBT:(id)sender {
    
    _InitFile.hidden=YES;
    
    //First of All, you should make sure Neurosky Hardware was paired to iPhone|iPad
    
    [TGStreamInstance initConnectWithAccessorySession];
    [_indicatorView startAnimating];
    
}

- (IBAction)TearDown:(id)sender {
    
    _InitBT.hidden=NO;
    _InitFile.hidden=NO;
    
    [TGStreamInstance tearDownAccessorySession];
    if ([_indicatorView isAnimating]) {
        [_indicatorView stopAnimating];
    }
    
}
- (IBAction)logClear:(id)sender {
    TextViewString=[NSString stringWithFormat:@"Stream SDK Log \n\nStream Version: %@\n\n",[TGStreamInstance getVersion]];
    
    _TextView.text=TextViewString;
}


@end
