//
//  JKYUploadImageView.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/30.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JKYUploadImageView;

@protocol JKYUploadImageViewDelegate <NSObject>

@optional
- (void)deleteWithImageView:(JKYUploadImageView *)imageView;

- (void)retryUploadWithImageView:(JKYUploadImageView *)imageView;

@end

@interface JKYUploadImageView : UIImageView

@property (nonatomic, assign) CGFloat progress;             //0.0 - 1.0

@property (nonatomic, assign) BOOL uploadFailed;            //when upload image failed, set it

@property (nonatomic, weak) id<JKYUploadImageViewDelegate> delegate;

@end
