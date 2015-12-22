//
//  PrivateInfo.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/9.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "PrivateInfo.h"

@implementation PrivateInfo

@synthesize View4;
@synthesize View1;
@synthesize View2;
@synthesize View3;
@synthesize btnLoginOff;
@synthesize userInfo;
@synthesize lb_showCompany;
@synthesize lb_showemail;
@synthesize lb_showPhone;
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
}


-(void)initView
{
    
    View1.layer.shadowOffset = CGSizeMake(0, 1);
    View1.layer.shadowOpacity = 0.1;
    View1.layer.shadowRadius = 0.1;
    View1.layer.borderWidth = 0.1;
    
    View2.layer.shadowOffset = CGSizeMake(0, 1);
    View2.layer.shadowOpacity = 0.1;
    View2.layer.shadowRadius = 0.1;
    View2.layer.borderWidth = 0.1;
    
    View3.layer.shadowOffset = CGSizeMake(0, 1);
    View3.layer.shadowOpacity = 0.1;
    View3.layer.shadowRadius = 0.1;
    View3.layer.borderWidth = 0.1;
    
    View4.layer.shadowOffset = CGSizeMake(0, 1);
    View4.layer.shadowOpacity = 0.1;
    View4.layer.shadowRadius = 0.1;
    View4.layer.borderWidth = 0.1;
    
    btnLoginOff.backgroundColor =    [Helpers colorWithHexString:@"d14848"];
    btnLoginOff.layer.shadowOffset = CGSizeMake(1, 1);
    btnLoginOff.layer.shadowOpacity = 0.5;
    btnLoginOff.layer.shadowRadius = 1.0;
    
    @try {
        
        if(userInfo.data.count>0)
        {
            
            
            NSString *v1 = (NSString *)[userInfo.data objectForKey:@"email"];
            if(![v1 isEqual:[ NSNull null]])
            {
                lb_showemail.text = v1;
            }
            NSString *v2 = (NSString *)[userInfo.data objectForKey:@"company"];
            if(![v2 isEqual:[ NSNull null]])
            {
                lb_showCompany.text = v2;
            }
            
            NSString *v3 = (NSString *)[userInfo.data objectForKey:@"mobile"];
            if(![v3 isEqual:[ NSNull null]])
            {
                lb_showemail.text = v3;
            }
       
      }
        
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
        
    }

    

}

#pragma mark - 按钮事件

//返回
-(IBAction)returnSuper:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}

- (IBAction)DoLoginOff:(id)sender
{
    userInfo = nil;
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
 
   
    
    [defaults removeObjectForKey:@"userdata"];
    [defaults removeObjectForKey:@"undotask"];
    [self  performSegueWithIdentifier:@"segueLoginOff" sender:self];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];


}

- (IBAction)DoUpdate:(id)sender
{
    [Helpers showAlertMessage:@"本版本不支持更新"];
}

#pragma mark - SEGUE


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    
    
    
    [defaults removeObjectForKey:@"userdata"];
    [defaults removeObjectForKey:@"undotask"];

}
@end
