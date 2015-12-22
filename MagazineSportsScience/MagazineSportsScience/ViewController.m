//
//  ViewController.m
//  MagazineSportsScience
//
//  Created by joan on 14/11/24.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "ViewController.h"


#define kSectionCount 1
#define kRedSection 0
#define kBlueSection 1
//lixiaoxian@ciss.cn
//87188718lxx
@interface ViewController ()

@end



@implementation ViewController

@synthesize ImageHomePage1;
@synthesize BtnPrivateCenter1;
@synthesize TableViewMagazineCategory;
@synthesize magezine;
@synthesize lb_zczx;
@synthesize controlView1;
@synthesize userInfo;
@synthesize  receiveData;
@synthesize lb_name;
@synthesize JsonString_LastMagazineCategory;
@synthesize mission;
@synthesize bottomBarView;
@synthesize lb_bjgbNumber;
@synthesize lb_sgzjNumber;
@synthesize lb_zbbgNumber;
@synthesize lb_zczxNumber;
@synthesize SearchBar;
@synthesize refreshing;
@synthesize page;
@synthesize keywords;
@synthesize examArts;
@synthesize searchContain;
@synthesize searchTextfield;
@synthesize btn_Search;
@synthesize examPrivateArts;

JsonResult *jsonResult;
MagazineArticles *articles;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 初始化

-(void)initView
{
    @try
    {
        jsonResult = [[JsonResult alloc] init];
        searchContain.layer.masksToBounds = YES;
        searchContain.layer.cornerRadius =20;
        searchContain.layer.borderWidth = 1;
        searchContain.layer.borderColor = [[UIColor whiteColor] CGColor];
        searchTextfield.delegate = self;
        
        
        bottomBarView.layer.shadowOffset = CGSizeMake(0, -1);
        bottomBarView.layer.shadowOpacity = 0.3;
        bottomBarView.layer.shadowRadius = 1;
        
        TableViewMagazineCategory.pullingDelegate =self;
        
        self.TableViewMagazineCategory.headerOnly = YES;
        
        [TableViewMagazineCategory initView];
        
        [self GetLastMagazineCategory];
        
        if (userInfo == nil) {
            NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
            NSDictionary *dictionary = [[defaults objectForKey:@"userdata"] JSONValue];
            
            userInfo= [[UserInfo alloc] initWithDictionary:dictionary];
            
            NSDictionary *workDictionary = [[defaults objectForKey:@"undotask"] JSONValue];
            
            mission = [[Mission alloc] initWithDictionary:workDictionary];
            
            
            
        }
        
        if([self IsLogining])
        {
            
            
            
            //定时器    repeats 表示是否需要重复，NO为只重复一次
            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(fetchMailInfo:) userInfo:nil repeats:YES];
            
            [timer fire];
            
            
            lb_name.text = [userInfo.data objectForKey:@"name"];
            
            if ((int)[(NSDecimalNumber *)[mission.data objectForKey:@"author"] integerValue] ) {
                [lb_zczxNumber setTextColor:[Helpers colorWithHexString:@"#fcaa49" ]];
                lb_zczxNumber.text = [NSString stringWithFormat:@"%d" ,(int)[(NSDecimalNumber *)[mission.data objectForKey:@"author"] integerValue] ];
            }
            else
            {
                [lb_zczxNumber setTextColor:[Helpers colorWithHexString:@"#B8B8B8" ]];
            }
            
            
            if ((int)[(NSDecimalNumber *)[mission.data objectForKey:@"cedit"] integerValue] ) {
                [lb_zbbgNumber setTextColor:[Helpers colorWithHexString:@"#fcaa49" ]];
                lb_zbbgNumber.text = [NSString stringWithFormat:@"%d" ,(int)[(NSDecimalNumber *)[mission.data objectForKey:@"cedit"] integerValue] ];
            }
            else
            {
                [lb_zbbgNumber setTextColor:[Helpers colorWithHexString:@"#B8B8B8" ]];
            }
            
            
            if ((int)[(NSDecimalNumber *)[mission.data objectForKey:@"external"] integerValue] ) {
                [lb_sgzjNumber setTextColor:[Helpers colorWithHexString:@"#fcaa49" ]];
                lb_sgzjNumber.text = [NSString stringWithFormat:@"%d" ,(int)[(NSDecimalNumber *)[mission.data objectForKey:@"external"] integerValue] ];
                
            }
            else
            {
                [lb_sgzjNumber setTextColor:[Helpers colorWithHexString:@"#B8B8B8" ]];
            }
            
            
            if ((int)[(NSDecimalNumber *)[mission.data objectForKey:@"editor"] integerValue] ) {
                [lb_bjgbNumber setTextColor:[Helpers colorWithHexString:@"#fcaa49" ]];
                
                lb_bjgbNumber.text = [NSString stringWithFormat:@"%d" ,(int)[(NSDecimalNumber *)[mission.data objectForKey:@"editor"] integerValue] ];
            }
            else
            {
                [lb_bjgbNumber setTextColor:[Helpers colorWithHexString:@"#B8B8B8" ]];
                
                
            }
            
            
            
            
            
        }
        else
        {
            lb_name.text = @"";
            
            lb_zczxNumber.text = @"0";
            lb_zbbgNumber.text = @"0";
            lb_sgzjNumber.text = @"0";
            lb_bjgbNumber.text = @"0";
            
            [lb_zczxNumber setTextColor:[Helpers colorWithHexString:@"#B8B8B8" ]];
            [lb_zbbgNumber setTextColor:[Helpers colorWithHexString:@"#B8B8B8" ]];
            [lb_sgzjNumber setTextColor:[Helpers colorWithHexString:@"#B8B8B8" ]];
            [lb_bjgbNumber setTextColor:[Helpers colorWithHexString:@"#B8B8B8" ]];
            
        }
        
        
        
    }
    @catch (NSException *exception)
    {
        NSString* theError=[exception reason];
        [Helpers showAlertMessage:theError];
        
    }
    
    
}




