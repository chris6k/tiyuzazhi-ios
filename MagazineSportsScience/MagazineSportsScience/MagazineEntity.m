//
//  MagazineEntity.m
//  MagazineSportsScience
//
//  Created by joan on 14/11/29.
//  Copyright (c) 2014年 synergyworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MagazineEntity.h"

@implementation Magazinebase


@synthesize result;
@synthesize data;


@end

@implementation MagazineSort


@synthesize result;
@synthesize data;

+ (Class)data_class {
    return [MagazineCategory class];
}


 @end


//目录列表
@implementation MagazineCategory




@synthesize id;
@synthesize uid;
@synthesize title;
@synthesize subTitle;
@synthesize publishNo;
@synthesize publishTime;

@end


@implementation MagazineData
@synthesize id;
@synthesize uid;
@synthesize title;
@synthesize subTitle;
@synthesize publishNo;
@synthesize publishTime;


@end


//最新杂志目录数据
@implementation Magazine
@synthesize result;
@synthesize data;
+ (Class)data_class {
    return [MagazineData class];
}
@end



//
@implementation MagazineArticles

@synthesize result;
@synthesize data;

+ (Class)data_class {
    return [MagazineArticlesData class];
}

@end

@implementation MagazineArticlesData

@synthesize id;
@synthesize uid;
@synthesize title;
@synthesize publishTime;
@synthesize author;
@synthesize summary;
@synthesize keyword;
@synthesize attachment;


@end


//系统公告
@implementation SysMessage

@synthesize result;
@synthesize data;

+ (Class)data_class {
    return [SysMessageData class];
}

@end

@implementation SysMessageData

@synthesize id;
@synthesize uid;
@synthesize title;
@synthesize summary;

@end


//用户信息
@implementation UserInfo

@synthesize result;
@synthesize data;

+ (Class)data_class {
    return [UserInfoData class];
}

@end

@implementation UserInfoData

@synthesize id;
@synthesize uid;
@synthesize username;
@synthesize name;
@synthesize iconPath;
@synthesize company;
@synthesize address;
@synthesize email;
@synthesize mobile;
@synthesize role_committee;
@synthesize role_final;
@synthesize role_reader;
@synthesize role_external;
@synthesize role_author;
@synthesize role_tutor;
@synthesize type;

@end



//任务

@implementation Mission;

@synthesize result;
@synthesize data;


@end

@implementation MissionData

@synthesize editor;
@synthesize external;
@synthesize cedit;
@synthesize author;
@end

@implementation ExamArts
@synthesize result;
@synthesize data;

+ (Class)data_class {
    return [ExamArtsData class];
}

@end


//任务待审核的文章数据

@implementation ExamArtsData
@synthesize uid;
@synthesize title;
@synthesize submitDate;
@synthesize draftNo;
@synthesize examineStart;
@synthesize examineFinish;
@synthesize examineEnd;
@synthesize state;
@synthesize opName;
@synthesize step;
@synthesize comment;
@synthesize opId;
@synthesize score;
@synthesize prevOpName;
@synthesize prevExamineFinish;

@end


@implementation ExamPrivateArts
@synthesize result;
@synthesize data;

+ (Class)data_class {
    return [ExamArtsData class];
}

@end


//任务待审核的文章数据

@implementation ExamPrivateArtsData
@synthesize uid;
@synthesize title;
@synthesize submitDate;
@synthesize draftNo;
@synthesize examineStart;
@synthesize examineFinish;
@synthesize examineEnd;
@synthesize state;
@synthesize opName;
@synthesize step;
@synthesize comment;
@synthesize opId;
@synthesize score;
@synthesize prevOpName;
@synthesize prevExamineFinish;

@end



@implementation ExamHist
@synthesize result;
@synthesize data;

+ (Class)data_class {
    return [ExamHistData class];
}

@end


//任务待审核的文章数据

@implementation ExamHistData
@synthesize flowId;
@synthesize step;
@synthesize id;
@synthesize draftNo;
@synthesize phaseName;
@synthesize status;
@synthesize isAgree;
@synthesize opinion;
@synthesize comment;
@synthesize opiniontoauthor;
@synthesize examinername;
@synthesize examineFinish;
@synthesize examineEnd;
@synthesize examineStart;
@end


@implementation Summary
@synthesize result;
@synthesize data;

+ (Class)data_class {
    return [SummaryData class];
}

@end



@implementation SummaryData


@synthesize id;
@synthesize uid;
@synthesize summary;
@synthesize author;
@synthesize title;
@synthesize submitDate;
@synthesize draftNo;
@synthesize examineStart;
@synthesize examineFinish;
@synthesize examineEnd;
@synthesize state;
@synthesize opName;
@synthesize step;
@synthesize comment;
@synthesize opId;
@synthesize score;
@end


@implementation MailInfo

@synthesize result;
@synthesize data;

+ (Class)data_class {
    return [MailInfoData class];
}

@end


@implementation MailInfoData

@synthesize mailContent;
@synthesize mailId;
@synthesize mailTitle;

@end

