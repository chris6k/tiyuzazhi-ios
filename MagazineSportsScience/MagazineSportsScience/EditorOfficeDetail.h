//
//  EditorOfficeDetail.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/13.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagazineEntity.h"
#import "EditorOfficeDetailCell.h"
#import "JsonResult.h"
#import "JSON.h"
#import "Helpers.h"

@interface EditorOfficeDetail : UIViewController<NSURLConnectionDelegate>

@property (weak, nonatomic) IBOutlet UITableView *TableEditorOfficeDetail;
@property (nonatomic, strong)  ExamArtsData *examArtsData;
@property (nonatomic, strong)  UserInfo *userInfo;
@property (nonatomic, strong)  ExamHist *examHist;
@property (nonatomic, strong)  Summary *summary;

@property (nonatomic, strong) JsonResult *jsonResult;
@property (nonatomic, strong) NSIndexPath *tableIndexPath;

@property (nonatomic, strong) NSMutableArray *expandArray;

- (IBAction)ReturnSuper:(id)sender;

- (IBAction)expand:(id)sender;

@end
