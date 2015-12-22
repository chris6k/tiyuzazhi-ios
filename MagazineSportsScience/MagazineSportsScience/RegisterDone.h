//
//  RegisterDone.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/9.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helpers.h"
#import "MagazineEntity.h"
@interface RegisterDone : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnCompletePrivate;

@property (weak, nonatomic) IBOutlet UIButton *btnGoOn;
@property (nonatomic, strong) UserInfo *userInfo;


- (IBAction)DoComplete:(id)sender;



- (IBAction)DoGoOn:(id)sender;


    

@end
