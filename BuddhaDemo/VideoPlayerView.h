//
//  VideoPlayerView.h
//  Video
//
//  Created by gongwenkai on 2016/12/16.
//  Copyright © 2016年 gongwenkai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
@interface VideoPlayerView : UIView


- (instancetype)initWithFrame:(CGRect)frame andPath:(NSString*)path ;

- (void)resetFrame:(CGSize)size;
@end
