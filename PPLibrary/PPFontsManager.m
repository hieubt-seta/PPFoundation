//
//  PPFontsManager.m
//  PPLibrary
//
//  Created by Hieu Bui on 12/29/12.
//  Copyright (c) 2012 PIPU. All rights reserved.
//

#import "PPFontsManager.h"

@implementation PPFontsManager

+ (void)printAllSystemFonts
{
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames ){
        printf( "Family: %s \n", [familyName UTF8String] );
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames ){
            printf( "\tFont: %s \n", [fontName UTF8String] );
        }
    }
}

@end
