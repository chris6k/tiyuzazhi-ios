//
//  RegisterDone.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/9.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "RegisterDone.h"

@implementation RegisterDone
@synthesize btnCompletePrivate;
@synthesize btnGoOn;
@synthesize userInfo;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)initView
{

    
    btnCompletePrivate.backgroundColor =    [Helpers colorWithHexString:@"fcaa49"];
    btnCompletePrivate.layer.shadowOffset = CGSizeMake(1, 1);
    btnCompletePrivate.layer.shadowOpacity = 0.5;
    btnCompletePrivate.layer.shadowRadius = 1.0;
    
    btnGoOn.backgroundColor =   [UIColor whiteColor];
    btnGoOn.layer.shadowOffset = CGSizeMake(1, 1);
    btnGoOn.layer.shadowOpacity = 0.5;
    btnGoOn.layer.shadowRadius = 1.0;
    
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"unwindToMainView"])
    {
        [segue.destinationViewController setValue:userInfo forKey:@"userInfo"];

    }
    if([segue.identifier isEqualToString:@"unwindToPrivateCenter"])
    {
        [segue.destinationViewController setValue:userInfo forKey:@"userInfo"];
        
    }
  
    
}

#pragma mark -按钮事件
- (IBAction)DoComplete:(id)sender {
}

- (IBAction)DoGoOn:(id)sender {
}

@end
