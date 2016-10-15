//
//  TestView.h
//  PaintCodeDemo
//
//  Created by Kael on 2016/10/12.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DrawView.h"

@interface TestView : UIView

@property (nonatomic,strong) UIColor *lineColor;



@property (nonatomic,assign) CGSize originalSize;

@property (nonatomic,assign) CGSize arrowSize;

@property (nonatomic,assign) CGFloat originalAngle;

@property (nonatomic,assign) CGFloat arrowUpAngle;

@property (nonatomic,assign) CGFloat arrowDownAngle;

@property (nonatomic,assign) CGPoint originalUpPoint;

@property (nonatomic,assign) CGPoint arrowUpPoint;

@property (nonatomic,assign) CGPoint originalDownPoint;

@property (nonatomic,assign) CGPoint arrowDownPoint;


    //0-1
@property (nonatomic,assign) CGFloat progressValue;


@property (nonatomic,assign) CGFloat upAngle;
@property (nonatomic,assign) CGFloat downAngle;

@property (nonatomic,assign) CGSize upSize;
@property (nonatomic,assign) CGSize downSize;

@property (nonatomic,assign) CGPoint upPoint;
@property (nonatomic,assign) CGPoint downPoint;


@property (nonatomic,strong) UIBezierPath *upLine;

@property (nonatomic,strong) UIBezierPath *midLine;

@property (nonatomic,strong) UIBezierPath *downLine;


@property (nonatomic,strong) CAShapeLayer *upLayer;

@property (nonatomic,strong) CAShapeLayer *midLayer;

@property (nonatomic,strong) CAShapeLayer *downLayer;







@end
