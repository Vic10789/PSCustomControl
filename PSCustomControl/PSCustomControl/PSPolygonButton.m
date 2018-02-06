//
//  PSPolygonButton.m
//  PSCustomControl
//
//  Created by Vic on 2018/2/6.
//  Copyright © 2018年 Vic. All rights reserved.
//

#import "PSPolygonButton.h"

@implementation PSPolygonButton

- (void)drawLayer {
    self.tapPath = [[UIBezierPath alloc] init];
    self.tapPath.lineWidth = 1;
    [self.tapPath moveToPoint:[self.pointPathArray[0] CGPointValue]];
    [self.tapPath addLineToPoint:[self.pointPathArray[1] CGPointValue]];
    [self.tapPath addLineToPoint:[self.pointPathArray[2] CGPointValue]];
    [self.tapPath addLineToPoint:[self.pointPathArray[3] CGPointValue]];
    [self.tapPath addLineToPoint:[self.pointPathArray[0] CGPointValue]];
    
    self.redrawLayer = [CAShapeLayer layer];
    self.redrawLayer.path = [self.tapPath CGPath];
    self.redrawLayer.fillColor = self.fillColor.CGColor;
    self.redrawLayer.strokeColor = self.strokeColor.CGColor;
    [self.layer addSublayer:self.redrawLayer];
}

@end
