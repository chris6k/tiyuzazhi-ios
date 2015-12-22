//
//  SGXQ.h
//  MagazineSportsScience
//
//  Created by joan on 15/1/6.
//  Copyright (c) 2015年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"
#import "MagazineEntity.h"
#import "JsonResult.h"
#import "CategoryCell.h"
#import "EditorOfficeDetailCell.h"
#import "Helpers.h"
#import "PullingRefreshTableView/PullingRefreshTableView.h"
#import "PrivateInfo.h"
#import "RegisterDone.h"
#import "UIView+Toast.h"
@interface SGXQ : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btn_return;
@property (weak, nonatomic) IBOutlet UITableView *TableSGXQDetail;
@property (nonatomic, strong)  ExamPrivateArts *examPrivateArts;
@property (nonatomic, strong)  ExamHist *examHist;
@property (nonatomic, strong) JsonResult *jsonResult;
- (IBAction)returnSuper:(id)sender;

@end
