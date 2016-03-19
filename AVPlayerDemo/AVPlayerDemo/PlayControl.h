//
//  PlayControl.h
//  AVPlayerDemo
//
//  Created by ZhouWei on 16/1/20.
//  Copyright © 2016年 周围. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayControl : UIView

@property (strong, nonatomic) IBOutlet UIButton *playAndStopButton;
@property (strong, nonatomic) IBOutlet UISlider *progressSlider;
@property (strong, nonatomic) IBOutlet UISlider *volumeSlider;

@end
