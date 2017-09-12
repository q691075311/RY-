//
//  RYNavBar.m
//  RYFrame
//
//  Created by taobo on 2017/9/12.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "RYNavBar.h"

@interface RYNavBar ()

@end
@implementation RYNavBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        RYNavBar * ryView = [[[NSBundle mainBundle] loadNibNamed:@"RYNavBar" owner:self options:nil] lastObject];
        ryView.frame = frame;
        ryView.autoresizingMask = self.autoresizingMask;
        ryView.alpha = self.alpha;
        ryView.hidden = self.hidden;
    }
    return self;
}


@end
