//
//  JKYGroupUserInfo.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/8.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYGroupUserInfo.h"
#import "JKYSpellingCenter.h"


@interface JKYGroupUser ()

@property (nonatomic, copy) NSString *userId;

@end

@implementation JKYGroupUser

- (instancetype)initWithUserId:(NSString *)userId
{
    self = [super init];
    if (self) {
        self.userId = userId;
    }
    return self;
}

- (NSString *)groupTitle
{
    NSString *title = [[JKYSpellingCenter sharedCenter] firstLetter:_userId].capitalizedString;
    unichar character = [title characterAtIndex:0];
    if (character >= 'A' && character <= 'Z') {
        return title;
    } else {
        return @"#";
    }
}

- (NSString *)showName
{
    return _userId;
}

- (id)sortKey
{
    return [[JKYSpellingCenter sharedCenter] spellingForString:_userId].shortSpelling;
}

@end


@interface JKYGroupTeam ()

@property (nonatomic, copy) NSString *teamId;

@end


@implementation JKYGroupTeam

- (instancetype)initWithTeamId:(NSString *)teamId
{
    self = [super init];
    if (self) {
        self.teamId = teamId;
    }
    return self;
}

- (NSString *)groupTitle
{
    NSString *title = [[JKYSpellingCenter sharedCenter] firstLetter:_teamId].capitalizedString;
    unichar character = [title characterAtIndex:0];
    if (character >= 'A' && character <= 'Z') {
        return title;
    } else {
        return @"#";
    }
}

- (NSString *)showName
{
    return _teamId;
}

- (id)sortKey
{
    return [[JKYSpellingCenter sharedCenter] spellingForString:_teamId].shortSpelling;
}


@end
