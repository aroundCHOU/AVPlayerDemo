//
//  PlayView.h
//  AVPlayerDemo
//
//  Created by ZhouWei on 16/1/20.
//  Copyright © 2016年 周围. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@class PlayControl;

@interface PlayView : UIView

/**
 *  播放视频的player
 */
@property (nonatomic,strong)AVPlayer *player;

/**
 *  控制条
 *
 *  @return
 */
@property (nonatomic,strong)PlayControl *control;

/**
 *  给播放器设置url,以及播放的方法
 */
- (void)setAudioWithName:(NSString *)name;

@end
