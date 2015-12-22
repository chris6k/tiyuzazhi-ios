//
//  JsonResult.m
//  MagazineSportsScience
//
//  Created by joan on 14/11/30.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonResult.h"

@implementation JsonResult

@synthesize receiveData;

bool finished = false;

@synthesize JsonString_LastMagazineCategory;

@synthesize JsonString_MagazineArticles;

@synthesize JsonString_SystemBoard;

@synthesize JsonString_UserData;

@synthesize JsonString_UserUndoTask;

@synthesize JsonString_UserMailInfo;

@synthesize JsonString_examArts;

@synthesize JsonString_examHist;

@synthesize JsonString_examsummary;

@synthesize JsonString_SummarySearchResult;


#pragma mark -  获取方法

//获取杂志信息
-(NSString *)GetLastMagazineCategory
{
    @try {
//        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.cisszgty.cn:8000/tiyuzazhi/api/mag/list"]];
//        
//        // Perform request and get JSON back as a NSData object
//        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//        
//        if(response == nil)
//        {
//            return @"";
//        }
        // Get JSON as a NSString from NSData response
        
        
     
        //第一步，创建url
        NSURL *url = [NSURL URLWithString:@"http://www.cisszgty.cn:8000/tiyuzazhi/api/mag/list"];
        //第二步，创建请求
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        //第三步，连接服务器
        [NSURLConnection connectionWithRequest:request delegate:self];
        
    
        
        
        
    }
    @catch (NSException *exception) {
        return @"";
    }
    
    
    
}

//获取杂志目录信息
-(NSString *)GetMagazineArticles:(NSString *)mgid
{
    
    // Prepare URL request to download statuses from Twitter
    @try {
    
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[ @"http://www.cisszgty.cn:8000/tiyuzazhi/api/mag/articles?magId=" stringByAppendingString:mgid]]];
        
        // Perform request and get JSON back as a NSData object
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        if(response == nil)
        {
            return @"";
        }
        // Get JSON as a NSString from NSData response
        
        JsonString_MagazineArticles = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
        return JsonString_MagazineArticles;
    }
    @catch (NSException *exception) {
        return @"";
    }
    
    
    
}



-(void)GetMagazineArticles:(NSString *)mgid detective:(NSString *)detective delegateControl:(id)control
{
    NSString *str = @"";
    if([detective isEqual:@"0"])
    {
        str =[@"http://www.cisszgty.cn:8000/tiyuzazhi/api/mag/articles?magId=" stringByAppendingString:mgid];
    }
    
    if ([detective isEqual:@"1"]) {
        str =[@"http://www.cisszgty.cn:8000/tiyuzazhi/api/mag/prevMag?magId=" stringByAppendingString:mgid];
    }
    if([detective isEqual:@"2"])
    {
        str =[@"http://www.cisszgty.cn:8000/tiyuzazhi/api/mag/nextMag?magId=" stringByAppendingString:mgid];

    }
    NSURL *url = [NSURL URLWithString:str];


    //第二步，创建请求
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //第三步，连接服务器
    [NSURLConnection  connectionWithRequest:request delegate:control];
    

}


//获取系统公告
-(NSString *)GetMagazineSystemBoard
{
    // Prepare URL request to download statuses from Twitter
    @try {
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: @"http://www.cisszgty.cn:8000/tiyuzazhi/api/mag/news" ]];
        
        // Perform request and get JSON back as a NSData object
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        if(response == nil)
        {
            return @"";
        }
        // Get JSON as a NSString from NSData response
        
        JsonString_SystemBoard= [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
        return JsonString_SystemBoard;
    }
    @catch (NSException *exception) {
        return @"";
    }
    

}

//用户信息
-(NSString *)GetMagazineUserData:(NSString *)username password:(NSString *) password
{
    @try {
//        NSURL *url =[NSURL URLWithString:[ @"http://www.cisszgty.cn:8000/tiyuzazhi/api/user/login?" stringByAppendingFormat:@"username=%@&password=%@" ,username,password  ]];
//        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[ @"http://www.cisszgty.cn:8000/tiyuzazhi/api/user/login?" stringByAppendingFormat:@"username=%@&password=%@" ,username,password  ]]];
//        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
//        [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET

//        // Perform request and get JSON back as a NSData object
//        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
//        NSString *str = @"type=focus-c";//设置参数
//        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
//        [request setHTTPBody:data];
//        //第三步，连接服务器
//        
//        NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//        
//        JsonString_UserData = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
//        

        
//        if(received == nil)
//        {
//            return @"";
//        }
        // Get JSON as a NSString from NSData response
        
      //  JsonString_UserData= [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
        
       NSURL *url =[NSURL URLWithString:[ @"http://www.cisszgty.cn:8000/tiyuzazhi/api/user/login?" stringByAppendingFormat:@"username=%@&password=%@" ,username,password  ]];
        //第二步，创建请求
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15];
        [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
        NSString *str = @"type=focus-c";//设置参数
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:data];
        //第三步，连接服务器
        
        NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        JsonString_UserData = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
        
        

        return JsonString_UserData;
    }
    @catch (NSException *exception) {
        return @"";
    }

}


