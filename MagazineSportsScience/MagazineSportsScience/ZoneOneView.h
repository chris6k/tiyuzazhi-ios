//
//  ZoneOneView.h
//  MagazineSportsScience
//
//  Created by joan on 14/12/7.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "ViewController.h"

#import "JsonResult.h"
#import "ArticlesCell.h"
#import "MagazineEntity.h"
#import "Helpers.h"


@interface ZoneOneView : UIViewController
{

}



@property (nonatomic, strong)  MagazineArticles *magazineArticles;
@property (nonatomic,strong) Magazine *magazineD;
@property (nonatomic, strong)  MagazineSort *magazine;
@property (nonatomic, strong) JsonResult *jsonResult;
@property (nonatomic, copy) NSString *magID;

@property (nonatomic, copy) NSString *sortIndex;
@property (nonatomic) BOOL IsLoading;  //载新数据
@property (nonatomic) BOOL IsFetchMGIDing;     //获取ID

@property ( strong, nonatomic) IBOutlet UILabel *lb_title;
@property (weak, nonatomic) IBOutlet UIButton *btn_collect;
@property (weak, nonatomic) IBOutlet UIButton *btn_share;
@property (strong,nonatomic) IBOutlet PullingRefreshTableView *TableViewArticle;
@property ( strong, nonatomic) IBOutlet UILabel *lb_pushNo;
@property (strong,nonatomic) IBOutlet UILabel *lb_pushDate;

-(IBAction)returnSuper:(id)sender;

-(IBAction)share:(id)sender;

-(IBAction)collect:(id)sender;


-(IBAction)nextMagazine:(id)sender;

-(IBAction)preMagazine:(id)sender;
@end
