//
//  Register.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/8.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"
#import "Helpers.h"
#import "JsonResult.h"
#import "MagazineEntity.h"

@interface Register : UIViewController
@property (weak, nonatomic) IBOutlet UIView *view1;

@property (nonatomic, strong) Magazinebase  *base;

@property (nonatomic, strong) UserInfo *userInfo;

@property (weak, nonatomic) IBOutlet UIView *view2;


@property (weak, nonatomic) IBOutlet UIView *view3;

@property (weak, nonatomic) IBOutlet UITextField *textUsername;

@property (weak, nonatomic) IBOutlet UITextField *textPassword;


@property (weak, nonatomic) IBOutlet UITextField *textConfirmPassword;

@property (weak, nonatomic) IBOutlet UIButton *btnRegister;


- (IBAction)returnSuper:(id)sender;

- (IBAction)DoRegister:(id)sender;

- (IBAction) textFieldDoneEditing:(id)sender;


@end
