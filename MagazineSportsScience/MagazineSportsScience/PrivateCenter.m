//
//  PrivateCenter.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/8.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "PrivateCenter.h"

@implementation PrivateCenter

@synthesize View1;
@synthesize ViewTitle;
@synthesize View2;
@synthesize View3;
@synthesize ViewSettings;
@synthesize userInfo;
@synthesize lb_Address;
@synthesize lb_Company;
@synthesize lb_Name;
@synthesize mission;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)initView
{

    ViewTitle.layer.shadowOffset = CGSizeMake(0, 1);
    ViewTitle.layer.shadowOpacity = 0.1;
    ViewTitle.layer.shadowRadius = 0.1;
    
    View1.layer.shadowOffset = CGSizeMake(0, 1);
    View1.layer.shadowOpacity = 0.1;
    View1.layer.shadowRadius = 0.1;
    
    View2.layer.shadowOffset = CGSizeMake(0, 1);
    View2.layer.shadowOpacity = 0.1;
    View2.layer.shadowRadius = 0.1;
    
    View3.layer.shadowOffset = CGSizeMake(0, 1);
    View3.layer.shadowOpacity = 0.1;
    View3.layer.shadowRadius = 0.1;
    
    ViewSettings.layer.shadowOffset = CGSizeMake(0, 1);
    ViewSettings.layer.shadowOpacity = 0.1;
    ViewSettings.layer.shadowRadius = 0.1;
    
    @try {
        
        NSDecimalNumber  *f1 = (NSDecimalNumber *)userInfo.result;
        
        if((int)[f1 integerValue]==1)
        {

            
            NSString *v1 = (NSString *)[userInfo.data objectForKey:@"name"];
            if(![v1 isEqual:[ NSNull null]])
            {
                lb_Name.text = v1;
            }

            
            NSString *v2 = (NSString *)[userInfo.data objectForKey:@"company"];
            if(![v2 isEqual:[ NSNull null]])
            {
                lb_Company.text = v2;
            }
            
            NSString *v3 = (NSString *)[userInfo.data objectForKey:@"address"];
            if(![v3 isEqual:[ NSNull null]])
            {
                lb_Address.text = v3;
            }

            
            //     (NSString *)[userInfo.data objectForKey:@"name"];v1 S
            
//          lb_Company.text = (NSString *)[userInfo.data objectForKey:@"company"];
//            
//            lb_Address.text =(NSString *)[userInfo.data objectForKey:@"address"];
        }

    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
        
    }
    
 
}


#pragma mark-按钮事件

//返回
-(IBAction)returnSuper:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];

}

- (IBAction)Login:(id)sender {
}

- (IBAction)Register:(id)sender {
}

- (IBAction)SysBoard:(id)sender {
   
    
    if([self IsLogining])
    {
         [self  performSegueWithIdentifier:@"segueTZGG2" sender:self];    }
    else
    {  [self  performSegueWithIdentifier:@"segueTZGG1" sender:self];
    }

}

- (IBAction)SendArticleAttention:(id)sender {
    
    if([self IsLogining])
    {
    [self  performSegueWithIdentifier:@"segueTGXZ2" sender:self];
    }
    else
    {
        [self  performSegueWithIdentifier:@"segueTGXZ1" sender:self];

    }
}

- (IBAction)ConnectMagazine:(id)sender {
    
    //[[UIApplication sharedApplication]  openURL:[NSURL URLWithString:@"tel:01087182592"]];
    [[UIApplication sharedApplication] openURL:[[NSURL alloc] initWithString:@"tel:01087182592"]];
}

- (IBAction)PrivateSettings:(id)sender {
    if ([self IsLogining]) {
        [self performSegueWithIdentifier:@"seguePrivateInfo" sender:self];
    } else {
        [self performSegueWithIdentifier:@"segueToLogin2" sender:self];
    }
}

- (IBAction)GoBackMainView:(id)sender {
    
    [self  performSegueWithIdentifier:@"segueMainByLogined" sender:self];

}

-(IBAction)PrivateInfo:(id)sender
{
 [self  performSegueWithIdentifier:@"seguePrivateInfo" sender:self];
}

#pragma mark  - 判定
-(BOOL)IsLogining
{
    
    
    NSDecimalNumber  *f1 = (NSDecimalNumber *)userInfo.result;
    if((int)[f1 integerValue]==1)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - UNWIND

-(IBAction)unwindPrivateCenterFromRegisterDone:(UIStoryboardSegue *)segue
{
    UIViewController *sourceViewController = segue.sourceViewController;
    
    if ([sourceViewController isKindOfClass:[RegisterDone class]]) {
    }
}

#pragma mark - SEGUE


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"segueMainByLogined"])
    {
        
        [segue.destinationViewController setValue:userInfo forKey:@"userInfo"];
        [segue.destinationViewController setValue:mission forKey:@"mission"];

       
        
    }
    if([segue.identifier isEqualToString:@"seguePrivateInfo"])
    {
        
        [segue.destinationViewController setValue:userInfo forKey:@"userInfo"];
        
        
    }

}


@end
