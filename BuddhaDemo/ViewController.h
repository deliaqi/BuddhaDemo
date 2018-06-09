//
//  ViewController.h
//  BuddhaDemo
//
//  Created by 刘家琪 on 2018/5/20.
//  Copyright © 2018年 刘家琪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

#import "TGStream.h"
#import "TGStreamDelegate.h"
#import "TGStreamEnum.h"
#import "TGSEEGPower.h"

//#import <MediaPlayer/MediaPlayer.h>



@interface ViewController : UIViewController
{
//    MPMoviePlayerViewController *moviePlayer;
//    AVPlayerViewController *moviePlayer;
    TGStream *TGStreamInstance;
    NSString *TextViewString;
}
//-(IBAction)playVideo:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *clearLog;
- (IBAction)logClear:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *recordEnd;
@property (weak, nonatomic) IBOutlet UIButton *recordBegin;
@property (weak, nonatomic) IBOutlet UIButton *InitFile;
@property (weak, nonatomic) IBOutlet UIButton *InitBT;
@property (weak, nonatomic) IBOutlet UIButton *TearDown;
@property (weak, nonatomic) IBOutlet UITextView *TextView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

- (IBAction)recordBegin:(id)sender;
- (IBAction)recordEnd:(id)sender;
- (IBAction)InitFile:(id)sender;
- (IBAction)InitBT:(id)sender;
- (IBAction)TearDown:(id)sender;

@end

