//
//  JKYSlideTabBarView.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/6.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol JKYSlideTabBarViewDelegate <NSObject>

@required

- (NSArray<UIView *> *)arrayOfContentViewInPageTabBarView;

@optional

- (void)pageTabBarViewRefreshContentViewWithIndex:(NSUInteger)index;


@end

@interface JKYSlideTabBarView : UIView

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray<NSString *>*)titleArray delegate:(id<JKYSlideTabBarViewDelegate>)delegate;


@property (nonatomic, weak) id<JKYSlideTabBarViewDelegate> delegate;

@end