-(BOOL)IsLogining
{
    
    
    NSDecimalNumber  *f1 = (NSDecimalNumber *)userInfo.result;
    if((int)[f1 integerValue]==1)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (void)loadData{
    self.page++;
    if (self.refreshing) {
        self.page = 1;
        self.refreshing = NO;
        
    }
    
    if (self.page >= 3) {
        [TableViewMagazineCategory tableViewDidFinishedLoadingWithMessage:@"All loaded!"];
        TableViewMagazineCategory.reachedTheEnd  = YES;
    } else {
        [TableViewMagazineCategory tableViewDidFinishedLoading];
        TableViewMagazineCategory.reachedTheEnd  = NO;
        [TableViewMagazineCategory reloadData];
    }
    
    self.refreshing = NO;
    TableViewMagazineCategory.reachedTheEnd  = YES;
}


-(void)fetchMailInfo:(NSTimer *)theTimer
{
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    [ jsonResult GetMagazineUserMailInfo:(int)[[userInfo.data objectForKey:@"uid"] integerValue]];
    // [ jsonResult GetMagazineUserMailInfo:0];
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    
    if(jsonResult.JsonString_UserMailInfo !=nil)
    {
        [defaults setObject:jsonResult.JsonString_UserMailInfo forKey:@"userMailInfo"];
    }
    
}

#pragma mark - 获取杂志信息

-(void)GetLastMagazineCategory
{
    
    //
    //第一步，创建url
    NSURL *url = [NSURL URLWithString:@"http://www.cisszgty.cn:8000/tiyuzazhi/api/mag/list"];
    //第二步，创建请求
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //第三步，连接服务器
    [NSURLConnection  connectionWithRequest:request delegate:self];
    
    
    [TableViewMagazineCategory reloadData];
    
    
    
    
}
#pragma mark NSURL
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    // NSLog(@"%@",[res allHeaderFields]);
    self.receiveData = [NSMutableData data];
    
}
//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receiveData appendData:data];
}
//数据传完之后调用此方法
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    JsonString_LastMagazineCategory = [[NSString alloc]initWithData:self.receiveData encoding:NSUTF8StringEncoding];
    NSDictionary *dictionary = [JsonString_LastMagazineCategory JSONValue];
    magezine = [[MagazineSort alloc] initWithDictionary:dictionary];
    
    [TableViewMagazineCategory reloadData];
    
    NSDecimalNumber  *f1 = (NSDecimalNumber *)userInfo.result;
    if((int)[f1 integerValue]==1)
    {
        NSDecimalNumber *uid = (NSDecimalNumber *)[userInfo.data objectForKey:@"uid"]  ;
        
        
        [jsonResult GetMagazineUserUndoTask:(int)[uid  integerValue]];
        
        NSDictionary *workDictionary = [jsonResult.JsonString_UserUndoTask JSONValue];
        
        mission = [[Mission alloc] initWithDictionary:workDictionary];
        NSDecimalNumber  *f2 = (NSDecimalNumber *)mission.result;
        
        
        if((int)[f2 integerValue]==1)
        {
            if ((int)[(NSDecimalNumber *)[mission.data objectForKey:@"author"] integerValue] ) {
                [lb_zczxNumber setTextColor:[Helpers colorWithHexString:@"#fcaa49" ]];
                lb_zczxNumber.text = [NSString stringWithFormat:@"%d" ,(int)[(NSDecimalNumber *)[mission.data objectForKey:@"author"] integerValue] ];
            }
            else
            {
                [lb_zczxNumber setTextColor:[Helpers colorWithHexString:@"#B8B8B8" ]];
            }
            
            
            if ((int)[(NSDecimalNumber *)[mission.data objectForKey:@"cedit"] integerValue] ) {
                [lb_zbbgNumber setTextColor:[Helpers colorWithHexString:@"#fcaa49" ]];
                lb_zbbgNumber.text = [NSString stringWithFormat:@"%d" ,(int)[(NSDecimalNumber *)[mission.data objectForKey:@"cedit"] integerValue] ];
            }
            else
            {
                [lb_zbbgNumber setTextColor:[Helpers colorWithHexString:@"#B8B8B8" ]];
            }
            
            
            if ((int)[(NSDecimalNumber *)[mission.data objectForKey:@"external"] integerValue] ) {
                [lb_sgzjNumber setTextColor:[Helpers colorWithHexString:@"#fcaa49" ]];
                lb_sgzjNumber.text = [NSString stringWithFormat:@"%d" ,(int)[(NSDecimalNumber *)[mission.data objectForKey:@"external"] integerValue] ];
                
            }
            else
            {
                [lb_sgzjNumber setTextColor:[Helpers colorWithHexString:@"#B8B8B8" ]];
            }
            
            
            if ((int)[(NSDecimalNumber *)[mission.data objectForKey:@"editor"] integerValue] ) {
                [lb_bjgbNumber setTextColor:[Helpers colorWithHexString:@"#fcaa49" ]];
                
                lb_bjgbNumber.text = [NSString stringWithFormat:@"%d" ,(int)[(NSDecimalNumber *)[mission.data objectForKey:@"editor"] integerValue] ];
            }
            else
            {
                [lb_bjgbNumber setTextColor:[Helpers colorWithHexString:@"#B8B8B8" ]];
                
                
            }
            
            
        }
    }
    
}
//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    //  NSLog(@"%@",[error localizedDescription]);
    [self GetLastMagazineCategory];
}


