//
//  Register.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/8.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "Register.h"

@implementation Register

@synthesize view1;
@synthesize view2;
@synthesize view3;
@synthesize btnRegister;
@synthesize textConfirmPassword;
@synthesize textPassword;
@synthesize textUsername;
@synthesize base;
@synthesize userInfo;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)initView
{
    view1.layer.shadowOffset = CGSizeMake(0, 1);
    view1.layer.shadowOpacity = 0.5;
    view1.layer.shadowRadius = 1.0;
    view1.layer.borderWidth = 0.1;
    
    view2.layer.shadowOffset = CGSizeMake(0, 1);
    view2.layer.shadowOpacity = 0.5;
    view2.layer.shadowRadius = 1.0;
    view2.layer.borderWidth = 0.1;
    
    view3.layer.shadowOffset = CGSizeMake(0, 1);
    view3.layer.shadowOpacity = 0.5;
    view3.layer.shadowRadius = 1.0;
    view3.layer.borderWidth = 0.1;
    
    btnRegister.backgroundColor =    [Helpers colorWithHexString:@"fcaa49"];
    btnRegister.layer.shadowOffset = CGSizeMake(1, 1);
    btnRegister.layer.shadowOpacity = 0.5;
    btnRegister.layer.shadowRadius = 1.0;
    

    
    
}


#pragma mark - 按钮事件
- (IBAction)returnSuper:(id)sender
{
 [self dismissViewControllerAnimated:YES completion:^{}];
}

- (IBAction)DoRegister:(id)sender
{
    @try {
        if(![textPassword.text isEqualToString: textConfirmPassword.text])
        {
            [Helpers showAlertMessage:@"两次密码不一致"];
                       return;
        }
        
        
        NSMutableDictionary *dictionary  = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[Helpers TrimString:  textUsername.text ],@"username",[Helpers TrimString:  textPassword.text ],@"password", nil];
        
        JsonResult *jsonResult = [[JsonResult alloc] init];
        //[jsonResult PostMagazineUserRegister:dictionary];
        NSDictionary *resultdictionary = [ [jsonResult PostMagazineUserRegister:dictionary] JSONValue];
        
        base = [[Magazinebase alloc] initWithDictionary:resultdictionary];
        
        
        NSDecimalNumber  *f1 = (NSDecimalNumber *)base.result;
        if((int)[f1 integerValue]==1)
        {
            
            [jsonResult GetMagazineUserData:[Helpers TrimString:  textUsername.text ] password:[Helpers TrimString:  textPassword.text ]];
            NSDictionary *dictionary = [jsonResult.JsonString_UserData JSONValue];
            
            userInfo= [[UserInfo alloc] initWithDictionary:dictionary];
            
            NSDecimalNumber  *f1 = (NSDecimalNumber *)userInfo.result;
            if((int)[f1 integerValue]==1)
            {
                [self  performSegueWithIdentifier:@"seguesRegisterDone" sender:self];

            }else
            {
                [Helpers showAlertMessage:@"登陆失败"];

            }
            
        }
        else
        {
            [Helpers showAlertMessage:@"注册失败"];

        }

               

        

    }
    @catch (NSException *exception) {
        [Helpers showAlertMessage:@"注册失败"];

        



    }
    @finally {
        
    }
   
   //  [self  performSegueWithIdentifier:@"seguesRegisterDone" sender:self];
    
}


- (IBAction) textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}


#pragma mark - 场景委托
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"seguesRegisterDone"])
    {
          [segue.destinationViewController setValue:userInfo forKey:@"userInfo"];
        
//        [segue.destinationViewController setValue:magezine forKey:@"magezine"];
//        [segue.destinationViewController setValue:[NSString stringWithFormat:@"%d" ,magID] forKey:@"magID"];
//        [segue.destinationViewController setValue:[NSString stringWithFormat:@"%d" ,(int)tableview.indexPathForSelectedRow.row] forKey:@"sortIndex"];
        
    }
}

@end
