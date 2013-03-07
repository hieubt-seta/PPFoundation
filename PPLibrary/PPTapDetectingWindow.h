//
//  TapDetectingWindow.h
//  PPLibrary
//
//  Created by Hieu Bui on 10/18/12.
//  Copyright (c) 2012 SETACINQ Vietnam. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PPTapDetectingWindowDelegate
- (void)userDidTapWebView:(id)tapPoint;
@end
@interface PPTapDetectingWindow : UIWindow {
    UIView *viewToObserve;
    id <PPTapDetectingWindowDelegate> controllerThatObserves;
}
@property (nonatomic, retain) UIView *viewToObserve;
@property (nonatomic, assign) id <PPTapDetectingWindowDelegate> controllerThatObserves;
@end