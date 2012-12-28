//
//  GradientView.h
//  bookmebugme
//
//  Created by Hieu Bui on 11/10/11.
//  Copyright 2011 SETA:CINQ Vietnam., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface PPGradientView : UIView {
	UIColor *balloonColorTop;
	UIColor *balloonColorBottom;
}

@property (nonatomic, retain) UIColor *balloonColorTop;
@property (nonatomic, retain) UIColor *balloonColorBottom;

- (void)setupCustomInitialisation;

@end
