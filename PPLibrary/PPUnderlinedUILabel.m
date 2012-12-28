//
//  UnderlinedUILabel.m
//  PPLibrary
//
//  Created by homepagesystem on 8/6/12.
//
//

#import "PPUnderlinedUILabel.h"

@implementation PPUnderlinedUILabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx, 1.0f, 1.0f, 1.0f, 1.0f); // RGBA
    CGContextSetLineWidth(ctx, 1.0f);
    
    CGContextMoveToPoint(ctx, 0, self.bounds.size.height - 5);
    CGContextAddLineToPoint(ctx, self.bounds.size.width, self.bounds.size.height - 5);
    
    CGContextStrokePath(ctx);
    
    [super drawRect:rect];
}

@end
