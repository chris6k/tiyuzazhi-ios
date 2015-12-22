//
//  GZGGControl.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/11.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "GZGGControl.h"

@implementation GZGGControl

@synthesize TZGGTableview;
@synthesize sysMessage;
@synthesize showWeb;
@synthesize sysMessageIndex;



#pragma mark - 加载View
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initView];
}

-(void)initView
{
    JsonResult *jsonResult = [[JsonResult alloc] init];
    [jsonResult GetMagazineSystemBoard];

    NSDictionary *dictionary = [jsonResult.JsonString_SystemBoard  JSONValue];
    sysMessage = [[SysMessage alloc] initWithDictionary:dictionary];
    
    
    NSDecimalNumber *f1 = (NSDecimalNumber *)sysMessage.result ;
    
    if((int)[f1 integerValue]==1)
    {
        NSString *url = [[sysMessage.data objectAtIndex:(int)sysMessageIndex]  summary ];

        [showWeb loadHTMLString:url baseURL:nil];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    
    return sysMessage.data.count;
}

//- (NSString *)tableView:(UITableView *)tableView
//titleForHeaderInSection:(NSInteger)section {
//    switch (section) {
//        case kRedSection:
//            return @"红";
//        case kBlueSection:
//            return @"蓝";
//        default:
//            return @"Unknown";
//    }
//}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDecimalNumber *f1 = (NSDecimalNumber *)sysMessage.result ;
    
    if((int)[f1 integerValue]==1)
    {
        
        UITableViewCell *cell = (UITableViewCell *)[tableView
                                          dequeueReusableCellWithIdentifier:@"TZGGCell"];
        
//        NSString *v1 = (NSString *)[sysMessage.data objectForKey:@"title"];
//        if(![v1 isEqual:[ NSNull null]])
//        {
//            cell.textLabel.text  =v1;
//        }
        
        cell.textLabel.text  = [[sysMessage.data objectAtIndex:indexPath.row]  title];
  
        sysMessageIndex = indexPath.row;

        if(indexPath.row%2==1)
        {
            cell.backgroundColor =  [Helpers colorWithHexString:@"f5f5f5"];
            
        }
        else
        {
            cell.backgroundColor =  [Helpers colorWithHexString:@"ffffff"];
            
        }

      
    
       
        
    return cell;
    }
    else
    {
        return  nil;
    }
}



#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //  体育科技 ZoneOne
    //  体育科学ZoneTwo
    
            [self  performSegueWithIdentifier:@"segueGGDetail" sender:self];
    
    
}



#pragma mark - 按钮事件
- (IBAction)returnSuper:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{}];

}

- (IBAction)returnSuper2:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];

}
@end
