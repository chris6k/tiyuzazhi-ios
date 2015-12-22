//
//  JsonResult.h
//  MagazineSportsScience
//
//  Created by joan on 14/11/30.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#ifndef MagazineSportsScience_JsonResult_h
#define MagazineSportsScience_JsonResult_h


@interface JsonResult : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSMutableData *receiveData;

@property (nonatomic, copy) NSString *JsonString_LastMagazineCategory;

@property (nonatomic, copy) NSString *JsonString_MagazineArticles;

@property (nonatomic, copy) NSString *JsonString_SystemBoard;

@property (nonatomic, copy) NSString *JsonString_UserData;

@property (nonatomic, copy) NSString *JsonString_UserUndoTask;

@property (nonatomic, copy) NSString *JsonString_UserMailInfo;

@property (nonatomic, copy) NSString *JsonString_examArts;

@property (nonatomic, copy) NSString *JsonString_examHist;

@property (nonatomic, copy) NSString *JsonString_examsummary;

@property (nonatomic, copy) NSString *JsonString_SummarySearchResult;


-(NSString *)GetLastMagazineCategory;

-(NSString *)GetMagazineArticles:(NSString *)mgid;

-(void)GetMagazineArticles:(NSString *)mgid detective:(NSString *)detective delegateControl:(id)control;

-(NSString *)GetMagazineSystemBoard;


-(NSString *)GetMagazineUserData:(NSString *)username password:(NSString *) password;

-(NSString *)GetMagazineUserUndoTask:(int)uid;

-(NSString *)PostMagazineUserRegister:(NSMutableDictionary *) dictionary;

-(NSString *)GetMagazineUserMailInfo:(int)uid;


-(void)GetLastMagazineexamArts:(int)uid;

-(void)GetLastMagazineexamPrivateArts:(int)uid;

-(void)GetMagazineexamHist:(int)aid delegateControl:(id)control;

-(NSString *)GetMagazineexamsummary:(int)aid;


-(void)GetSummaryPDF:(NSString *)attchID;

-(NSString *)GetSummarySearchResult:(NSString *)keywords index:(int)index;

-(void)GetMagazineexamArts:(int)uid step:(int)stepID of:(int)of asc:(int)isASC con:(NSURLConnection *)con deleteControl:(id)control;
@end


#endif
