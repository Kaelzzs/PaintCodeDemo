//
//  MenuBtnView.h
//  PaintCodeDemo
//
//  Created by Kael on 2016/10/13.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DrawView.h"


#define kDurationTime 0.4//动画执行市场

typedef NS_ENUM(NSUInteger, DrawBtnType) {
    kBtnOriginalType,
    kBtnArrowType,
};

@interface MenuBtnView : UIButton <CAAnimationDelegate>

/**
 * 横线颜色
 * 就是可能会有动画的那三条横线的颜色
 */
@property (nonatomic,strong) UIColor *lineColor;//线的颜色

/**
 背景色
 */
@property (nonatomic,strong) UIColor *bgColor;//背景色


/**
 背景色图层
 */
@property (nonatomic,strong) CALayer *bgColorLayer;

#pragma mark - 通过画图方式（drawRect）完成的动画

/**
 横线原始尺寸
 */
@property (nonatomic,assign) CGSize originalSize;

/**
 横线变成箭头时的尺寸
 */
@property (nonatomic,assign) CGSize arrowSize;

/**
 横线原始旋转角度
 */
@property (nonatomic,assign) CGFloat originalAngle;

/**
 箭头状态的时候 上横线的角度
 */
@property (nonatomic,assign) CGFloat arrowUpAngle;

/**
 下横线的角度状态
 */
@property (nonatomic,assign) CGFloat arrowDownAngle;

/**
 上箭头的原始位置
 */
@property (nonatomic,assign) CGPoint originalUpPoint;

/**
 上横线的 箭头状态位置
 */
@property (nonatomic,assign) CGPoint arrowUpPoint;

/**
 下横线的 原始状态 位置
 */
@property (nonatomic,assign) CGPoint originalDownPoint;

/**
 下横线 箭头状态 位置
 */
@property (nonatomic,assign) CGPoint arrowDownPoint;



/**
 手绘动画的进度
 */
@property (nonatomic,assign) CGFloat progressValue;


/**
 当前 上横线 角度
 */
@property (nonatomic,assign) CGFloat upAngle;

/**
 当前 下横线 角度
 */
@property (nonatomic,assign) CGFloat downAngle;

/**
 当前 上横线 尺寸
 */
@property (nonatomic,assign) CGSize upSize;

/**
 当前下横线尺寸
 */
@property (nonatomic,assign) CGSize downSize;

/**
 当前 上横线 位置
 */
@property (nonatomic,assign) CGPoint upPoint;

/**
 当前下横线位置
 */
@property (nonatomic,assign) CGPoint downPoint;


@property (nonatomic,strong) UIBezierPath *upLine;

@property (nonatomic,strong) UIBezierPath *midLine;

@property (nonatomic,strong) UIBezierPath *downLine;

@property (nonatomic,strong) CALayer *drawContentLayer;



#pragma mark - 动画实现 点击效果的时候 一次性完成动画
@property (nonatomic,strong) CAShapeLayer *upLayer;

@property (nonatomic,strong) CAShapeLayer *midLayer;

@property (nonatomic,strong) CAShapeLayer *downLayer;

/**
 动画层
 */
@property (nonatomic,strong) CALayer *animationlayer;

/**
 是否使用 绘图方式 执行动画
 */
@property (nonatomic,assign) BOOL isDrawView;//是否使用划线方式


/**
 绘制按钮的 状态 ：1、原始菜单状态：kBtnOriginalType--2、箭头状态：kBtnArrowType,
 */
@property (nonatomic,assign) DrawBtnType statusType;

/**
 按钮点击变为箭头或者 返回原始状态

 @param toArrow 是否是要变为箭头状态
 */
-(void)changeToArrowView:(BOOL)toArrow;


/**
 进度控制动画

 @param progressValue 进度
 */
-(void)setProgressValue:(CGFloat)progressValue;

@end
