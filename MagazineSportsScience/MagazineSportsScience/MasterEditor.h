//
//  MasterEditor.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/15.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>
#import "JSON.h"
#import "MagazineEntity.h"
#import "JsonResult.h"
#import "CategoryCell.h"
#import "Helpers.h"
#import "EditorOfficeCell.h"
#import "PullingRefreshTableView.h"
#import "FilterProcessControl.h"

@interface MasterEditor : UIViewController<PullingRefreshTableViewDelegate>
@property (nonatomic, strong)  UserInfo *userInfo;
@property (nonatomic, strong)  ExamArts *examArts;
@property (nonatomic, strong)  ExamArtsData *examArtsData;
@property (nonatomic, strong)  ExamArts *AllexamArts;
@property (weak, nonatomic) IBOutlet UILabel *lb_process;
@property (weak, nonatomic) IBOutlet PullingRefreshTableView *TableExamArts;
@property (nonatomic, strong)  JsonResult *jsonResult;
@property (nonatomic, strong) NSURLConnection *con1;
@property (weak, nonatomic) IBOutlet UIButton *btn_filterDate;
@property (weak, nonatomic) IBOutlet UIButton *btn_filterProcess;
@property (weak, nonatomic) IBOutlet UIView *viewDate;
@property (weak, nonatomic) IBOutlet UIView *viewProcess;
@property (nonatomic) BOOL IsRefreshing;  //刷新原数据
@property (nonatomic) BOOL IsLoading;     //加载新数据
@property (assign,nonatomic) NSInteger page;
@property (nonatomic, strong) NSString *Asc;
@property (nonatomic, strong) NSString *step;

- (IBAction)ReturnSuper:(id)sender;
- (IBAction)returnSuper2:(id)sender;
- (IBAction)DoFilterDate:(id)sender;
- (IBAction)DoFilterProcess:(id)sender;

- (IBAction)unwindMasterEditorViewController:(UIStoryboardSegue *)segue ;

@end
