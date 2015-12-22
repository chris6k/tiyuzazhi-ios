//
//  ViewController.h
//  MagazineSportsScience
//
//  Created by joan on 14/11/24.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h> 
#import "JSON.h"
#import "MagazineEntity.h"
#import "JsonResult.h"
#import "CategoryCell.h"
#import "Helpers.h"
#import "PullingRefreshTableView/PullingRefreshTableView.h"
#import "PrivateInfo.h"
#import "RegisterDone.h"
#import "UIView+Toast.h"



@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,PullingRefreshTableViewDelegate,NSURLConnectionDataDelegate,UISearchBarDelegate, UITextFieldDelegate>


@property (nonatomic, strong) NSArray *MagazineCategoryList;
@property (nonatomic, strong) NSMutableData *receiveData;
@property (nonatomic, copy) NSString *JsonString_LastMagazineCategory;
@property (readonly, strong, nonatomic) IBOutlet UIImageView *ImageHomePage1;
@property (readonly, strong, nonatomic) IBOutlet UIButton *BtnPrivateCenter1;
@property (weak, nonatomic) IBOutlet UISearchBar *SearchBar;
@property (weak, nonatomic) IBOutlet UIView *bottomBarView;

@property  (retain,nonatomic) IBOutlet PullingRefreshTableView *TableViewMagazineCategory;
@property ( strong, nonatomic) IBOutlet UILabel *lb_zczx;
@property ( strong, nonatomic) IBOutlet UILabel *MagazineSubTitle;
@property (weak, nonatomic) IBOutlet UILabel *lb_name;
@property (nonatomic, strong) IBOutlet UIViewController *controlView1;
@property (weak, nonatomic) IBOutlet UILabel *lb_zczxNumber;
@property (weak, nonatomic) IBOutlet UILabel *lb_sgzjNumber;
@property (weak, nonatomic) IBOutlet UILabel *lb_bjgbNumber;
@property (weak, nonatomic) IBOutlet UILabel *lb_zbbgNumber;
@property (nonatomic, strong)  MagazineSort *magezine;
@property (nonatomic, strong)  UserInfo *userInfo;
@property (nonatomic, strong)  Mission *mission;
@property (nonatomic) BOOL refreshing;
@property (assign,nonatomic) NSInteger page;
@property ( strong, nonatomic) NSString *keywords;
@property (nonatomic, strong)  ExamArts *examArts;
@property (nonatomic, strong)  ExamPrivateArts *examPrivateArts;
@property (weak, nonatomic) IBOutlet UIView *searchContain;
@property (weak, nonatomic) IBOutlet UIButton *btn_Search;
@property (weak, nonatomic) IBOutlet UITextField *searchTextfield;

-(IBAction)LoginIntoPrivateCenter:(id)sender;

- (IBAction)DoEditorOffice:(id)sender;

- (IBAction)unwindMainViewController:(UIStoryboardSegue *)segue ;


- (IBAction)DoEnterAuthorCenter:(id)sender;

- (IBAction)DoEnterSG:(id)sender;
- (IBAction)DoEnterMasterEditor:(id)sender;
- (IBAction)DoSearch:(id)sender;

@end

