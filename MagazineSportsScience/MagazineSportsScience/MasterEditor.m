//
//  MasterEditor.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/15.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "MasterEditor.h"

@implementation MasterEditor
@synthesize userInfo;
@synthesize examArts;
@synthesize examArtsData;
@synthesize AllexamArts;
@synthesize TableExamArts;
@synthesize jsonResult;
@synthesize con1;
@synthesize page;
@synthesize IsRefreshing;
@synthesize IsLoading;
@synthesize Asc;
@synthesize step;
@synthesize btn_filterDate;
@synthesize btn_filterProcess;
@synthesize viewDate;
@synthesize viewProcess;
@synthesize lb_process;

- (void)viewDidLoad {
    [super viewDidLoad];
    jsonResult = [[JsonResult alloc] init];
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)initView
{
    
    if([self IsLogining])
    {
        AllexamArts = [[ExamArts alloc] init];
        
        Asc = @"0";
        step = @"0";
        [self requestData:0 of:0 asc:0];
        
        TableExamArts.pullingDelegate =self;
        
        TableExamArts.headerOnly = NO;
        
        [TableExamArts initView];
        
        
        viewProcess.layer.shadowOffset = CGSizeMake(0, 1);
        viewProcess.layer.shadowOpacity = 0.5;
        viewProcess.layer.shadowRadius = 1.0;
        viewProcess.layer.borderWidth = 0.1;
        
        viewDate.layer.shadowOffset = CGSizeMake(0, 1);
        viewDate.layer.shadowOpacity = 0.5;
        viewDate.layer.shadowRadius = 1.0;
        viewDate.layer.borderWidth = 0.1;
        
        
        
    }
    
}

-(void)requestData:(int)stepID of:(int)of asc:(int)isASC
{
    
    NSDecimalNumber *uid = (NSDecimalNumber *)[userInfo.data objectForKey:@"uid"]  ;
    
    [jsonResult  GetMagazineexamArts:(int)[uid integerValue] step:stepID  of:of asc:(int)[Asc integerValue] con:con1 deleteControl:self];
    
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

-(BOOL)IsDataFetched
{
    NSDecimalNumber  *f1 = (NSDecimalNumber *)examArts.result;
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
    
    if (self.IsLoading)
    {
        [self requestData: (int)[step  integerValue] of:(int)page asc:(int)[Asc integerValue ]];
    }
    
    
    
}

#pragma mark - 按钮事件

- (IBAction)ReturnSuper:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}

- (IBAction)returnSuper2:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (IBAction)DoFilterDate:(id)sender
{
    if([self IsLogining])
    {
        
        if(![self IsLoading])
        {
            if([Asc isEqualToString:@"0"])
            {
                
                [btn_filterDate setImage:[UIImage imageNamed:@"btn_arrowUp1.png"] forState:UIControlStateNormal];
                
                
                Asc = @"1";
                page = 0;
                
                [self requestData:(int)[step integerValue] of:(int)page asc:(int)[Asc integerValue] ];
                
            }
            else
            {
                [btn_filterDate setImage:[UIImage imageNamed:@"btn_arrowDown1.png"] forState:UIControlStateNormal];
                page = 0;
                
                Asc = @"0";
                [self requestData:(int)[step integerValue] of:(int)page asc:(int)[Asc integerValue] ];
                
            }
        }
    }
}

- (IBAction)DoFilterProcess:(id)sender {
    [self setModalPresentationStyle:UIModalPresentationCurrentContext];
    //
    if([self IsLogining])
    {
        
        if(![self IsLoading])
        {
            [self  performSegueWithIdentifier:@"segueFilterProcessFromMasterEditor" sender:self];
        }
    }
    
}


