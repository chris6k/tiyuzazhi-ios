//
//  AuthorCenter.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/14.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "AuthorCenter.h"

@implementation AuthorCenter

@synthesize  examPrivateArts;
@synthesize  lb_contentView;
@synthesize lb_pushNo;
@synthesize lb_pushtime;
@synthesize lb_title;
@synthesize lb_state;
@synthesize lb_comment;
@synthesize lb_opName;
@synthesize bt_title;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
}


-(void)initView
{
    NSDecimalNumber  *f1 = (NSDecimalNumber *)examPrivateArts.result;
    if((int)[f1 integerValue]==1)
    {
        if([examPrivateArts.data objectForKey:@"title"] !=nil)
        {
          [bt_title setTitle:[examPrivateArts.data objectForKey:@"title"] forState:UIControlStateNormal];
        }
        if([examPrivateArts.data objectForKey:@"examineStart"]  !=nil)
        {
            lb_pushtime.text = [[examPrivateArts.data objectForKey:@"examineStart"]  substringToIndex:10];
        }
        if([examPrivateArts.data objectForKey:@"draftNo"]   !=nil)
        {
            lb_pushNo.text = [examPrivateArts.data objectForKey:@"draftNo" ];
        }
        
        if([examPrivateArts.data objectForKey:@"opName" ]  !=nil)
        {
            //            NSString *html = [@"<font color='#5a7cbc' size='18' vert>%@</font>    %@" stringByAppendingFormat :[examPrivateArts.data objectForKey:@"opName"],[examPrivateArts.data objectForKey:@"comment" ]  ];
            //             [lb_contentView loadHTMLString:html baseURL:nil];
            //            lb_contentView.backgroundColor = [UIColor clearColor];
            lb_opName.text =[examPrivateArts.data objectForKey:@"opName"];
            
        }
        if(![[examPrivateArts.data valueForKey:@"examineFinish" ] isKindOfClass:[NSNull class]])
        {
            if(![[examPrivateArts.data valueForKey:@"comment" ] isKindOfClass:[NSNull class]])
            {
                
                lb_comment.text = [examPrivateArts.data valueForKey:@"comment" ] ;
                
                
                
            }
            else {
                lb_comment.text = @"";
            }
        }
        
        else
        {
            lb_comment.text = @"未审核";
        }
        // mutableArray = [[NSMutableArray alloc] initWithObjects:@"全部流程",@"0",@"收稿",@"6",@"初审",@"7" ,@"退修",@"10",@"外审",@"8",@"终审",@"24",nil];
        if([examPrivateArts.data objectForKey:@"step"] != nil)
        {
            NSDecimalNumber *k = (NSDecimalNumber *)[examPrivateArts.data objectForKey:@"step"];
            switch ([k integerValue]) {
                case 10:
                    lb_state.text = @"审稿：退修";
                    break;
                case 0:
                    lb_state.text = @"审稿：全部流程";
                    break;
                case 6:
                    lb_state.text= @"审稿：收稿";
                    break;
                case 7:
                    lb_state.text = @"编辑审稿：初审";
                    break;
                case 8:
                    lb_state.text = @"编辑审稿：复审";
                    break;
                case 24:
                    lb_state.text = @"终审";
                    break;
                case 11:
                    lb_state.text = @"退稿";

                    break;
                case 12:
                    lb_state.text = @"编辑加工";

                    break;
                case 13:
                    lb_state.text = @"发稿";
                    
                    break;
                default:
                    break;
            }
            
        }
        
        
    }
    else
    {
        
    }
    
    
    
}


#pragma mark - 按钮事件
- (IBAction)EnterSGXQ:(id)sender
{
    [self  performSegueWithIdentifier:@"segueSGXQ" sender:self];

}

#pragma mark - SEGUE

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"segueSGXQ"])
    {
        [segue.destinationViewController setValue:examPrivateArts forKey:@"examPrivateArts"];

        
    }
  
}


@end
