//
//  Login.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/8.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "Login.h"

@implementation Login

@synthesize View1;
@synthesize View2;
@synthesize btnLogin;
@synthesize btnRegister;
@synthesize textPassword;
@synthesize textUsername;
@synthesize userInfo;
@synthesize mission;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
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
    
    btnLogin.backgroundColor =    [Helpers colorWithHexString:@"fcaa49"];
    btnLogin.layer.shadowOffset = CGSizeMake(1, 1);
    btnLogin.layer.shadowOpacity = 0.5;
    btnLogin.layer.shadowRadius = 1.0;
    
    
    btnRegister.backgroundColor =   [UIColor whiteColor];
    btnRegister.layer.shadowOffset = CGSizeMake(1, 1);
    btnRegister.layer.shadowOpacity = 0.5;
    btnRegister.layer.shadowRadius = 1.0;
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    NSString *name = [defaults objectForKey:@"username"];//根据键值取出
    if(name != nil)
    {
        textUsername.text = name;
    }
    
    
}

#pragma mark - 按钮事件

//返回
-(IBAction)returnSuper:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}

- (IBAction)DoLogin:(id)sender
{
    
    @try {
        
        JsonResult *jsonResult = [[JsonResult alloc] init];
        
        if ([ [Helpers TrimString:  textUsername.text ]isEqualToString:@"" ]|| [ [Helpers TrimString:  textUsername.text ]isEqualToString:@""]) {
            [Helpers showAlertMessage:@"请输入用户名和密码"];
        }
        else
        {
            
            
            [jsonResult GetMagazineUserData:[Helpers TrimString:  textUsername.text ] password:[Helpers TrimString:  textPassword.text ]];
            NSDictionary *dictionary = [jsonResult.JsonString_UserData JSONValue];
            
            userInfo= [[UserInfo alloc] initWithDictionary:dictionary];
            
            NSDecimalNumber *uid = (NSDecimalNumber *)[userInfo.data objectForKey:@"uid"]  ;
            
            NSDecimalNumber  *f1 = (NSDecimalNumber *)userInfo.result;
            if((int)[f1 integerValue]==1)
            {
                
                [jsonResult GetMagazineUserUndoTask:(int)[uid  integerValue]];
                
                NSDictionary *workDictionary = [jsonResult.JsonString_UserUndoTask JSONValue];
                
                mission = [[Mission alloc] initWithDictionary:workDictionary];
                NSDecimalNumber  *f2 = (NSDecimalNumber *)mission.result;
                
                
                if((int)[f2 integerValue]==1)
                {
                    if(userInfo !=nil)
                    {
                        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
                        NSString *name = [userInfo.data objectForKey:@"username"];
                        [defaults setObject:name forKey:@"username"];
                        
                        [defaults setObject:jsonResult.JsonString_UserData forKey:@"userdata"];
                        [defaults setObject:jsonResult.JsonString_UserUndoTask  forKey:@"undotask"];
                    }

                    [self  performSegueWithIdentifier:@"segueLoginSuccess" sender:self];
                }
            }
            else
            {
                [Helpers showAlertMessage:@"登陆失败"];
                
            }
        }
        
    }
    @catch (NSException *exception) {
        [Helpers showAlertMessage:@"登陆失败"];
        
    }
    @finally {
        
    }
    
}


- (IBAction) textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}


#pragma mark - SEGUE


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"segueLoginSuccess"])
    {
        
        [segue.destinationViewController setValue:userInfo forKey:@"userInfo"];
        [segue.destinationViewController setValue:mission forKey:@"mission"];
        
        //        [segue.destinationViewController setValue:[NSString stringWithFormat:@"%d" ,magID] forKey:@"magID"];
        //        [segue.destinationViewController setValue:[NSString stringWithFormat:@"%d" ,(int)tableview.indexPathForSelectedRow.row] forKey:@"sortIndex"];
        
    }
}

@end