//用户信息未处理信息
-(NSString *)GetMagazineUserUndoTask:(int)uid
{
    @try {
        
        NSString *url = [NSString stringWithFormat: @"http://www.cisszgty.cn:8000/tiyuzazhi/api/user/todo?uid=%d" ,uid ];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url ]];
      
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        
        
        
        if(response == nil)
        {
            return @"";
        }
        // Get JSON as a NSString from NSData response
        
        JsonString_UserUndoTask= [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
        return JsonString_UserUndoTask;
//        NSURL *url =[NSURL URLWithString:[ @"http://www.cisszgty.cn:8000/tiyuzazhi/api/user/todo?uid=" stringByAppendingFormat:@"%@" ,[NSString stringWithFormat:@"%d", uid ] ]];
//        //第二步，创建请求
//        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
//        [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
//        NSString *str = @"type=focus-c";//设置参数
//        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
//        [request setHTTPBody:data];
//        //第三步，连接服务器
//        
//        NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
  //      JsonString_UserUndoTask = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
        return JsonString_UserUndoTask;
//
    }
    @catch (NSException *exception) {
        return @"";
    }
    
}

//获取用户邮件信息
-(NSString *)GetMagazineUserMailInfo:(int)uid
{
    @try {
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[ @"http://www.cisszgty.cn:8000/tiyuzazhi/api/user/mailCount?uid=" stringByAppendingString:[NSString  stringWithFormat:@"%d" ,uid ]  ]]];
        
        // Perform request and get JSON back as a NSData object
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        if(response == nil)
        {
            JsonString_UserMailInfo= nil;
            return @"";
        }
        // Get JSON as a NSString from NSData response
        
        JsonString_UserMailInfo= [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
        return JsonString_UserMailInfo;
    }
    @catch (NSException *exception) {
        return @"";
    }

}


//获取用户邮件信息

-(void)GetMagazineexamArts:(int)uid step:(int)stepID of:(int)of asc:(int)isASC con:(NSURLConnection *)con deleteControl:(id)control
{
    @try {
        /*uid用户ID
         step 步驟id
         of 翻页偏移量
         asc 是否顺序排序*/
        
//        NSString *url =@"http://www.cisszgty.cn:8000/tiyuzazhi/api/exam/examArts?" ;
//        if(stepID != 0)
//        {
//            
//          url =  [url  stringByAppendingFormat:@"uid=%d&of=%d&asc=%d&step=%d" ,uid,of,isASC,stepID ];
//        }
//        else
//        {
//            url =  [url  stringByAppendingFormat:@"uid=%d&of=%d&asc=%d" ,uid,of,isASC ];
//        }
//        
//        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url ]];
//        
//        
//        // Perform request and get JSON back as a NSData object
//        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//        
//        if(response == nil)
//        {
//            return @"";
//        }
        NSString *strUrl =@"http://www.cisszgty.cn:8000/tiyuzazhi/api/exam/examArts?" ;
        if(stepID != 0)
        {
            
            strUrl =  [strUrl  stringByAppendingFormat:@"uid=%d&of=%d&asc=%d&step=%d" ,uid,of,isASC,stepID ];
        }
        else
        {
            strUrl =  [strUrl  stringByAppendingFormat:@"uid=%d&of=%d&asc=%d" ,uid,of,isASC ];
        }
        
        
        NSURL *url = [NSURL URLWithString:strUrl];
        //第二步，创建请求
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
        //第三步，连接服务器
       // [NSURLConnection connectionWithRequest:request delegate:control];
        NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:control];
        con = connection;
        // Get JSON as a NSString from NSData response
        
        //JsonString_examArts= [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
      //  return JsonString_examArts;
    }
    @catch (NSException *exception) {
        
    }
    
}


