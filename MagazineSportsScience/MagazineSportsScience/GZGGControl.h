//
//  GZGGControl.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/11.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helpers.h"
#import "JsonResult.h"
#import "MagazineEntity.h"
#import "JSON.h"

@interface GZGGControl : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
}

@property (nonatomic, strong)  SysMessage *sysMessage;

@property (nonatomic, assign)  NSInteger sysMessageIndex;

@property (weak, nonatomic) IBOutlet UITableView *TZGGTableview;

@property (weak, nonatomic) IBOutlet UIWebView *showWeb;


- (IBAction)returnSuper:(id)sender ;

- (IBAction)returnSuper2:(id)sender ;
    



@end