#pragma mark -按钮动作
-(IBAction)LoginIntoPrivateCenter:(id)sender
{
    @try {
        if([self IsLogining])
        {
            [self  performSegueWithIdentifier:@"seguePrivateCenter2" sender:self];
            
        }
        else
        {
            [self  performSegueWithIdentifier:@"seguePrivateCenter1" sender:self];
        }
        
    }
    @catch (NSException *exception) {
        NSString* theError=[exception reason];
        [Helpers showAlertMessage:theError];
        
        
    }
    @finally {
        
    }
}

- (IBAction)DoEditorOffice:(id)sender
{
    @try {
        if([self IsLogining])
        {
            
            if([userInfo.data objectForKeyedSubscript:@"type"] !=nil)
            {
                if([[userInfo.data objectForKeyedSubscript:@"type"] isEqualToString:@"U"])  //U
                {
                    
                    NSDecimalNumber *uid = (NSDecimalNumber *)[userInfo.data objectForKey:@"uid"]  ;
                    
                    [ jsonResult GetLastMagazineexamArts:(int)[uid integerValue]];
                    
                    NSDictionary *dictionary = [jsonResult.JsonString_examArts JSONValue];
                    examArts = [[ExamArts alloc] initWithDictionary:dictionary];
                    
                    if (examArts.data.count>0) {
                        [self  performSegueWithIdentifier:@"SegueEditor" sender:self];
                    } else if ([[userInfo.data objectForKeyedSubscript:@"username"] isEqualToString:@"demo_test"]) {
                        [self  performSegueWithIdentifier:@"SegueEditor" sender:self];
                    }
                    else
                    {
                        
                        [Helpers showAlertMessage:@"没有待处理任务"];
                    }
                    
                    
                } else if ([[userInfo.data objectForKeyedSubscript:@"username"] isEqualToString:@"demo_test"]) {
                    [self  performSegueWithIdentifier:@"SegueEditor" sender:self];
                }
                else
                {
                    [Helpers showAlertMessage:@"无访问权限"];
                }
                
            }
            else
            {
                [Helpers showAlertMessage:@"无访问权限"];
            }
            
            
            
        }
        else
        {
            [Helpers showAlertMessage:@"请先登陆"];
        }
        
    }
    @catch (NSException *exception) {
        NSString* theError=[exception reason];
        [Helpers showAlertMessage:theError];
        
        
    }
    @finally {
        
    }
    
}