- (IBAction)unwindMasterEditorViewController:(UIStoryboardSegue *)segue
{
    
    
    UIViewController *sourceViewController = segue.sourceViewController;
    
    if ([sourceViewController isKindOfClass:[FilterProcessControl class]])
    {
        
        if([self IsLogining])
        {
            
            if(![self IsLoading])
            {
                
                
                
                page = 0;
                
                
                [self requestData:(int)[step integerValue] of:(int)page asc:(int)[Asc integerValue] ];
                
                
            }
        }
        
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
    return AllexamArts.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EditorOfficeCell *cell ;
    cell = (EditorOfficeCell *)[tableView
                                dequeueReusableCellWithIdentifier:@"EditorOfficeCell"];
    if(tableView == TableExamArts)
    {
        cell.lb_title.text = [[ AllexamArts.data objectAtIndex:indexPath.row]  title ];
        if([[ AllexamArts.data objectAtIndex:indexPath.row]  opName ] !=nil)
        {
            cell.lb_dealman.text =  [@"当前处理人:" stringByAppendingString: [[ AllexamArts.data objectAtIndex:indexPath.row]  opName ] ];
        }
        else
        {
            cell.lb_dealman.text =  @"当前处理人:" ;
        }
        if([[ AllexamArts.data objectAtIndex:indexPath.row]  draftNo ] !=nil)
        {
            cell.lb_pno.text = [ @"稿号:" stringByAppendingString :[[ AllexamArts.data objectAtIndex:indexPath.row]  draftNo ]];
        }
        else
        {
            cell.lb_pno.text =  @"稿号:" ;
        }
        if ([[ AllexamArts.data objectAtIndex:indexPath.row]  submitDate ]!=nil) {
            cell.lb_time.text = [@"投稿时间:" stringByAppendingString : [[[ AllexamArts.data objectAtIndex:indexPath.row]  submitDate ] substringToIndex:10 ] ] ;
           
        }
        else
        {
            cell.lb_time.text = @"投稿时间:";
        }
        
    }
    return cell;
}




#pragma mark - Table view action delegate


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self  performSegueWithIdentifier:@"segueEditorDetailFromMasterEditor" sender:tableView];
    
    
}

#pragma mark - SEGUE

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"segueEditorDetailFromMasterEditor"])
    {
        UITableView *tableview = (id)sender;
        
        examArtsData= [examArts.data objectAtIndex:tableview.indexPathForSelectedRow.row]  ;
        
        [segue.destinationViewController setValue:examArtsData forKey:@"examArtsData"];
    }
       if ([segue.identifier isEqualToString:@"segueFilterProcessFromMasterEditor"]) {
        [segue.destinationViewController setValue:@"C" forKey:@"role"];
    }

}

#pragma mark - PullingRefreshTableViewDelegate
- (void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView
{
    //下拉开始刷新
    //  self.IsRefreshing = YES;
    //  [self performSelector:@selector(loadData) withObject:nil afterDelay:1.f];
    
    [self.TableExamArts tableViewDidFinishedLoading];
    self.TableExamArts.reachedTheEnd  = NO;
    [self.TableExamArts reloadData];
}


- (NSDate *)pullingTableViewRefreshingFinishedDate{
    NSDateFormatter *df = [[NSDateFormatter alloc] init ];
    df.dateFormat = @"yyyy-MM-dd HH:mm";
    
    NSDate *date = [NSDate date];
    return date;
}

- (void)pullingTableViewDidStartLoading:(PullingRefreshTableView *)tableView
{
    self.IsLoading = YES;
    [self performSelector:@selector(loadData) withObject:nil afterDelay:1.f];
}

//初始不必改动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.TableExamArts tableViewDidScroll:scrollView];
}

//初始不必改动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self.TableExamArts tableViewDidEndDragging:scrollView];
    
    
}




#pragma mark NSURL
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    //        NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    
    jsonResult.receiveData = [NSMutableData data];
    
    
}
//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    [jsonResult.receiveData appendData:data];
    
}
//数据传完之后调用此方法
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //异步请求完成数据会送完成后加载一次数据记录当前偏移量
    jsonResult.JsonString_examArts = [[NSString alloc]initWithData:jsonResult.receiveData encoding:NSUTF8StringEncoding];
    NSDictionary *dictionary = [jsonResult.JsonString_examArts JSONValue];
    examArts = [[ExamArts alloc] initWithDictionary:dictionary];
    
    
    if([self IsDataFetched])
    {
        if((int)page==0)
        {
            AllexamArts = [[ExamArts alloc] init];
        }
        
        self.page ++;
        if(AllexamArts.data==0)
        {
            AllexamArts =examArts;
        }
        else
        {
            [AllexamArts.data addObjectsFromArray:examArts.data];
        }
        [TableExamArts tableViewDidFinishedLoading];
        TableExamArts.reachedTheEnd  = NO;
        [TableExamArts reloadData];
        
        self.IsLoading = NO;
    }
    
}

//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    NSLog(@"%@",[error localizedDescription]);
}


@end
