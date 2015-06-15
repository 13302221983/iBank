//
//  bankWindow.m
//  iBank
//
//  Created by McKee on 15/6/13.
//  Copyright (c) 2015年 McKee. All rights reserved.
//

#import "bankWindow.h"

@implementation bankWindow

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews
{
    NSLog(@"========");
    [super layoutSubviews];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"-----------------------");
    return [self hitTest:point withEvent:event];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"-----*****___");
    [super touchesBegan:touches withEvent:event];
}


@end