- (IBAction)unwindMainViewController:(UIStoryboardSegue *)segue
{
    
    
    UIViewController *sourceViewController = segue.sourceViewController;
    
    if ([sourceViewController isKindOfClass:[PrivateInfo class]]) {
        userInfo = nil;
        [self initView];
    }
    else if ([sourceViewController isKindOfClass:[RegisterDone class]]) {
        [self initView];
    }
}

- (IBAction)DoEnterAuthorCenter:(id)sender {
    
    if([self IsLogining])
    {
        
        if([userInfo.data objectForKeyedSubscript:@"type"] !=nil)
        {
            if([[userInfo.data objectForKeyedSubscript:@"type"] isEqualToString:@"P"])    //P
            {
                
                
                NSDecimalNumber *uid = (NSDecimalNumber *)[userInfo.data objectForKey:@"uid"]  ;
                
                [ jsonResult GetLastMagazineexamPrivateArts:(int)[uid integerValue]];
                
                NSDictionary *dictionary = [jsonResult.JsonString_examArts JSONValue];
                examPrivateArts = [[ExamPrivateArts alloc] initWithDictionary:dictionary];
                
                NSDecimalNumber *tid = (NSDecimalNumber *)userInfo.result;
                
                
                if ((int)[tid integerValue]==1) {
                    
                    [self  performSegueWithIdentifier:@"SegueAuthorCenter" sender:self];
                }
                else
                {
                    [Helpers showAlertMessage:@"没有待处理任务"];
                }
                
                
            } else if ([[userInfo.data objectForKeyedSubscript:@"username"] isEqualToString:@"demo_test"]) {
                [self  performSegueWithIdentifier:@"SegueAuthorCenter" sender:self];
            }
            else
            {
                
                [Helpers showAlertMessage:@"无访问权限"];
            }
        }
        else
        {
            [Helpers showAlertMessage:@"无访问权限"];
        }
        
        
        
    }
    else
    {
        [Helpers showAlertMessage:@"请先登陆"];
    }
    
}

- (IBAction)DoSearch:(id)sender {
    [jsonResult GetSummarySearchResult:searchTextfield.text index:0];
    keywords = searchTextfield.text;
    NSDictionary *dictionary = [jsonResult.JsonString_SummarySearchResult JSONValue];
    articles = [[MagazineArticles alloc] initWithDictionary:dictionary];
    NSDecimalNumber  *f1 = (NSDecimalNumber *)articles.result;
    if((int)[f1 integerValue]==1)
    {
        if(articles.data.count>0)
        {
            [self  performSegueWithIdentifier:@"segueSummarySearch" sender:self];
        }
        else
        {
            [Helpers  showAlertMessage:@"未找到搜索结果"];
        }
        
    }
    else
    {
        [Helpers  showAlertMessage:@"未找到搜索结果"];
    }
    
}

- (IBAction)DoEnterSG:(id)sender
{
    
    if([self IsLogining])
    {
        
        if([userInfo.data objectForKeyedSubscript:@"type"] !=nil)
        {
            if([[userInfo.data objectForKeyedSubscript:@"type"] isEqualToString:@"S"])  //S
            {
                
                NSDecimalNumber *uid = (NSDecimalNumber *)[userInfo.data objectForKey:@"uid"]  ;
                
                [ jsonResult GetLastMagazineexamArts:(int)[uid integerValue]];
                
                NSDictionary *dictionary = [jsonResult.JsonString_examArts JSONValue];
                examArts = [[ExamArts alloc] initWithDictionary:dictionary];
                
                if (examArts.data.count>0) {
                    
                    [self  performSegueWithIdentifier:@"SegueSG" sender:self];
                    
                }
                else
                {
                    [Helpers showAlertMessage:@"没有待处理任务"];
                }
            } else if ([[userInfo.data objectForKeyedSubscript:@"username"] isEqualToString:@"demo_test"]) {
                [self  performSegueWithIdentifier:@"SegueSG" sender:self];
            } else {
                [Helpers showAlertMessage:@"无访问权限"];
            }
            
        }
        else
        {
            [Helpers showAlertMessage:@"无访问权限"];
        }
        
        
    }
    else
    {
        [Helpers showAlertMessage:@"请先登陆"];
    }
    
    
}



