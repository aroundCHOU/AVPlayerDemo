//
//  PlayView.m
//  AVPlayerDemo
//
//  Created by ZhouWei on 16/1/20.
//  Copyright © 2016年 周围. All rights reserved.
//

#import "PlayView.h"
#import "PlayControl.h"
#import <Masonry.h>

@implementation PlayView

#pragma mark --- 给播放器设置url，以及播放的方法
-(void)setAudioWithName:(NSString *)name
{
    //创建AVPlayer
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
    self.player = [AVPlayer playerWithPlayerItem:item];
    
    //如果要播放视频，AVPlayer需要加载到AVPlayerLayer上面
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    //设置播放界面大小
    CGRect frameRect = self.bounds;
    frameRect.size.height = self.bounds.size.height - 50;    //下方空出50
    layer.frame = frameRect;
    //设置player的适应方式
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    [self.layer addSublayer:layer];
    
    if (_control == nil) {
        self.control = [[[NSBundle mainBundle] loadNibNamed:@"PlayControl" owner:self options:nil] firstObject];
        
        
        //masonry 设置约束的前提（尤其是子视图需要依赖父视图的时候），必须在设置约束之前，加到父视图上面
        [self addSubview:self.control];
        [self.control mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.mas_bottom);
            make.height.mas_equalTo(50);
        }];
    }
}

@end
