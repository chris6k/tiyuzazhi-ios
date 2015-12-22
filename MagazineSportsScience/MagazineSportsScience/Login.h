//
//  Login.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/8.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helpers.h"
#import "JsonResult.h"
#import "JSON.h"
#import "MagazineEntity.h"

@interface Login : UIViewController

@property (weak, nonatomic) IBOutlet UIView *View1;
@property (weak, nonatomic) IBOutlet UIView *View2;

@property (weak, nonatomic) IBOutlet UITextField *textUsername;

@property (weak, nonatomic) IBOutlet UITextField *textPassword;

@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnRegister;

@property (nonatomic, strong)  UserInfo *userInfo;
@property (nonatomic, strong)  Mission *mission;

//返回
-(IBAction)returnSuper:(id)sender;
- (IBAction)DoLogin:(id)sender;

- (IBAction) textFieldDoneEditing:(id)sender;

@end