- (IBAction)DoEnterMasterEditor:(id)sender
{
    
    if([self IsLogining])
    {
        if([userInfo.data objectForKeyedSubscript:@"type"] !=nil)
        {
            if([[userInfo.data objectForKeyedSubscript:@"type"] isEqualToString:@"C"])   //C
            {
                NSDecimalNumber *uid = (NSDecimalNumber *)[userInfo.data objectForKey:@"uid"]  ;
                
                [ jsonResult GetLastMagazineexamArts:(int)[uid integerValue]];
                
                NSDictionary *dictionary = [jsonResult.JsonString_examArts JSONValue];
                examArts = [[ExamArts alloc] initWithDictionary:dictionary];
                
                
                if (examArts.data.count>0) {
                    
                    
                    [self  performSegueWithIdentifier:@"SegueMasterEditor" sender:self];
                }
                else
                {
                    
                    [Helpers showAlertMessage:@"没有待处理任务"];
                }
                
                
                
            } else if ([[userInfo.data objectForKeyedSubscript:@"username"] isEqualToString:@"demo_test"]) {
                [self  performSegueWithIdentifier:@"SegueMasterEditor" sender:self];
            }
            else
            {
                [Helpers showAlertMessage:@"无访问权限"];
            }
        } else if ([[userInfo.data objectForKeyedSubscript:@"username"] isEqualToString:@"demo_test"]) {
            [self  performSegueWithIdentifier:@"SegueMasterEditor" sender:self];
        } else
        {
            [Helpers showAlertMessage:@"无访问权限"];
        }
        
        
    }
    else
    {
        [Helpers showAlertMessage:@"请先登陆"];
    }
    
    
}



#pragma mark - PullingRefreshTableViewDelegate
- (void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView
{
    self.refreshing = YES;
    [self performSelector:@selector(loadData) withObject:nil afterDelay:1.f];
}

- (NSDate *)pullingTableViewRefreshingFinishedDate{
    NSDateFormatter *df = [[NSDateFormatter alloc] init ];
    df.dateFormat = @"yyyy-MM-dd HH:mm";
    
    NSDate *date = [NSDate date];
    return date;
}

- (void)pullingTableViewDidStartLoading:(PullingRefreshTableView *)tableView
{
    
    [self performSelector:@selector(loadData) withObject:nil afterDelay:1.f];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.TableViewMagazineCategory tableViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self.TableViewMagazineCategory tableViewDidEndDragging:scrollView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return kSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
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
    
    CategoryCell *cell = (CategoryCell *)[tableView
                                          dequeueReusableCellWithIdentifier:@"CategoryCell"];
    
    
    cell.title.text = [[magezine.data objectAtIndex:indexPath.row] title];
    
    cell.subTitle.text = [[magezine.data objectAtIndex:indexPath.row] subTitle];
    
    //NSRange range = NSMakeRange(5, <#NSUInteger len#>)
    cell.lb_pushno.text = [[[magezine.data objectAtIndex:indexPath.row] publishNo  ]  substringFromIndex:5];
    if ([[[magezine.data objectAtIndex:indexPath.row] publishNo  ]  substringFromIndex:5]!=nil)
    {
        //[Helpers  exchangeNtoC:[[[magezine.data objectAtIndex:indexPath.row] publishNo  ]  substringFromIndex:5]];
        
        cell.lb_pushno.text =[NSString stringWithFormat:@"第%@期" , [Helpers  exchangeNtoC:[[[magezine.data objectAtIndex:indexPath.row] publishNo  ]  substringFromIndex:5]]];
        
    }
    
    
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/mm/dd"];
    NSDate *date = [formatter dateFromString:[[magezine.data objectAtIndex:indexPath.row] publishTime]];
    cell.lb_pushtime.text = [formatter stringFromDate:date];
    
    
    if(indexPath.row%2==1)
    {
        cell.cateImage1.backgroundColor =   [Helpers colorWithHexString:@"113d7d"];
        cell.cateImage2.backgroundColor =  [Helpers colorWithHexString:@"113d7d"];
    }
    else
    {
        cell.cateImage1.backgroundColor =   [Helpers colorWithHexString:@"DF1F68"];
        cell.cateImage2.backgroundColor =  [Helpers colorWithHexString:@"DF1F68"];
        
    }
    
    return cell;
}


#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //  体育科技 ZoneOne
    //  体育科学ZoneTwo
    
    
    if(magezine.data.count==0)
    {
        
        [Helpers showAlertMessage:@"没有文章"];
    }
    else
    {
        if(indexPath.row%2==0)
        {
            [self  performSegueWithIdentifier:@"segueZoneOne" sender:tableView];
        }
        else
        {
            [self  performSegueWithIdentifier:@"segueZoneOne" sender:tableView];
            
            
        }
    }
    
    
}


