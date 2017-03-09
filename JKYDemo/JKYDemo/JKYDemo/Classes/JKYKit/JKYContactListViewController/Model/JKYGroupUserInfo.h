//
//  JKYGroupUserInfo.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/8.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKYGroupMemberProtocol.h"


@interface JKYGroupUser : NSObject<JKYGroupMemberProtocol>

- (instancetype)initWithUserId:(NSString *)userId;


@end

@interface JKYGroupTeam : NSObject<JKYGroupMemberProtocol>

- (instancetype)initWithTeamId:(NSString *)teamId;

@end

