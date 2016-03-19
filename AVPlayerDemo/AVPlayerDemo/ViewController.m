//
//  ViewController.m
//  AVPlayerDemo
//
//  Created by ZhouWei on 16/1/20.
//  Copyright © 2016年 周围. All rights reserved.
//

#import "ViewController.h"
#import "PlayView.h"
#import "PlayControl.h"

@interface ViewController ()

/**
 *
 */
@property (nonatomic,strong)PlayView *myPlayerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myPlayerView = [[PlayView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 400)];
    self.myPlayerView.backgroundColor = [UIColor cyanColor];
    [self.myPlayerView setAudioWithName:@"abc"];
    [self.view addSubview:self.myPlayerView];
    
    
    /* 播放按钮的点击 */
    [self.myPlayerView.control.playAndStopButton addTarget:self action:@selector(playAndStopButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //音量的控制
    self.myPlayerView.player.volume = 0.5;
    [self.myPlayerView.control.volumeSlider addTarget:self action:@selector(volumeSliderAction:) forControlEvents:UIControlEventValueChanged];
    //进度的控制
    [self.myPlayerView.control.progressSlider addTarget:self action:@selector(progressSliderAction:) forControlEvents:UIControlEventValueChanged];
}

-(void)progressSliderAction:(UISlider *)sender
{
    //获取视频的总时间
    CGFloat seconds = self.myPlayerView.player.currentItem.duration.value * 1.0f /self.myPlayerView.player.currentItem.duration.timescale;
    //计算滑动滑竿以后应该播放的时间
    seconds = seconds * sender.value;
    //设置播放器播放的具体位置
    [self.myPlayerView.player pause];
    [self.myPlayerView.player seekToTime:CMTimeMakeWithSeconds(seconds, self.myPlayerView.player.currentTime.timescale) completionHandler:^(BOOL finished) {
        //继续播放
        [self.myPlayerView.player play];
    }];
}

-(void)volumeSliderAction:(UISlider *)sender
{
    self.myPlayerView.player.volume = sender.value;
}

- (void)playAndStopButtonDidClicked:(UIButton *)sender
{
    if (!sender.isSelected) {
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
        [self.myPlayerView.player play];
    }else{
        [sender setTitle:@"播放" forState:UIControlStateNormal];
        [self.myPlayerView.player pause];
    }
    
    sender.selected = !sender.selected;
    
}
@end
