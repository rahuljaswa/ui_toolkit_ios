//
//  UIColor+RJAdditions.m
//  FitnessClasses
//
//  Created by Rahul Jaswa on 7/20/15.
//  Copyright (c) 2015 Rahul Jaswa. All rights reserved.
//

#import "UIColor+RJAdditions.h"


@implementation UIColor (RJAdditions)

#pragma mark - Private Class Methods

+ (UIColor *)colorForHex:(long)colorInt {
    unsigned char r, g, b;
    b = colorInt & 0xFF;
    g = (colorInt >> 8) & 0xFF;
    r = (colorInt >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1];
}

+ (CGFloat)floatForDistance:(CGFloat)distance betweenPoint:(CGFloat)point andPoint:(CGFloat)otherPoint {
    return (point + (distance*(otherPoint-point)));
}

#pragma mark - Public Instance Methods

+ (UIColor *)colorForDistance:(CGFloat)distance betweenColor:(UIColor *)color andColor:(UIColor *)otherColor {
    CGFloat red, green, blue, alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    CGFloat otherRed, otherGreen, otherBlue, otherAlpha;
    [otherColor getRed:&otherRed green:&otherGreen blue:&otherBlue alpha:&otherAlpha];
    
    return [UIColor colorWithRed:[self floatForDistance:distance betweenPoint:red andPoint:otherRed]
                           green:[self floatForDistance:distance betweenPoint:green andPoint:otherGreen]
                            blue:[self floatForDistance:distance betweenPoint:blue andPoint:otherBlue]
                           alpha:[self floatForDistance:distance betweenPoint:alpha andPoint:alpha]];
}

+ (UIColor *)colorForHexString:(NSString *)hexString {
    const char *cHexString = [hexString cStringUsingEncoding:NSASCIIStringEncoding];
    long hexInt = strtol(cHexString+1, NULL, 16);
    return [UIColor colorForHex:hexInt];
}

@end