-(void)GetLastMagazineexamArts:(int)uid {
    @try {
        /*uid用户ID
         step 步驟id
         of 翻页偏移量
         asc 是否顺序排序*/
        
        //        NSString *url =@"http://www.cisszgty.cn:8000/tiyuzazhi/api/exam/examArts?" ;
        //        if(stepID != 0)
        //        {
        //
        //          url =  [url  stringByAppendingFormat:@"uid=%d&of=%d&asc=%d&step=%d" ,uid,of,isASC,stepID ];
        //        }
        //        else
        //        {
        //            url =  [url  stringByAppendingFormat:@"uid=%d&of=%d&asc=%d" ,uid,of,isASC ];
        //        }
        //
        //        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url ]];
        //
        //
        //        // Perform request and get JSON back as a NSData object
                       //
        //        if(response == nil)
        //        {
        //            return @"";
        //        }
        NSString *strUrl =@"http://www.cisszgty.cn:8000/tiyuzazhi/api/exam/examArts?" ;
    
        strUrl =  [strUrl  stringByAppendingFormat:@"uid=%d&of=%d&asc=%d" ,uid,0,0 ];
        
        
        NSURL *url = [NSURL URLWithString:strUrl];
        //第二步，创建请求
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
               // Get JSON as a NSString from NSData response
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];

        JsonString_examArts= [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
          }
    @catch (NSException *exception) {
        
    }
    
}

-(void)GetLastMagazineexamPrivateArts:(int)uid {
    @try {
        /*uid用户ID
         step 步驟id
         of 翻页偏移量
         asc 是否顺序排序*/
        
        //        NSString *url =@"http://www.cisszgty.cn:8000/tiyuzazhi/api/exam/examArts?" ;
        //        if(stepID != 0)
        //        {
        //
        //          url =  [url  stringByAppendingFormat:@"uid=%d&of=%d&asc=%d&step=%d" ,uid,of,isASC,stepID ];
        //        }
        //        else
        //        {
        //            url =  [url  stringByAppendingFormat:@"uid=%d&of=%d&asc=%d" ,uid,of,isASC ];
        //        }
        //
        //        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url ]];
        //
        //
        //        // Perform request and get JSON back as a NSData object
        //
        //        if(response == nil)
        //        {
        //            return @"";
        //        }
        NSString *strUrl =@"http://www.cisszgty.cn:8000/tiyuzazhi/api/exam/get?";
        
        strUrl =  [strUrl  stringByAppendingFormat:@"uid=%d" ,uid ];
        
        
        NSURL *url = [NSURL URLWithString:strUrl];
        //第二步，创建请求
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
        // Get JSON as a NSString from NSData response
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        JsonString_examArts= [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    }
    @catch (NSException *exception) {
        
    }
    
}


-(void)GetMagazineexamHist:(int)aid delegateControl:(id)control
{
    @try {
        
//        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[ @"http://www.cisszgty.cn:8000/tiyuzazhi/api/exam/examHist?aid=" stringByAppendingString:[NSString  stringWithFormat:@"%d" ,aid ]  ]]];
//        
//        // Perform request and get JSON back as a NSData object
//        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//        
//        if(response == nil)
//        {
//            return @"";
//        }
//        // Get JSON as a NSString from NSData response
//        
//        JsonString_examHist= [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
//        return JsonString_examHist;
        NSString *strUrl = [@"http://www.cisszgty.cn:8000/tiyuzazhi/api/exam/examHist?aid=" stringByAppendingString:[NSString  stringWithFormat:@"%d" ,aid ]  ];
        NSURL *url = [NSURL URLWithString:strUrl];
        //第二步，创建请求
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
        //第三步，连接服务器
        // [NSURLConnection connectionWithRequest:request delegate:control];
   
           [NSURLConnection  connectionWithRequest:request delegate:control];
        
    }
    @catch (NSException *exception) {
        
    }
    

}


-(NSString *)GetMagazineexamsummary:(int)aid
{
    @try {
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[ @"http://www.cisszgty.cn:8000/tiyuzazhi/api/exam/get?aid=" stringByAppendingString:[NSString  stringWithFormat:@"%d" ,aid ]  ]]];
        
        // Perform request and get JSON back as a NSData object
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        if(response == nil)
        {
            return @"";
        }
        // Get JSON as a NSString from NSData response
        
        JsonString_examsummary= [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
        return JsonString_examsummary;
    }
    @catch (NSException *exception) {
        return @"";
    }
}


-(void)GetSummaryPDF:(NSString *)attchID
{
    @try {
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[ @"http://www.cisszgty.cn:85/v2/article.do?op=download&id=" stringByAppendingString:attchID  ]]];
        
        // Perform request and get JSON back as a NSData object
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        if(response == nil)
        {
           
        }
        // Get JSON as a NSString from NSData response
        
//        JsonString_UserUndoTask= [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
//        return JsonString_UserUndoTask;
    }
    @catch (NSException *exception) {
           }

}

-(NSString *)PostMagazineUserRegister:(NSMutableDictionary *) dictionary
{
    //第一步，创建URL /user/register
    NSURL *url = [NSURL URLWithString:[@"http://www.cisszgty.cn:8000/tiyuzazhi/api/user/register?" stringByAppendingFormat:@"username=%@&password=%@" ,[dictionary  objectForKey:@"username" ],[dictionary  objectForKey:@"password"]  ]];
    //第二步，创建请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
    NSString *str = @"type=focus-c";//设置参数
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    //第三步，连接服务器
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSString *str1 = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    
    return str1;


}


