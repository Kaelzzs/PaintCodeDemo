//
//  ViewController.h
//  PaintCodeDemo
//
//  Created by Kael on 2016/10/12.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestView.h"
#import "MenuBtnView.h"
@interface ViewController : UIViewController



@property (weak, nonatomic) IBOutlet TestView *drawView;

@property (weak, nonatomic) IBOutlet UIButton *drawBtn;

@property (weak, nonatomic) IBOutlet UIImageView *drawImageView;

@property (weak, nonatomic) IBOutlet UISlider *progressSlider;

@property (weak, nonatomic) IBOutlet MenuBtnView *menuBtnView;

- (IBAction)menuBtnSlectedAction:(id)sender;



- (IBAction)drawBtnAction:(id)sender;

- (IBAction)progressChangedValue:(id)sender;



@property (weak, nonatomic) IBOutlet UISwitch *styleSwitch;

- (IBAction)styleSwitchChanged:(id)sender;









@end

