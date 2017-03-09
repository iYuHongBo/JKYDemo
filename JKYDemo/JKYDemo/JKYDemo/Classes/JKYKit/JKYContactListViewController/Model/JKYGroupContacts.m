//
//  JKYGroupContacts.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/9.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYGroupContacts.h"
#import "JKYGroupUserInfo.h"

@interface JKYGroupContacts ()

@property (nonatomic, strong) NSArray *contactsArray;

@end

@implementation JKYGroupContacts

- (instancetype)initWithContacts:(NSArray *)contacts
{
    self = [super init];
    if (self) {
        self.contactsArray = contacts;
        self.groupTitleComparator = ^NSComparisonResult(NSString *title1, NSString *title2) {
            if ([title1 isEqualToString:@"#"]) {
                return NSOrderedDescending;
            }
            if ([title2 isEqualToString:@"#"]) {
                return NSOrderedAscending;
            }
            return [title1 compare:title2];
        };
        self.groupMemberComparator = ^NSComparisonResult(NSString *key1, NSString *key2) {
            return [key1 compare:key2];
        };
        [self update];
    }
    return self;
}

- (void)update{
    NSMutableArray *contacts = [NSMutableArray array];
    for (NSString *item in _contactsArray) {
        JKYGroupUser *user = [[JKYGroupUser alloc] initWithUserId:item];
        [contacts addObject:user];
    }
    
    [self setMembers:contacts];
}





@end
