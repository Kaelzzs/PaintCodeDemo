//
//  ViewController.m
//  PaintCodeDemo
//
//  Created by Kael on 2016/10/12.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

#import "HBBtnView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _drawImageView.image = [DrawView imageOfMenuBtn];
    [_drawBtn setImage:[DrawView imageOfMenuBtn] forState:UIControlStateNormal];
    // Do any additional setup after loading the view, typically from a nib.
    
    HBBtnView *hbview = [[HBBtnView alloc] initWithFrame:CGRectMake(0, 100, 100, 88)];
    hbview.center = CGPointMake(self.view.center.x, 100);
    
    [self.view addSubview:hbview];
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    [hbview addTarget:self action:@selector(hamburgerAction:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)hamburgerAction:(HBBtnView *)button {
    button.selected = !button.selected;
    button.showsMenu = button.selected;
}



- (IBAction)drawBtnAction:(id)sender {
    
        //    [_menuBtnView changeToArrowView:_drawBtn.selected];
        //    _drawBtn.selected = !_drawBtn.selected;
    
    
}


#pragma mark - 自定义按钮的响应事件

- (IBAction)menuBtnSlectedAction:(id)sender {
    
    _drawBtn.selected = !_drawBtn.selected;
    [_menuBtnView changeToArrowView:!_drawBtn.selected];

}



- (IBAction)progressChangedValue:(id)sender {
    
    if (!_styleSwitch.isOn) {
        _drawView.progressValue = _progressSlider.value;
    }else{
        _menuBtnView.progressValue = _progressSlider.value;
        _drawView.progressValue = _progressSlider.value;
    }
    
}
- (IBAction)styleSwitchChanged:(id)sender {
    _menuBtnView.isDrawView = _styleSwitch.isOn;
    if (_menuBtnView.isDrawView) {
        NSLog(@"开启画图动画");
    }else{
        NSLog(@"开启CAAnimation 动画");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

@end
