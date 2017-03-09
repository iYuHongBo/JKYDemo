//
//  JKYListDataCollection.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/8.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYGroupDataCollection.h"
#import <UIKit/UIKit.h>

@interface JKYKitPair : NSObject

@property (nonatomic, strong) id first;
@property (nonatomic, strong) id second;

@end

@implementation JKYKitPair

- (instancetype)initWithFirst:(id)first second:(id)second
{
    self = [super init];
    if (self) {
        self.first = first;
        self.second = second;
    }
    return self;
}

@end



@interface JKYGroupDataCollection ()

@property (nonatomic, strong) NSMutableOrderedSet *specialGroupTitles;
@property (nonatomic, strong) NSMutableOrderedSet *specialGroups;
@property (nonatomic, strong) NSMutableOrderedSet *groupTitles;
@property (nonatomic, strong) NSMutableOrderedSet *groups;


@end


@implementation JKYGroupDataCollection

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.specialGroupTitles = [[NSMutableOrderedSet alloc] init];
        self.specialGroups = [[NSMutableOrderedSet alloc] init];
        self.groupTitles = [[NSMutableOrderedSet alloc] init];
        self.groups = [[NSMutableOrderedSet alloc] init];
        self.groupTitleComparator = ^NSComparisonResult(NSString *title1, NSString *title2) {
            return [title1 localizedCompare:title2];
        };
        self.groupMemberComparator = ^NSComparisonResult(NSString *key1, NSString *key2) {
            return [key1 localizedCompare:key2];
        };
    }
    return self;
}

- (NSArray *)sortedGroupTitles {
    return [_groupTitles array];
}

- (void)setMembers:(NSArray *)members {
    NSMutableDictionary *tempDict = [NSMutableDictionary dictionary];
    
    for (id<JKYGroupMemberProtocol>member in members) {
        NSString *groupTitle = [member groupTitle];
        NSMutableArray *groupMembers = [tempDict objectForKey:groupTitle];
        if (!groupMembers) {
            groupMembers = [NSMutableArray array];
        }
        [groupMembers addObject:member];
        [tempDict setObject:groupMembers forKey:groupTitle];
    }
    [_groupTitles removeAllObjects];
    [_groups removeAllObjects];
    
    [tempDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *groupTitle = (NSString *)key;
        NSMutableArray *groupMembers = (NSMutableArray *)obj;
        if (groupTitle.length) {
            unichar character = [groupTitle characterAtIndex:0];
            if (character >= 'A' && character <= 'Z') {
                [_groupTitles addObject:groupTitle];
            } else {
                [_groupTitles addObject:@"#"];
            }
            [_groups addObject:[[JKYKitPair alloc] initWithFirst:groupTitle second:groupMembers]];
        }
    }];
    [self sort];
}


- (NSString *)titleOfGroup:(NSInteger)groupIndex
{
    if (groupIndex >= 0 && groupIndex < _groupTitles.count) {
        return [_groupTitles objectAtIndex:groupIndex];
    }
    return nil;
}

- (NSArray *)membersOfGroup:(NSInteger)groupIndex
{
    if (groupIndex >= 0 && groupIndex < _groups.count) {
        JKYKitPair *pair = [_groups objectAtIndex:groupIndex];
        return pair.second;
    }
    return nil;
}

- (id<JKYGroupMemberProtocol>)memberOfIndex:(NSIndexPath *)indexPath
{
    NSArray *members = nil;
    NSInteger groupIndex = indexPath.section;
    if (groupIndex >= 0 && groupIndex < _groups.count) {
        JKYKitPair *pair = [_groups objectAtIndex:groupIndex];
        members = pair.second;
    }
    NSInteger memberIndex = indexPath.row;
    if (memberIndex < 0 || memberIndex >= members.count) return nil;
    return [members objectAtIndex:memberIndex];
}



- (NSInteger)groupCount
{
    return _groupTitles.count;
}

- (NSInteger)memberCountOfGroup:(NSInteger)groupIndex
{
    NSArray *members = nil;
    if (groupIndex >= 0 && groupIndex < _groups.count) {
        JKYKitPair *pair = [_groups objectAtIndex:groupIndex];
        members = pair.second;
    }
    return members.count;
}

- (void)sort
{
    [self sortGroupTitle];
    [self sortGroupMember];
}

- (void)sortGroupTitle
{
    [_groupTitles sortUsingComparator:_groupTitleComparator];
    [_groups sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        JKYKitPair *pair1 = (JKYKitPair *)obj1;
        JKYKitPair *pair2 = (JKYKitPair *)obj2;
        return _groupTitleComparator(pair1.first, pair2.first);
    }];
}

- (void)sortGroupMember
{
    [_groups enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        JKYKitPair *pair = (JKYKitPair *)obj;
        NSMutableArray *groupMembers = pair.second;
        [groupMembers sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            id<JKYGroupMemberProtocol> member1 = obj1;
            id<JKYGroupMemberProtocol> member2 = obj2;
            return _groupMemberComparator([member1 sortKey], [member2 sortKey]);
        }];
    }];
}

- (void)setGroupTitleComparator:(NSComparator)groupTitleComparator
{
    _groupTitleComparator = groupTitleComparator;
    [self sortGroupTitle];
}

- (void)setGroupMemberComparator:(NSComparator)groupMemberComparator
{
    _groupMemberComparator = groupMemberComparator;
    [self sortGroupMember];
}








@end
