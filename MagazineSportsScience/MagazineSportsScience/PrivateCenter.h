//
//  PrivateCenter.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/8.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "MagazineEntity.h"
#import "RegisterDone.h"

@interface PrivateCenter : UIViewController
@property (weak, nonatomic) IBOutlet UIView *ViewTitle;
@property (weak, nonatomic) IBOutlet UIView *View1;
@property (weak, nonatomic) IBOutlet UIView *View2;
@property (weak, nonatomic) IBOutlet UIView *View3;
@property (weak, nonatomic) IBOutlet UIView *ViewSettings;
@property (weak, nonatomic) IBOutlet UILabel *lb_Name;
@property (weak, nonatomic) IBOutlet UILabel *lb_Company;
@property (weak, nonatomic) IBOutlet UILabel *lb_Address;

@property (nonatomic, strong)  UserInfo *userInfo;

@property (nonatomic, strong)  Mission *mission;

//返回
-(IBAction)returnSuper:(id)sender;

- (IBAction)Login:(id)sender;

- (IBAction)Register:(id)sender;


- (IBAction)SysBoard:(id)sender;


- (IBAction)SendArticleAttention:(id)sender;


- (IBAction)ConnectMagazine:(id)sender;


- (IBAction)PrivateSettings:(id)sender;

- (IBAction)GoBackMainView:(id)sender;


-(IBAction)PrivateInfo:(id)sender;

- (IBAction)unwindPrivateCenterFromRegisterDone:(UIStoryboardSegue *)segue ;
@end
