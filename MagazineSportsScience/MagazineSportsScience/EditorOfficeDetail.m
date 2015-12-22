//
//  EditorOfficeDetail.m
//  MagazineSportsScience
//
//  Created by joan on 14/12/13.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import "EditorOfficeDetail.h"

@implementation EditorOfficeDetail

@synthesize TableEditorOfficeDetail;
@synthesize examArtsData;
@synthesize userInfo;
@synthesize examHist;
@synthesize summary;
@synthesize jsonResult;
@synthesize tableIndexPath;
@synthesize expandArray;



-(void)viewDidLoad
{
    
    [super viewDidLoad];
    [self initView];
    
}

-(void)initView
{
    expandArray = [[NSMutableArray alloc] init];
    jsonResult = [[JsonResult alloc] init];
    int aid = (int)[examArtsData.uid integerValue];
    [jsonResult GetMagazineexamHist:aid delegateControl:self];
    
    
}

#pragma mark - 按钮事件

- (IBAction)ReturnSuper:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

-(IBAction)expand:(id)sender
{
    
    int tag = (int)((UIButton *)sender).tag;
    
    tableIndexPath = [NSIndexPath indexPathForRow:tag inSection:0];
    if ([self IsIndexForExpand:tag])
    {
        
        for (NSInteger i = 0; i < [expandArray count]; i++)
        {
            NSIndexPath *path = (NSIndexPath *)expandArray[i];
            if (path.row == tag)
            {
                [expandArray  removeObjectAtIndex:i];
            }
        }
        
    }
    else
    {
        [expandArray addObject:tableIndexPath];
        
    }
    
    NSArray *indexPaths =[NSArray arrayWithObject:tableIndexPath];
    EditorOfficeDetailCell *cell= (EditorOfficeDetailCell *)[TableEditorOfficeDetail cellForRowAtIndexPath:tableIndexPath];
    
    switch (cell.tag) {
        case 0:
            [cell.btn_arrow setBackgroundImage:[UIImage imageNamed:@"btn_arrowUp3.png"] forState:UIControlStateNormal];
            //            [cell.viewContain setFrame:CGRectMake(cell.viewContain.frame.origin.x, cell.viewContain.frame.origin.y
            //                                                  ,cell.viewContain.frame.size.width, 300)];
            //            [cell.contentView setFrame:CGRectMake(cell.contentView.frame.origin.x, cell.contentView.frame.origin.y
            //                                                  ,cell.contentView.frame.size.width, 300)];
            
            break;
        case 1:
            [cell.btn_arrow setBackgroundImage:[UIImage imageNamed:@"btn_arrowUp2.png"] forState:UIControlStateNormal];
            
            break;
        default:
            break;
    }
    //
    //    [cell.contentView  setNeedsLayout];
    //    [cell.contentView layoutIfNeeded];
    
    [TableEditorOfficeDetail reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    
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
                                      dequeueReusableCellWithIdentifier:@"EditorOfficeDetailCell"];
    cell.btn_arrow.tag = indexPath.row;
    cell.tag = 0;
    if([[examHist.data  objectAtIndex:indexPath.row] phaseName]!=nil)
    {
        cell.lb_state.text = [[examHist.data  objectAtIndex:indexPath.row] phaseName];
    }
    int k = (int)(examHist.data.count-indexPath.row);
    cell.lb_Number.text = [NSString stringWithFormat:@"%d",k];
    if([[examHist.data  objectAtIndex:indexPath.row]  comment]!=nil)
    {
    cell.lb_comment.text =[[examHist.data  objectAtIndex:indexPath.row]  comment];
    }
    if( [[examHist.data  objectAtIndex:indexPath.row] status] !=nil)
    {
        
        NSDecimalNumber  *f1 = (NSDecimalNumber *)[[examHist.data  objectAtIndex:indexPath.row] status] ;
        
        if((int)[f1  integerValue]==0)
        {
            cell.tag = [f1 integerValue];
            [cell.img_state  setImage:[UIImage imageNamed:@"bk_unfinished.png"]];
            [cell.img_viewstate setImage:[UIImage imageNamed:@"bk_oraTY.png"]];
            cell.lb_Number.textColor =[Helpers colorWithHexString:@"fdc68f"];
            cell.lb_info.textColor = [Helpers colorWithHexString:@"a31515"];
           
        }
        else
        {
            cell.tag = [f1 integerValue];
            [cell.img_state  setImage:[UIImage imageNamed:@"bk_finished.png"]];
            [cell.img_viewstate setImage:[UIImage imageNamed:@"bk_whiteTY.png"]];
            cell.lb_Number.textColor =[Helpers colorWithHexString:@"e6e6e6"];
            cell.lb_info.textColor = [Helpers colorWithHexString:@"6b6f70"];
            
            
        }
        NSString *examineStart=@"";
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateFormat = @"yyyy-MM-dd HH:mm";
        
        NSString *examineEnd = @"   截稿日期   ";
        if( [[examHist.data  objectAtIndex:indexPath.row] examineStart] !=nil)
        {
            
            examineStart = [[[examHist.data  objectAtIndex:indexPath.row]   examineStart ] substringToIndex:10];
            
        }
        if( [[examHist.data  objectAtIndex:indexPath.row] examineEnd] !=nil)
        {
            examineEnd = [examineEnd stringByAppendingString: [[[examHist.data  objectAtIndex:indexPath.row] examineEnd] substringToIndex:10]];
            
            
        }
        cell.lb_info.text = [examineStart stringByAppendingString:examineEnd ];
        
        
        if([self IsIndexForExpand:indexPath.row])
        {
            if((int)[f1  integerValue]==0)
            {
             [cell.btn_arrow setBackgroundImage:[UIImage imageNamed:@"btn_arrowUp3.png"] forState:UIControlStateNormal];
            
            }
            else
            {
            [cell.btn_arrow setBackgroundImage:[UIImage imageNamed:@"btn_arrowUp2.png"] forState:UIControlStateNormal];
            }
        }
        else
        {
            if((int)[f1  integerValue]==0)
            {
                [cell.btn_arrow setBackgroundImage:[UIImage imageNamed:@"btn_arrowDown3.png"] forState:UIControlStateNormal];
                
            }
            else
            {
                [cell.btn_arrow setBackgroundImage:[UIImage imageNamed:@"btn_arrowDown2.png"] forState:UIControlStateNormal];
            }

        }
    }
    
    
    return cell;
}

- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(BOOL)IsIndexForExpand:(NSInteger)index
{
    for (NSInteger i = 0; i < [expandArray count]; i++)
    {
        NSIndexPath *path = (NSIndexPath *)expandArray[i];
        if (path.row == index)
        {
            return  YES;
        }
    }
    return NO;
}

#pragma mark - Table view action delegate


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int aid = (int)[examArtsData.uid integerValue];
    [jsonResult GetMagazineexamsummary:aid];
    NSDictionary *resultdictionary = [jsonResult.JsonString_examsummary JSONValue];
    summary = [[Summary alloc] initWithDictionary:resultdictionary];
    NSDecimalNumber  *f1 = (NSDecimalNumber *)summary.result;
    if((int)[f1 integerValue]==1)
    {
        [self  performSegueWithIdentifier:@"segueProcessToSummary" sender:self];
    }
    else
    {
        [Helpers showAlertMessage:@"获取文章失败"];
    }
    
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    EditorOfficeDetailCell *cell ;
    cell = (EditorOfficeDetailCell *)[tableView
                                      dequeueReusableCellWithIdentifier:@"EditorOfficeDetailCell"];
    
    
    if ([self IsIndexForExpand:indexPath.row]) {
        return 130;
    }
    return  85;
}



#pragma mark - segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"segueProcessToSummary"])
    {
        [segue.destinationViewController setValue:summary forKey:@"summary"];
        [segue.destinationViewController setValue:@"1" forKey:@"pageFlag"];

        
    }
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
    [TableEditorOfficeDetail reloadData];
    
}

//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    NSLog(@"%@",[error localizedDescription]);
}



@end
