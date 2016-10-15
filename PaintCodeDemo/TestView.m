//
//  TestView.m
//  PaintCodeDemo
//
//  Created by Kael on 2016/10/12.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "TestView.h"

@implementation TestView

-(instancetype)init{
    self = [super init];
    if (self) {
        
        _lineColor = nil;
        
        _originalSize = CGSizeMake(32, 3);
        _arrowSize = CGSizeMake(16, 3);
        _originalAngle = 0;
        _arrowUpAngle = 45;
        _arrowDownAngle = -45;
        _originalUpPoint = CGPointMake(9, 10);
        _originalDownPoint = CGPointMake(9, 30);
        _arrowUpPoint = CGPointMake(9.5, 20);
        _arrowDownPoint = CGPointMake(9.5, 19);
    }
    return self;
}

-(void)changeToArrowView{
    
        /*
         
         CATransform3D translation = CATransform3DMakeTranslation(-4, 0, 0);
         topTransform.toValue = [NSValue valueWithCATransform3D: CATransform3DRotate(translation, -0.7853975, 0, 0, 1)];
         bottomTransform.toValue = [NSValue valueWithCATransform3D: CATransform3DRotate(translation, 0.7853975, 0, 0, 1)];
         
         */
    
    CATransform3D translation = CATransform3DMakeRotation(_arrowUpAngle, _arrowUpPoint.x, _arrowUpPoint.y, 1);
    CATransform3D resultScale = CATransform3DScale(translation, 0.5, 1, 1);

    
    
    
//    topTransform.toValue = [NSValue valueWithCATransform3D: CATransform3DRotate(translation, -0.7853975, 0, 0, 1)];
//    bottomTransform.toValue = [NSValue valueWithCATransform3D: CATransform3DRotate(translation, 0.7853975, 0, 0, 1)];
    
    
//    [self setProgressValue:1];
}

-(void)setProgressValue:(CGFloat)progressValue{
    _progressValue = progressValue;
    
    if (progressValue < 0) {
        _progressValue = 0;
    }
        //更换当前属性
    [self changeCurrentProperty];
    
    
        //如果进度值不是初始化赋值则需要更新UI 重新绘制
    if (progressValue >= 0 && progressValue <= 1) {
        [self setNeedsDisplay];
    }
    

}

-(void)changeCurrentProperty{
    _originalSize = CGSizeMake(32, 3);
    _arrowSize = CGSizeMake(16, 3);
    _originalAngle = 0;
    _arrowUpAngle = 45;
    _arrowDownAngle = -45;
    _originalUpPoint = CGPointMake(9, 10);
    _originalDownPoint = CGPointMake(9, 30);
        //mid 9, 20, 32, 3
    _arrowUpPoint = CGPointMake(9.5, 20);
    _arrowDownPoint = CGPointMake(10.5, 20.25);
        //角度
    _upAngle = (_arrowUpAngle - _originalAngle) * _progressValue + _originalAngle;
    _downAngle = (_arrowDownAngle - _originalAngle) * _progressValue + _originalAngle;;
    
    _upAngle = [self getCurrentValueWithOriginalValue:_originalAngle andArrowValue:_arrowUpAngle andProgressValue:_progressValue];
    _downAngle = [self getCurrentValueWithOriginalValue:_originalAngle andArrowValue:_arrowDownAngle andProgressValue:_progressValue];
    
        //尺寸
    _upSize = [self getCurrentSizeWithOriginalSize:_originalSize andArrowSize:_arrowSize andProgressValue:_progressValue];
//    _downSize = [self getCurrentSizeWithOriginalSize:_originalSize andArrowSize:_arrowSize andProgressValue:_progressValue];
    _downSize = _upSize;
        //位置
    _upPoint = [self getCurrentPointWithOriginalPoint:_originalUpPoint andArrowPoint:_arrowUpPoint andProgressValue:_progressValue];
    _downPoint = [self getCurrentPointWithOriginalPoint:_originalDownPoint andArrowPoint:_arrowDownPoint andProgressValue:_progressValue];

    CGFloat kkk;
}

-(CGFloat)getCurrentValueWithOriginalValue:(CGFloat)originalValue andArrowValue:(CGFloat)arrowValue andProgressValue:(CGFloat)progress{

    CGFloat resultValue = 0;
    resultValue = (arrowValue - originalValue) * progress + originalValue;
    return resultValue;

}

-(CGSize)getCurrentSizeWithOriginalSize:(CGSize)originalSize andArrowSize:(CGSize)arrowSize andProgressValue:(CGFloat)progress{
    
    CGFloat width = [self getCurrentValueWithOriginalValue:originalSize.width andArrowValue:arrowSize.width andProgressValue:progress];
    CGFloat height = [self getCurrentValueWithOriginalValue:originalSize.height andArrowValue:arrowSize.height andProgressValue:progress];
    CGSize resultSize = CGSizeMake(width, height);
    return resultSize;
}

-(CGPoint)getCurrentPointWithOriginalPoint:(CGPoint)originalPoint andArrowPoint:(CGPoint)arrowPoint andProgressValue:(CGFloat)progress{

    CGFloat xValue = [self getCurrentValueWithOriginalValue:originalPoint.x andArrowValue:arrowPoint.x andProgressValue:progress];
    CGFloat yVale = [self getCurrentValueWithOriginalValue:originalPoint.y andArrowValue:arrowPoint.y andProgressValue:progress];
    CGPoint resultPoint = CGPointMake(xValue, yVale);
    return resultPoint;
}

-(void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    [self setNeedsDisplay];

}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (_downSize.height == 0) {
        [self changeCurrentProperty];
    }
//    [DrawView drawMenuBtn];
        //// background Drawing
    UIBezierPath* backgroundPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 50, 44)];
    [DrawView.kBlueColor setFill];
    [backgroundPath fill];
    
        //// upLine Drawing
        CGContextRef upContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(upContext);
        CGContextTranslateCTM(upContext, _upPoint.x, _upPoint.y);
        CGContextRotateCTM(upContext, -_upAngle * M_PI / 180);
        _upLine = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, _upSize.width, _upSize.height) cornerRadius: 1];
        [DrawView.kWhiteColor setFill];
        [_upLine fill];
        CGContextRestoreGState(upContext);
   

        //// midLine Drawing
    UIBezierPath* midLinePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(9, 20, 32, 3) cornerRadius: 1];
    [DrawView.kWhiteColor setFill];
    [midLinePath fill];
   
        //// downLine Drawing
        CGContextRef downContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(downContext);
        CGContextTranslateCTM(downContext, _downPoint.x, _downPoint.y);
        CGContextRotateCTM(downContext, -_downAngle * M_PI / 180);
        _downLine = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, _downSize.width, _downSize.height) cornerRadius: 1];
        [DrawView.kWhiteColor setFill];
        [_downLine fill];
        CGContextRestoreGState(downContext);
    
}

 
@end
