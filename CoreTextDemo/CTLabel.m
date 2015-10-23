//
//  CTLabel.m
//  CoreTextDemo
//
//  Created by Zhouboli on 15/10/23.
//  Copyright © 2015年 Boris. All rights reserved.
//

#import "CTLabel.h"
#import <CoreText/CoreText.h>

@implementation CTLabel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor redColor]];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    //1 得到当前绘制画布的上下文，用于后续将内容绘制在画布上。
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //2 将坐标系上下翻转。对于底层的绘制引擎来说，屏幕的左下角是（0, 0）坐标。而对于上层的 UIKit 来说，左上角是 (0, 0) 坐标。所以我们为了之后的坐标系描述按 UIKit 来做，所以先在这里做一个坐标系的上下翻转操作。翻转之后，底层和上层的 (0, 0) 坐标就是重合的了。
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    //3 创建绘制的区域，CoreText 本身支持各种文字排版的区域，我们这里简单地将 UIView 的整个界面作为排版的区域。
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    //4
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:_text attributes:@{(NSString *)kCTForegroundColorAttributeName: (__bridge id)[UIColor whiteColor].CGColor}];
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attrString);
    CTFrameRef frame =  CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attrString.length), path, NULL);
    
    //5
    CTFrameDraw(frame, context);
    
    //6
    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
}

@end
