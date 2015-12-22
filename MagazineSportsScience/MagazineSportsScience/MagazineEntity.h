//
//  MagazineEntity.h
//  MagazineSportsScience
//
//  Created by joan on 14/11/29.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#ifndef MagazineSportsScience_MagazineEntity_h
#define MagazineSportsScience_MagazineEntity_h
#import <Foundation/Foundation.h>
#import "Jastor.h"

//基本类型
@interface Magazinebase : Jastor
@property (nonatomic, copy) NSString *result;
@property (nonatomic, retain) NSArray *data;


@end




//最新杂志目录
@interface MagazineCategory : Jastor
@property (nonatomic, retain) NSNumber *id;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *publishNo;
@property (nonatomic, copy) NSString *publishTime;


@end


//最新杂志目录数据
@interface MagazineSort : Jastor
@property (nonatomic, copy) NSString *result;
@property (nonatomic, retain) NSArray *data;
@end


//最新杂志目录
@interface MagazineData : Jastor
@property (nonatomic, retain) NSNumber *id;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *publishNo;
@property (nonatomic, copy) NSString *publishTime;


@end


//最新杂志目录数据
@interface  Magazine: Jastor
@property (nonatomic, copy) NSString *result;
@property (nonatomic, retain) NSMutableDictionary *data;
@end



//获取杂志目录信息

@interface MagazineArticles: Jastor
@property (nonatomic, copy) NSString *result;
@property (nonatomic, retain) NSArray *data;
@end


@interface MagazineArticlesData: Jastor
@property (nonatomic, retain) NSNumber *id;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *publishTime;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *keyword;
@property (nonatomic, retain) NSNumber *attachment;


@end






//系统公告

@interface SysMessage: Jastor
@property (nonatomic, copy) NSString *result;
@property (nonatomic, retain) NSArray *data;
@end

//系统公告数据
@interface SysMessageData: Jastor
@property (nonatomic, retain) NSNumber *id;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *summary;

@end





//用户信息

@interface UserInfo: Jastor
@property (nonatomic, copy) NSString *result;
@property (nonatomic, retain) NSMutableDictionary *data;
@end

//用户信息数据
@interface UserInfoData: Jastor
@property (nonatomic, retain) NSNumber *id;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *iconPath;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *role_committee;
@property (nonatomic, copy) NSString *role_final;
@property (nonatomic, copy) NSString *role_reader;
@property (nonatomic, copy) NSString *role_external;
@property (nonatomic, copy) NSString *role_author;
@property (nonatomic, copy) NSString *role_tutor;
@property (nonatomic, copy) NSString *type;

@end



//任务
@interface Mission: Jastor
@property (nonatomic, copy) NSString *result;
@property (nonatomic, retain) NSMutableDictionary *data;
@end


//任务数据
@interface MissionData: Jastor
@property (nonatomic, copy) NSString *editor;
@property (nonatomic, copy) NSString *external;
@property (nonatomic, copy) NSString *cedit;
@property (nonatomic, copy) NSString *author;

@end




//待审核的文章

@interface ExamArts: Jastor
@property (nonatomic, copy) NSString *result;
@property (nonatomic, retain) NSMutableArray *data;
@end


//任务待审核的文章数据

@interface ExamArtsData: Jastor
@property (nonatomic, retain) NSNumber *id;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *submitDate;
@property (nonatomic, copy) NSString *draftNo;
@property (nonatomic, copy) NSString *examineStart;
@property (nonatomic, copy) NSString *examineFinish;
@property (nonatomic, copy) NSString *examineEnd;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *opName;
@property (nonatomic, copy) NSString *step;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *opId;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *prevOpName;
@property (nonatomic, copy) NSString *prevExamineFinish;


@end


//待审核的文章

@interface ExamPrivateArts: Jastor
@property (nonatomic, copy) NSString *result;
@property (nonatomic, retain) NSMutableDictionary *data;
@end


//任务待审核的文章数据

@interface ExamPrivateArtsData: Jastor
@property (nonatomic, retain) NSNumber *id;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *submitDate;
@property (nonatomic, copy) NSString *draftNo;
@property (nonatomic, copy) NSString *examineStart;
@property (nonatomic, copy) NSString *examineFinish;
@property (nonatomic, copy) NSString *examineEnd;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *opName;
@property (nonatomic, copy) NSString *step;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *opId;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *prevOpName;
@property (nonatomic, copy) NSString *prevExamineFinish;


@end



@interface ExamHist: Jastor
@property (nonatomic, copy) NSString *result;
@property (nonatomic, retain) NSMutableArray *data;
@end


//任务待审核的文章数据

@interface ExamHistData: Jastor

@property (nonatomic, copy) NSString *flowId;
@property (nonatomic, copy) NSString *step;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *draftNo;
@property (nonatomic, copy) NSString *phaseName;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *isAgree;
@property (nonatomic, copy) NSString *opinion;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *opiniontoauthor;
@property (nonatomic, copy) NSString *examinername;
@property (nonatomic, copy) NSString *examineFinish;
@property (nonatomic, copy) NSString *examineEnd;
@property (nonatomic, copy) NSString *examineStart;


@end



@interface Summary: Jastor
@property (nonatomic, copy) NSString *result;
@property (nonatomic, retain) NSMutableDictionary *data;
@end


//文章数据信息

@interface SummaryData: Jastor

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *submitDate;
@property (nonatomic, copy) NSString *draftNo;
@property (nonatomic, copy) NSString *examineStart;
@property (nonatomic, copy) NSString *examineFinish;
@property (nonatomic, copy) NSString *examineEnd;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *opName;
@property (nonatomic, copy) NSString *step;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *opId;
@property (nonatomic, copy) NSString *score;


@end


//通知信息
@interface MailInfo: Jastor
@property (nonatomic, copy) NSString *result;
@property (nonatomic, retain) NSMutableArray *data;
@end


//任务数据
@interface MailInfoData: Jastor
@property (nonatomic, copy) NSString *mailId;
@property (nonatomic, copy) NSString *mailContent;
@property (nonatomic, copy) NSString *mailTitle;


@end



#endif
