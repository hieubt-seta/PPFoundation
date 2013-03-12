//
//  TapDetectingWindow.m
//  medtalk
//
//  Created by Hieu Bui on 10/18/12.
//  Copyright (c) 2012 SETACINQ Vietnam. All rights reserved.
//

#import "PPTapDetectingWindow.h"
@implementation PPTapDetectingWindow
@synthesize viewToObserve;
@synthesize controllerThatObserves;
- (id)initWithViewToObserver:(UIView *)view andDelegate:(id)delegate {
    if(self == [super init]) {
        self.viewToObserve = view;
        self.controllerThatObserves = delegate;
    }
    return self;
}
- (void)dealloc {
    [viewToObserve release];
    [super dealloc];
}
- (void)forwardTap:(id)touch {
    [controllerThatObserves userDidTapWebView:touch];
}
- (void)sendEvent:(UIEvent *)event {
    [super sendEvent:event];
    if (viewToObserve == nil || controllerThatObserves == nil)
        return;
    NSSet *touches = [event allTouches];
    if (touches.count != 1)
        return;
    UITouch *touch = touches.anyObject;
    if (touch.phase != UITouchPhaseEnded)
        return;
    if ([touch.view isDescendantOfView:viewToObserve] == NO)
        return;
    CGPoint tapPoint = [touch locationInView:viewToObserve];
    NSLog(@"TapPoint = %f, %f", tapPoint.x, tapPoint.y);
    NSArray *pointArray = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%f", tapPoint.x],
                           [NSString stringWithFormat:@"%f", tapPoint.y], nil];
    if (touch.tapCount == 1) {
        [self performSelector:@selector(forwardTap:) withObject:pointArray afterDelay:0.5];
    }
    else if (touch.tapCount > 1) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(forwardTap:) object:pointArray];
    }
}
@end

