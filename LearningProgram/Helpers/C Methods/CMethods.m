//
//  CMethods.m
//  TaxiTest
//
//  Created by Xiaohui Guo  on 13-3-13.
//  Copyright (c) 2013年 FJKJ. All rights reserved.
//

#import "CMethods.h"

@implementation CMethods

CGFloat getFontSize(CGFloat size)
{
    CGFloat otherSize = size *ScreenWidth/375.0;
    if (otherSize == 0) {
        return size;
    }
    return otherSize;
}

CGFloat getWidth(CGFloat width)
{
    CGFloat otherWidth = width *ScreenWidth/375.0;
    return otherWidth;
}

CGFloat getHeight(CGFloat height)
{
    CGFloat otherHeight = height *ScreenHeight/667.0;
    return otherHeight;
}

CGFloat getScaleFontSize(CGFloat size)
{
    CGFloat otherSize = size *([UIScreen mainScreen].scale -2) *ScreenWidth/375.0;
    if (otherSize == 0) {
        return size;
    }
    return otherSize;
}

CGFloat getScaleWidth(CGFloat width)
{
    CGFloat otherWidth = width * ([UIScreen mainScreen].scale -2) *ScreenWidth/375.0;
    if (otherWidth == 0) {
        return width;
    }
    return otherWidth;
}

CGFloat getScaleHeight(CGFloat height)
{
    CGFloat otherHeight = height * ([UIScreen mainScreen].scale -2) *ScreenHeight/667.0;
    if (otherHeight == 0) {
        return height;
    }
    return otherHeight;
}

CGFloat fontSizeFromPX(CGFloat pxSize){
    return (pxSize / 96.0) * 72 * 0.65;
}

@end
