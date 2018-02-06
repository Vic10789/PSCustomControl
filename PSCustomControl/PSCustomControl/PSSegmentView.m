//
//  PSSegmentView.m
//  PSCustomControl
//
//  Created by Vic on 2018/2/6.
//  Copyright © 2018年 Vic. All rights reserved.
//

#import "PSSegmentView.h"
#import "PSPolygonButton.h"

@interface PSSegmentView ()
{
    NSMutableArray *textDataArray;
    CGFloat slopeLengthF;
    UIColor *selectShowColor;
}
@end

@implementation PSSegmentView

- (instancetype)initWithFrame:(CGRect)frame textArray:(NSArray *)textArray slopeLength:(CGFloat)slopeLength selectColor:(UIColor *)selectColor {
    self = [super initWithFrame:frame];
    if (self) {
        textDataArray = [NSMutableArray arrayWithArray:textArray];
        slopeLengthF = slopeLength;
        selectShowColor = selectColor;
        [self initUI];
    }
    return self;
}
- (void)initUI {
    CGFloat itemWidth = self.frame.size.width/textDataArray.count;
    CGFloat itemHeight = self.frame.size.height;
    
    [textDataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        PSPolygonButton *button = [PSPolygonButton buttonWithType:UIButtonTypeCustom];
        button.strokeColor = selectShowColor;
        [button setTitle:textDataArray[idx] forState:UIControlStateNormal];
        button.tag = idx+100;
        if (idx == 0) {
            button.frame = CGRectMake(0, 0, itemWidth+slopeLengthF, itemHeight);
            button.fillColor = selectShowColor;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.pointPathArray = @[[NSValue valueWithCGPoint:CGPointMake(0, 0)], [NSValue valueWithCGPoint:CGPointMake(itemWidth+slopeLengthF, 0)], [NSValue valueWithCGPoint:CGPointMake(itemWidth, itemHeight)], [NSValue valueWithCGPoint:CGPointMake(0, itemHeight)]];
        } else if (idx == (textDataArray.count-1)) {
            button.frame = CGRectMake(self.frame.size.width-itemWidth, 0, itemWidth+slopeLengthF, itemHeight);
            button.fillColor = [UIColor whiteColor];
            [button setTitleColor:selectShowColor forState:UIControlStateNormal];
            button.pointPathArray = @[[NSValue valueWithCGPoint:CGPointMake(slopeLengthF, 0)], [NSValue valueWithCGPoint:CGPointMake(itemWidth+slopeLengthF, 0)], [NSValue valueWithCGPoint:CGPointMake(itemWidth+slopeLengthF, itemHeight)], [NSValue valueWithCGPoint:CGPointMake(0, itemHeight)]];
        } else {
            button.frame = CGRectMake(itemWidth*idx, 0, itemWidth+slopeLengthF, itemHeight);
            button.fillColor = [UIColor whiteColor];
            [button setTitleColor:selectShowColor forState:UIControlStateNormal];
            button.pointPathArray = @[[NSValue valueWithCGPoint:CGPointMake(slopeLengthF, 0)], [NSValue valueWithCGPoint:CGPointMake(itemWidth+slopeLengthF*2, 0)], [NSValue valueWithCGPoint:CGPointMake(itemWidth+slopeLengthF, itemHeight)], [NSValue valueWithCGPoint:CGPointMake(0, itemHeight)]];
        }
        [button drawLayer];
        [button addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }];
}
- (void)buttonTap:(PSPolygonButton *)button {
    for (NSInteger i = 0; i < textDataArray.count; i++) {
        PSPolygonButton *polygonButton = (PSPolygonButton *)[self viewWithTag:i+100];
        if (i == (button.tag-100)) {
            polygonButton.redrawLayer.fillColor = selectShowColor.CGColor;
            [polygonButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        } else {
            polygonButton.redrawLayer.fillColor = [UIColor whiteColor].CGColor;
            [polygonButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }
    }
}

@end