#pragma mark - SEGUE


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"segueZoneOne"])
    {
        UITableView *tableview = (id)sender;
        
        int magID=0;
        
        magID =(int)[[[magezine.data objectAtIndex:tableview.indexPathForSelectedRow.row] uid ] integerValue];
        
        [segue.destinationViewController setValue:magezine forKey:@"magazine"];
        [segue.destinationViewController setValue:[NSString stringWithFormat:@"%d" ,magID] forKey:@"magID"];
        [segue.destinationViewController setValue:[NSString stringWithFormat:@"%d" ,(int)tableview.indexPathForSelectedRow.row] forKey:@"sortIndex"];
        
    }
    if([segue.identifier isEqualToString:@"seguePrivateCenter1"])
    {
        
    }
    if([segue.identifier isEqualToString:@"seguePrivateCenter2"])
    {
        [segue.destinationViewController setValue:userInfo forKey:@"userInfo"];
        [segue.destinationViewController setValue:mission forKey:@"mission"];
    }
    if([segue.identifier isEqualToString:@"SegueEditor"])
    {
        
        [segue.destinationViewController setValue:userInfo forKey:@"userInfo"];
    }
    if([segue.identifier isEqualToString:@"segueSummarySearch"])
    {
        if (articles!=nil) {
            [segue.destinationViewController setValue:articles forKey:@"articles"];
            [segue.destinationViewController setValue:keywords forKey:@"keywords"];
            
            
        }
        
    }
    if([segue.identifier isEqualToString:@"SegueAuthorCenter"])
    {
        if (examPrivateArts!=nil) {
            [segue.destinationViewController setValue:examPrivateArts forKey:@"examPrivateArts"];
            
            
            
        }
        
    }
    if([segue.identifier isEqualToString:@"SegueSG"])
    {
        if (examArts!=nil) {
            [segue.destinationViewController setValue:userInfo forKey:@"userInfo"];
            
            
            
        }
        
    }
    
    if([segue.identifier isEqualToString:@"SegueMasterEditor"])
    {
        if (examArts!=nil) {
            [segue.destinationViewController setValue:userInfo forKey:@"userInfo"];
            
            
            
        }
        
    }
    
    
    
    
    
}


#pragma mark - 搜索
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [jsonResult GetSummarySearchResult:searchBar.text index:0];
    keywords = searchBar.text;
    NSDictionary *dictionary = [jsonResult.JsonString_SummarySearchResult JSONValue];
    articles = [[MagazineArticles alloc] initWithDictionary:dictionary];
    NSDecimalNumber  *f1 = (NSDecimalNumber *)articles.result;
    if((int)[f1 integerValue]==1)
    {
        if(articles.data.count>0)
        {
            [self  performSegueWithIdentifier:@"segueSummarySearch" sender:searchBar];
        }
        else
        {
            [Helpers  showAlertMessage:@"未找到搜索结果"];
        }
        
    }
    else
    {
        [Helpers  showAlertMessage:@"未找到搜索结果"];
    }
    
    
    
}


#pragma mark - TextDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(searchTextfield == textField)
    {
        [jsonResult GetSummarySearchResult:searchTextfield.text index:0];
        keywords = searchTextfield.text;
        NSDictionary *dictionary = [jsonResult.JsonString_SummarySearchResult JSONValue];
        articles = [[MagazineArticles alloc] initWithDictionary:dictionary];
        NSDecimalNumber  *f1 = (NSDecimalNumber *)articles.result;
        if((int)[f1 integerValue]==1)
        {
            if(articles.data.count>0)
            {
                
                [self  performSegueWithIdentifier:@"segueSummarySearch" sender:self];
                
            }
            else
            {
                [Helpers  showAlertMessage:@"未找到搜索结果"];
                
            }
            
        }
        else
        {
            
            [Helpers  showAlertMessage:@"未找到搜索结果"];
            
        }
        
        
    }
    else
    {
        
    }
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(searchTextfield == textField)
    {
        searchTextfield.text = @"";
    }
}

@end
