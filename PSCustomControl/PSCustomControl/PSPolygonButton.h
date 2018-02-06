//
//  PSPolygonButton.h
//  PSCustomControl
//
//  Created by Vic on 2018/2/6.
//  Copyright © 2018年 Vic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSPolygonButton : UIButton

@property (nonatomic, strong) NSArray *pointPathArray;
@property (nonatomic, strong) UIBezierPath *tapPath;
@property (nonatomic, strong) CAShapeLayer *redrawLayer;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) UIColor *strokeColor;

- (void)drawLayer;

@end