-(NSString *)GetSummarySearchResult:(NSString *)keywords index:(int)index
{
    NSString *strUrl = [@"http://www.cisszgty.cn:8000/tiyuzazhi/api/mag/search?" stringByAppendingFormat:@"keywords=%@&index=%d",keywords,index];
    
    strUrl = [strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
   // NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: strUrl]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: strUrl] cachePolicy:NSURLRequestUseProtocolCachePolicy  timeoutInterval:10 ];
    // Perform request and get JSON back as a NSData object
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if(response == nil)
    {
        return @"";
    }
//    NSURL *url = [NSURL URLWithString:strUrl];
//
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
//    [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
//    NSString *str = @"type=focus-c";//设置参数
//    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
//    [request setHTTPBody:data];
//    //第三步，连接服务器
//    
//    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    
//    JsonString_SummarySearchResult= [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    JsonString_SummarySearchResult= [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    return JsonString_SummarySearchResult;

}


#pragma mark NSURL
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    NSLog(@"%@",[res allHeaderFields]);
    self.receiveData = [NSMutableData data];
    
}
//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   
}
//数据传完之后调用此方法
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
   
    
}
//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
}



/*
 1、同步请求可以从因特网请求数据，一旦发送同步请求，程序将停止用户交互，直至服务器返回数据完成，才可以进行下一步操作，
 2、异步请求不会阻塞主线程，而会建立一个新的线程来操作，用户发出异步请求后，依然可以对UI进行操作，程序可以继续运行
 3、GET请求，将参数直接写在访问路径上。操作简单，不过容易被外界看到，安全性不高，地址最多255字节；
 4、POST请求，将参数放到body里面。POST请求操作相对复杂，需要将参数和地址分开，不过安全性高，参数放在body里面，不易被捕获。
 1、 同步GET请求
 //第一步，创建URL
 NSURL *url = [NSURL URLWithString:@"http://www.shiniv.com/test.php?type=get"];
 
 //第二步，通过URL创建网络请求
 NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
 //NSURLRequest初始化方法第一个参数：请求访问路径，第二个参数：缓存协议，第三个参数：网络请求超时时间（秒）
 其中缓存协议是个枚举类型包含：
 NSURLRequestUseProtocolCachePolicy（基础策略）
 NSURLRequestReloadIgnoringLocalCacheData（忽略本地缓存）
 NSURLRequestReturnCacheDataElseLoad（首先使用缓存，如果没有本地缓存，才从原地址下载）
 NSURLRequestReturnCacheDataDontLoad（使用本地缓存，从不下载，如果本地没有缓存，则请求失败，此策略多用于离线操作）
 NSURLRequestReloadIgnoringLocalAndRemoteCacheData（无视任何缓存策略，无论是本地的还是远程的，总是从原地址重新下载）
 NSURLRequestReloadRevalidatingCacheData（如果本地缓存是有效的则不下载，其他任何情况都从原地址重新下载）
 //第三步，连接服务器
 NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
 
 NSString *str = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
 
 NSLog(@"%@",str);
 2、同步POST请求
 //第一步，创建URL
 NSURL *url = [NSURL URLWithString:@"http://www.shiniv.com/test.php"];
 //第二步，创建请求
 NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
 [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
 NSString *str = @"type=focus-c";//设置参数
 NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
 [request setHTTPBody:data];
 //第三步，连接服务器
 
 NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
 
 NSString *str1 = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
 
 NSLog(@"%@",str1);
 3、异步GET请求
 //第一步，创建url
 NSURL *url = [NSURL URLWithString:@"http://www.shiniv.com/test.php?type=get"];
 //第二步，创建请求
 NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
 //第三步，连接服务器
 NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
 
 4、异步POST请求
 //第一步，创建url
 NSURL *url = [NSURL URLWithString:@"http://www.shiniv.com/test.php"];
 //第二步，创建请求
 NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
 [request setHTTPMethod:@"POST"];
 NSString *str = @"type=focus-c";
 NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
 [request setHTTPBody:data];
 //第三步，连接服务器
 NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
 5、异步请求的代理方法
 //接收到服务器回应的时候调用此方法
 - (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
 {
 NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
 NSLog(@"%@",[res allHeaderFields]);
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
 NSString *receiveStr = [[NSString alloc]initWithData:self.receiveData encoding:NSUTF8StringEncoding];
 NSLog(@"%@",receiveStr);
 }
 //网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
 -(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
 {
 NSLog(@"%@",[error localizedDescription]);
 }
 
 */
@end