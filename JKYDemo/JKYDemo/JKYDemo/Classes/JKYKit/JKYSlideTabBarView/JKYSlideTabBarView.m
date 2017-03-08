//
//  JKYSlideTabBarView.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/6.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYSlideTabBarView.h"



//static CGFloat const kTopViewHeight = 60.0;

#define kTopViewHeight  60


@interface JKYSlideTabBarView ()<UIScrollViewDelegate>

@property (nonatomic, assign) CGRect mViewFrame;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *slideView;
@property (nonatomic, strong) UIView *topMainView;
@property (nonatomic, strong) UIScrollView *topScrollView;

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSMutableArray *topViewArray;
@property (nonatomic, strong) NSMutableArray *scrollViewArray;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger tabCount;


@end


@implementation JKYSlideTabBarView


- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray<NSString *>*)titleArray delegate:(id<JKYSlideTabBarViewDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        _mViewFrame = frame;
        _titleArray = titleArray;
        _tabCount = titleArray.count;
        _delegate = delegate;
        _topViewArray = [[NSMutableArray alloc] init];
        _scrollViewArray = [[NSMutableArray alloc] init];
        
        [self initTopTabs];
        [self initScrollView];
        [self initDownTables];
        
        
    }
    return self;
}

- (void)initTopTabs
{
    CGFloat width = _mViewFrame.size.width / 6;
    if (_tabCount <= 6) {
        width = _mViewFrame.size.width / _tabCount;
    }
    _topMainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _mViewFrame.size.width, kTopViewHeight)];
    [self addSubview:_topMainView];
    
    UIScrollView *topScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _mViewFrame.size.width, kTopViewHeight)];
    self.topScrollView = topScrollView;
    _topScrollView.showsHorizontalScrollIndicator = NO;
    _topScrollView.showsVerticalScrollIndicator = NO;
    _topScrollView.bounces = NO;
    _topScrollView.delegate = self;
    if (_tabCount >= 6) {
        _topScrollView.contentSize = CGSizeMake(width * _tabCount, kTopViewHeight);
    } else {
        _topScrollView.contentSize = CGSizeMake(_mViewFrame.size.width, kTopViewHeight);
    }
    
    [_topMainView addSubview:topScrollView];
    
    for (int i = 0; i < _tabCount; i++) {
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * width, 0, width, kTopViewHeight)];
//        view.backgroundColor = [UIColor lightGrayColor];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * width, 0, width, kTopViewHeight)];
        button.backgroundColor = [UIColor lightGrayColor];
        button.tag = i;
        if (i == 0) {
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }
        [button setTitle:[_titleArray objectAtIndex:i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(tabButton:) forControlEvents:UIControlEventTouchUpInside];
//        [view addSubview:button];
        [_topViewArray addObject:button];
        [_topScrollView addSubview:button];
        
    }
    
    _slideView = [[UIView alloc] initWithFrame:CGRectMake(0, kTopViewHeight - 5, width, 5)];
    _slideView.backgroundColor = [UIColor blueColor];
    [topScrollView addSubview:_slideView];
}

- (void)initScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kTopViewHeight, _mViewFrame.size.width, _mViewFrame.size.height - kTopViewHeight)];
    self.scrollView = scrollView;
    scrollView.contentSize = CGSizeMake(_mViewFrame.size.width * _tabCount, _mViewFrame.size.height - kTopViewHeight);
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.delegate = self;
    [self addSubview:scrollView];
}



- (void)initDownTables {
    if (self.delegate && [self.delegate respondsToSelector:@selector(arrayOfContentViewInPageTabBarView)]) {
        NSArray *viewArray = [self.delegate arrayOfContentViewInPageTabBarView];
        for (int i = 0; i < viewArray.count; i++) {
            UIView *view = viewArray[i];
            view.frame = CGRectMake(i * _mViewFrame.size.width, 0, _mViewFrame.size.width, _mViewFrame.size.height - kTopViewHeight);
            [_scrollViewArray addObject:view];
            [_scrollView addSubview:view];
        }
    }
}






#pragma mark - ScrollView Delegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self scrollViewDidEndDecelerating:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([scrollView isEqual:_scrollView]) {
        _currentPage = _scrollView.contentOffset.x / _mViewFrame.size.width;
        
        [self updateContentViewWithPageNumber:_currentPage];
        
    } else if ([scrollView isEqual:_topScrollView]) {
        [self modifyTopScrollViewPosition:scrollView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isEqual:_scrollView]) {
        //下面滑条移动
        CGRect frame = _slideView.frame;
        if (_tabCount <= 6) {
            frame.origin.x = scrollView.contentOffset.x / _tabCount;
        } else {
            frame.origin.x = scrollView.contentOffset.x / 6;
        }
        _slideView.frame = frame;
        
        //菜单移动
        CGFloat width = _mViewFrame.size.width / 6;
        if (_tabCount <= 6) {
            width = _mViewFrame.size.width / _tabCount;
        }
        NSInteger currentPage = _scrollView.contentOffset.x / _mViewFrame.size.width;
        if (currentPage >=4  && (_tabCount - currentPage) > 2) {
            [_topScrollView setContentOffset:CGPointMake(((currentPage-3)*width), 0) animated:YES];
        } else if (currentPage < 4) {
            [_topScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
        
        //改变当前菜单颜色
        for (UIButton *itemButton in _topViewArray) {
            [itemButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        NSInteger currentPage1 = _scrollView.contentOffset.x / _mViewFrame.size.width;
        UIButton *button = _topViewArray[currentPage1];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
}






#pragma mark - Private Methods
- (void)tabButton:(id)sender {
    UIButton *button = sender;
    [_scrollView setContentOffset:CGPointMake(button.tag * _mViewFrame.size.width, 0) animated:YES];
}

- (void)updateContentViewWithPageNumber:(NSInteger)pageNumber {
    if (self.delegate && [self.delegate respondsToSelector:@selector(pageTabBarViewRefreshContentViewWithIndex:)]) {
        [self.delegate pageTabBarViewRefreshContentViewWithIndex:pageNumber];
    }
}

- (void)modifyTopScrollViewPosition:(UIScrollView *)scrollView {
    if ([scrollView isEqual:_topScrollView]) {
        CGFloat contentOffsetX = _topScrollView.contentOffset.x;
        CGFloat width = _slideView.frame.size.width;
        int count = (int)contentOffsetX / (int)width;
        CGFloat step = (int)contentOffsetX % (int)width;
        CGFloat sumStep = width * count;
        if (step > width / 2) {
            sumStep = width * (count + 1);
        }
        [_topScrollView setContentOffset:CGPointMake(sumStep, 0) animated:YES];
    }
}


















@end
