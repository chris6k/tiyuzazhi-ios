//
//  PrivateInfo.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/9.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helpers.h"
#import "MagazineEntity.h"

@interface PrivateInfo : UIViewController

@property (nonatomic, strong)  UserInfo *userInfo;

@property (weak, nonatomic) IBOutlet UIView *View1;
@property (weak, nonatomic) IBOutlet UIView *View2;
@property (weak, nonatomic) IBOutlet UIView *View3;
@property (weak, nonatomic) IBOutlet UIView *View4;
@property (weak, nonatomic) IBOutlet UIButton *btnLoginOff;
@property (weak, nonatomic) IBOutlet UILabel *lb_showemail;

@property (weak, nonatomic) IBOutlet UILabel *lb_showCompany;

@property (weak, nonatomic) IBOutlet UILabel *lb_showPhone;


-(IBAction)returnSuper:(id)sender;


- (IBAction)DoLoginOff:(id)sender;

- (IBAction)DoUpdate:(id)sender;

@end
