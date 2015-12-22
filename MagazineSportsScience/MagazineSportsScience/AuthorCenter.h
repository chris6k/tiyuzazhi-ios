//
//  AuthorCenter.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/14.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"
#import "MagazineEntity.h"
#import "JsonResult.h"
#import "CategoryCell.h"
#import "Helpers.h"
#import "PullingRefreshTableView/PullingRefreshTableView.h"
#import "PrivateInfo.h"
#import "RegisterDone.h"
#import "UIView+Toast.h"

@interface AuthorCenter : UIViewController
@property (nonatomic, strong)  ExamPrivateArts *examPrivateArts;

@property (weak, nonatomic) IBOutlet UILabel *lb_title;

@property (weak, nonatomic) IBOutlet UIButton *bt_title;

@property (weak, nonatomic) IBOutlet UILabel *lb_pushNo;

@property (weak, nonatomic) IBOutlet UILabel *lb_pushtime;

@property (weak, nonatomic) IBOutlet UILabel *lb_state;

@property (weak, nonatomic) IBOutlet UILabel *lb_opName;

@property (weak, nonatomic) IBOutlet UITextView *lb_comment;

@property (weak, nonatomic) IBOutlet UIWebView *lb_contentView;

- (IBAction)EnterSGXQ:(id)sender;

@end
