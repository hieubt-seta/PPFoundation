//
//  GradientView.m
//  bookmebugme
//
//  Created by Hieu Bui on 11/10/11.
//  Copyright 2011 SETA:CINQ Vietnam., Ltd. All rights reserved.
//


#import "PPGradientView.h"

@implementation PPGradientView

@synthesize balloonColorTop, balloonColorBottom;

- (id)initWithFrame:(CGRect)frame {
    if(!(self = [super initWithFrame:frame])) {
        return nil;            
    }
    [self setupCustomInitialisation];
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if(!(self = [super initWithCoder:decoder])){
        return nil;
    }
    [self setupCustomInitialisation];
	return self;
}

- (void)setupCustomInitialisation {
	// Initialization code
	self.balloonColorTop = [UIColor purpleColor];
	self.balloonColorBottom = nil;
	self.alpha = 0.8;
	CALayer *layer = [self layer];
	layer.masksToBounds = YES;
	[layer setCornerRadius:5.0];
	// You can even add a border
	[layer setBorderWidth:0.5];
	[layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
}

- (void)drawRect:(CGRect)rect {
    // Retrieve the graphics context 
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Save the context state 
    CGContextSaveGState(context);

    //if the developer really want a standard fill color
    if (balloonColorTop == balloonColorBottom) {
        self.backgroundColor = balloonColorTop;
    }
    //if we have 2 different colors, we draw a gradient
    else {		
        UIColor *lowerColor = nil;
        //if there is no bottom color set, we get a darker version of the top one
        if (!balloonColorBottom) {
            const CGFloat *components = CGColorGetComponents([balloonColorTop CGColor]);
            lowerColor = [UIColor colorWithRed:components[0]-0.25f green:components[1]-0.25f blue:components[2]-0.25f alpha:components[3]];
        }
        else {
            lowerColor = balloonColorBottom;
        }
        //create a colorspace and linear gradient from the colors
        CFArrayRef colors = (CFArrayRef)[NSArray arrayWithObjects:(id)[balloonColorTop CGColor], (id)[lowerColor CGColor], nil];		
        CGColorSpaceRef myColorspace = CGColorSpaceCreateDeviceRGB();
        CGGradientRef myGradient = CGGradientCreateWithColors(myColorspace, colors, NULL);
        //draw the gradient
        CGContextDrawLinearGradient(context, myGradient, CGPointMake(0.0f,0.0f), CGPointMake(0.0f,self.bounds.size.height), 0);
        CFRelease(myGradient);
        CFRelease(myColorspace);		
    }
    // Set shadow
    CGContextSetShadowWithColor(context,  CGSizeMake(0.0, 1.0), 0.7, [[UIColor blackColor] CGColor]);

	// Restore the context state
	CGContextRestoreGState(context);
}

- (void)dealloc {
	[balloonColorTop release];
	[balloonColorBottom release];	
    [super dealloc];
}

@end
