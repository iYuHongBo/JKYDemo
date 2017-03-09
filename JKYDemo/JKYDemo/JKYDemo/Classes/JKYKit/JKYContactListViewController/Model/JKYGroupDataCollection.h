//
//  JKYListDataCollection.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/8.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKYGroupMemberProtocol.h"


@interface JKYGroupDataCollection : NSObject

@property (nonatomic, strong) NSArray *members;
@property (nonatomic, copy) NSComparator groupTitleComparator;
@property (nonatomic, copy) NSComparator groupMemberComparator;
@property (nonatomic, readonly) NSArray *sortedGroupTitles;;



- (NSString *)titleOfGroup:(NSInteger)groupIndex;

- (NSArray *)membersOfGroup:(NSInteger)groupIndex;

- (NSInteger)groupCount;

- (NSInteger)memberCountOfGroup:(NSInteger)groupIndex;

- (id<JKYGroupMemberProtocol>)memberOfIndex:(NSIndexPath *)indexPath;


@end
