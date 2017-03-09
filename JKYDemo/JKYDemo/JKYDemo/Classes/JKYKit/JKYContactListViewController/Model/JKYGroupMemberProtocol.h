//
//  JKYGroupMemberProtocol.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/8.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol JKYGroupMemberProtocol <NSObject>

- (CGFloat)uiHeight;

- (NSString *)vcName;

- (NSString *)reuseCellId;

- (NSString *)cellName;

- (NSString *)groupTitle;

- (NSString *)userId;

- (UIImage *)icon;

- (NSString *)avatarURL;

- (NSString *)memberId;

- (NSString *)showName;

- (BOOL)showAccessory;

- (id)sortKey;



@end
