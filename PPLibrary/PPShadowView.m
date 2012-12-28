//
//  ShadowView.m
//  Social
//
//  Created by Hieu Bui on 6/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PPShadowView.h"
#import <QuartzCore/QuartzCore.h>

@implementation PPShadowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    self.layer.masksToBounds = NO;
    self.layer.shadowOffset = CGSizeMake(5, 5);
    self.layer.shadowOpacity = 0.6;
}

@end
