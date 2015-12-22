//
//  SGXQ.m
//  MagazineSportsScience
//
//  Created by joan on 15/1/6.
//  Copyright (c) 2015年 synergyworks. All rights reserved.
//

#import "SGXQ.h"

@implementation SGXQ

@synthesize btn_return;
@synthesize examPrivateArts;
@synthesize TableSGXQDetail;
@synthesize examHist;
@synthesize jsonResult;

- (void)viewDidLoad {
    [super viewDidLoad];
    jsonResult = [[JsonResult alloc] init];
    int aid = (int)[[examPrivateArts.data objectForKey:@"uid" ] integerValue];
    [jsonResult GetMagazineexamHist:aid delegateControl:self];
    TableSGXQDetail.delegate = self;
    TableSGXQDetail.dataSource = self;
       // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 按钮事件
- (IBAction)returnSuper:(id)sender
{
 [self dismissViewControllerAnimated:YES completion:^{}];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return examHist.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EditorOfficeDetailCell *cell ;
    cell = (EditorOfficeDetailCell *)[tableView
                                      dequeueReusableCellWithIdentifier:@"tableCellState"];
     cell.lb_timespot.text = [[[examHist.data  objectAtIndex:indexPath.row] examineStart]  substringToIndex:10];
    cell.lb_detailstate.text =[[examHist.data  objectAtIndex:indexPath.row]  phaseName];

    if([[examHist.data  objectAtIndex:indexPath.row]  examineFinish] == nil)
    {
        cell.lb_detailcomment.text = @"        专家正在审稿，请耐心等待，感谢你的支持";
    }
    else
    {
        cell.lb_detailcomment.text = @"        已审核";
     }
    
    return cell;
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
    jsonResult.JsonString_examHist = [[NSString alloc]initWithData:jsonResult.receiveData encoding:NSUTF8StringEncoding];
    NSDictionary *resultdictionary = [jsonResult.JsonString_examHist JSONValue];
    examHist = [[ExamHist alloc] initWithDictionary:resultdictionary];
    [TableSGXQDetail reloadData];
    
}

//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    NSLog(@"%@",[error localizedDescription]);
}



@end
