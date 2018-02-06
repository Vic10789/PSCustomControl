//
//  ViewController.m
//  PSCustomControl
//
//  Created by Vic on 2018/2/6.
//  Copyright © 2018年 Vic. All rights reserved.
//

#import "ViewController.h"
#import "PSPolygonButton.h"
#import "PSSegmentView.h"

@interface ViewController ()
{
    PSPolygonButton *specialPolygonButton;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self polygonButton];
    
    [self segmentView];
    
    [self specialPolygonButton];
}
- (void)specialPolygonButton {
    specialPolygonButton = [PSPolygonButton buttonWithType:UIButtonTypeCustom];
    specialPolygonButton.backgroundColor = [UIColor greenColor];
    specialPolygonButton.frame = CGRectMake(30, 350, 230, 80);
    [specialPolygonButton setTitle:@"SpecialPolygon" forState:UIControlStateNormal];
    [specialPolygonButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    specialPolygonButton.fillColor = [UIColor yellowColor];
    specialPolygonButton.pointPathArray = @[[NSValue valueWithCGPoint:CGPointMake(30, 0)], [NSValue valueWithCGPoint:CGPointMake(230, 0)], [NSValue valueWithCGPoint:CGPointMake(200, 80)], [NSValue valueWithCGPoint:CGPointMake(0, 80)]];
    [specialPolygonButton drawLayer];
    UITapGestureRecognizer *buttonTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapButtonTap:)];
    [specialPolygonButton addGestureRecognizer:buttonTap];
    [self.view addSubview:specialPolygonButton];
}
- (void)tapButtonTap:(UITapGestureRecognizer *)tapGestrue  {
    CGPoint tapPoint = [tapGestrue locationInView:tapGestrue.view];
    if ([specialPolygonButton.tapPath containsPoint:tapPoint]) {
        NSLog(@"区域内可被选中");
    }
}
- (void)segmentView {
    PSSegmentView *segmentView2 = [[PSSegmentView alloc] initWithFrame:CGRectMake(20, 160, self.view.frame.size.width-40, 30) textArray:@[@"one", @"two"] slopeLength:10 selectColor:[UIColor blueColor]];
    segmentView2.layer.borderColor = [UIColor blueColor].CGColor;
    segmentView2.layer.borderWidth = 0.5;
    segmentView2.layer.cornerRadius = 3;
    segmentView2.layer.masksToBounds = YES;
    [self.view addSubview:segmentView2];
    
    PSSegmentView *segmentView3 = [[PSSegmentView alloc] initWithFrame:CGRectMake(20, 220, self.view.frame.size.width-40, 30) textArray:@[@"one", @"two", @"three"] slopeLength:10 selectColor:[UIColor blueColor]];
    segmentView3.layer.borderColor = [UIColor blueColor].CGColor;
    segmentView3.layer.borderWidth = 0.5;
    segmentView3.layer.cornerRadius = 3;
    segmentView3.layer.masksToBounds = YES;
    [self.view addSubview:segmentView3];
    
    PSSegmentView *segmentView4 = [[PSSegmentView alloc] initWithFrame:CGRectMake(20, 280, self.view.frame.size.width-40, 30) textArray:@[@"one", @"two", @"three", @"four"] slopeLength:10 selectColor:[UIColor blueColor]];
    segmentView4.layer.borderColor = [UIColor blueColor].CGColor;
    segmentView4.layer.borderWidth = 0.5;
    segmentView4.layer.cornerRadius = 3;
    segmentView4.layer.masksToBounds = YES;
    [self.view addSubview:segmentView4];
}
- (void)polygonButton {
    PSPolygonButton *polygonButton = [PSPolygonButton buttonWithType:UIButtonTypeCustom];
    polygonButton.frame = CGRectMake(50, 70, 150, 60);
    [polygonButton setTitle:@"Polygon" forState:UIControlStateNormal];
    [polygonButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    polygonButton.fillColor = [UIColor yellowColor];
    polygonButton.pointPathArray = @[[NSValue valueWithCGPoint:CGPointMake(20, 0)], [NSValue valueWithCGPoint:CGPointMake(150, 0)], [NSValue valueWithCGPoint:CGPointMake(130, 60)], [NSValue valueWithCGPoint:CGPointMake(0, 60)]];
    [polygonButton drawLayer];
    [polygonButton addTarget:self action:@selector(polygonButtonTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:polygonButton];
}
- (void)polygonButtonTap {
    NSLog(@"Tapping");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
