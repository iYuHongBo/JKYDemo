//
//  JKYApplicationAnimationViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/22.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYApplicationAnimationViewController.h"
#import "DCPathButton.h"
#import "DWBubbleMenuButton.h"
#import "MCFireworksButton.h"
#import "JKYShineButton.h"
#import "JKYShineParams.h"
#import "JKYShineImage.h"


@interface JKYApplicationAnimationViewController ()<DCPathButtonDelegate>
//View
@property (nonatomic, strong) UIButton *pathButton;
@property (nonatomic, strong) UIButton *bubbleButton;
@property (nonatomic, strong) UIButton *goodButton;
@property (nonatomic, strong) DCPathButton *pathAniButton;
@property (nonatomic, strong) DWBubbleMenuButton *bubbleAniButton;
@property (nonatomic, strong) MCFireworksButton *goodAniButton;
@property (nonatomic, strong) UIButton *cuteButton;
@property (nonatomic, strong) UIView *cuteView;


//Data
@property (nonatomic, assign) BOOL isGoodAniButtonSelected;
@property (nonatomic, strong) NSMutableArray *viewArrays;

@end

@implementation JKYApplicationAnimationViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initUI];
}

- (void)initData
{
    self.viewArrays = [NSMutableArray array];
}

- (void)initUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"综合案例";
    
    [self.view addSubview:self.pathButton];
    [_pathButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.bubbleButton];
    [_bubbleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_pathButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.goodButton];
    [_goodButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_bubbleButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.cuteButton];
    [_cuteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_goodButton.mas_right).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    
    
    
}

#pragma mark - Delegate
#pragma mark - DCPathButtonDelegate
- (void)itemButtonTappedAtIndex:(NSUInteger)index
{
    
}


#pragma mark - Event action
- (void)onTapPathButton:(UIButton*)button
{
    [self hideAllViews];
    if (!_pathAniButton) {
        [self setupPathAniButton];
    } else {
        _pathAniButton.hidden = NO;
    }
}

- (void)onTapBubbleButton:(UIButton*)button
{
    [self hideAllViews];
    if (!_bubbleAniButton) {
        [self setupBubbleAniButton];
    } else {
        _bubbleAniButton.hidden = NO;
    }
}

- (void)onTapGoodButton:(UIButton *)button
{
    [self hideAllViews];
    if (!_goodAniButton) {
        [self setupGoodAniButton];
    } else {
        _goodAniButton.hidden = NO;
    }
}

- (void)dwBtnClick:(UIButton *)sender {
    NSLog(@"DWButton tapped, tag: %ld", (long)sender.tag);
}

- (void)onTapGoodAniButton:(UIButton*)button
{
    self.isGoodAniButtonSelected = !self.isGoodAniButtonSelected;
    if (self.isGoodAniButtonSelected) {
        [self.goodAniButton popOutsideWithDuration:0.5];
        [self.goodAniButton setImage:[UIImage imageNamed:@"Like-Blue"] forState:UIControlStateNormal];
        [self.goodAniButton animate];
    } else {
        [self.goodAniButton popInsideWithDuration:0.4];
        [self.goodAniButton setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
    }
}

- (void)onTapCuteButton:(UIButton *)button
{
    [self hideAllViews];
    if (!_cuteView) {
        [self setupCuteView];
    } else {
        _cuteView.hidden = NO;
    }
}

#pragma mark - Paivate methods
- (void)hideAllViews
{
    for (UIView *view in self.viewArrays) {
        view.hidden = YES;
    }
}

- (void)setupPathAniButton
{
    // Configure center button
    //
    DCPathButton *dcPathButton = [[DCPathButton alloc]initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"]
                                                           hilightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"]];
    self.pathAniButton = dcPathButton;
    
    dcPathButton.delegate = self;
    
    // Configure item buttons
    //
    DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_2 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_3 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-camera"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_4 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-thought"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_5 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-sleep"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    // Add the item button into the center button
    //
    [dcPathButton addPathItems:@[itemButton_1, itemButton_2, itemButton_3, itemButton_4, itemButton_5]];
    
    [self.view addSubview:dcPathButton];
    [self.viewArrays addObject:dcPathButton];
}

- (void)setupBubbleAniButton
{
    UILabel *homeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 40.f, 40.f)];
    homeLabel.text = @"Tap";
    homeLabel.textColor = [UIColor whiteColor];
    homeLabel.textAlignment = NSTextAlignmentCenter;
    homeLabel.layer.cornerRadius = homeLabel.frame.size.height / 2.f;
    homeLabel.backgroundColor =[UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
    homeLabel.clipsToBounds = YES;
    
    NSMutableArray *buttonsMutable = [[NSMutableArray alloc] init];
    
    int i = 0;
    for (NSString *title in @[@"A", @"B", @"C", @"D", @"E", @"F"]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateNormal];
        
        button.frame = CGRectMake(0.f, 0.f, 30.f, 30.f);
        button.layer.cornerRadius = button.frame.size.height / 2.f;
        button.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
        button.clipsToBounds = YES;
        button.tag = i++;
        [button addTarget:self action:@selector(dwBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [buttonsMutable addObject:button];
    }
    
    DWBubbleMenuButton *upMenuView = [[DWBubbleMenuButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - homeLabel.frame.size.width - 20.f, self.view.frame.size.height - homeLabel.frame.size.height - 20.f, homeLabel.frame.size.width, homeLabel.frame.size.height) expansionDirection:DirectionUp];
    upMenuView.homeButtonView = homeLabel;
    [upMenuView addButtons:buttonsMutable];
    self.bubbleAniButton = upMenuView;
    [self.view addSubview:upMenuView];
    [self.viewArrays addObject:upMenuView];
}

- (void)setupGoodAniButton
{
    self.goodAniButton = [[MCFireworksButton alloc] initWithFrame:CGRectMake(JKYUIScreenWidth/2-25, JKYUIScreenHeight/2-25, 50, 50)];
    self.goodAniButton.particleImage = [UIImage imageNamed:@"Sparkle"];
    self.goodAniButton.particleScale = 0.05;
    self.goodAniButton.particleScaleRange = 0.02;
    [self.goodAniButton setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
    
    [self.goodAniButton addTarget:self action:@selector(onTapGoodAniButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.goodAniButton];
    [self.viewArrays addObject:self.goodAniButton];
}

- (void)setupCuteView
{
    self.cuteView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, JKYUIScreenWidth, 350)];
    self.cuteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.cuteView];
    [self.viewArrays addObject:self.cuteView];
    
    JKYShineParams *param1 = [JKYShineParams new];
    param1.bigShineColor = [UIColor colorWithRed:152/255.0 green:152/255.0 blue:38/255.0 alpha:1];
    param1.smallShineColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    JKYShineButton *btn1 = [[JKYShineButton alloc] initWithFrame:CGRectMake(80, 50, 60, 60) params:param1];
    btn1.fillColor = [UIColor colorWithRed:152/255.0 green:152/255.0 blue:38/255.0 alpha:1];
    btn1.color = [UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1];
    [self.cuteView addSubview:btn1];
    
    JKYShineParams *param2 = [JKYShineParams new];
    param2.bigShineColor = [UIColor colorWithRed:255/255.0 green:95/255.0 blue:89/255.0 alpha:1];
    param2.smallShineColor = [UIColor colorWithRed:216/255.0 green:152/255.0 blue:148/255.0 alpha:1];
    param2.shineCount = 15;
    param2.smallShineOffsetAngle = -5;
    JKYShineButton *btn2 = [[JKYShineButton alloc] initWithFrame:CGRectMake(220, 50, 60, 60) params:param2];
    btn2.fillColor = [UIColor colorWithRed:255/255.0 green:95/255.0 blue:89/255.0 alpha:1];
    btn2.color = [UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1];
    btn2.image = [[JKYShineImage alloc] initWithType:JKYShineImageTypeLike];
    [self.cuteView addSubview:btn2];
    
    JKYShineParams *param3 = [JKYShineParams new];
    param3.allowRandomColor = YES;
    JKYShineButton *btn3 = [[JKYShineButton alloc] initWithFrame:CGRectMake(80, 200, 60, 60) params:param3];
    btn3.fillColor = [UIColor colorWithRed:255/255.0 green:41/255.0 blue:1/255.0 alpha:1];
    btn3.color = [UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1];
    btn3.image = [[JKYShineImage alloc] initWithType:JKYShineImageTypeSmile];
    [self.cuteView addSubview:btn3];
    
    JKYShineParams *param4 = [JKYShineParams new];
    param4.enableFlashing = YES;
    JKYShineButton *btn4 = [[JKYShineButton alloc] initWithFrame:CGRectMake(220, 200, 60, 60) params:param4];
    btn4.fillColor = [UIColor colorWithRed:167/255.0 green:99/255.0 blue:154/255.0 alpha:1];
    btn4.color = [UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1];
    btn4.image = [[JKYShineImage alloc] initWithType:JKYShineImageTypeStar];
    [self.cuteView addSubview:btn4];
    
    
    
    
}




#pragma mark - Attributes
- (UIButton *)pathButton
{
    if (!_pathButton) {
        _pathButton = [UIButton new];
        _pathButton.backgroundColor = [UIColor redColor];
        [_pathButton setTitle:@"Path" forState:UIControlStateNormal];
        [_pathButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_pathButton addTarget:self action:@selector(onTapPathButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pathButton;
}

- (UIButton *)bubbleButton
{
    if (!_bubbleButton) {
        _bubbleButton = [UIButton new];
        _bubbleButton.backgroundColor = [UIColor redColor];
        [_bubbleButton setTitle:@"Bubble" forState:UIControlStateNormal];
        [_bubbleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bubbleButton addTarget:self action:@selector(onTapBubbleButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bubbleButton;
}

- (UIButton *)goodButton
{
    if (!_goodButton) {
        _goodButton = [UIButton new];
        _goodButton.backgroundColor = [UIColor redColor];
        [_goodButton setTitle:@"Good" forState:UIControlStateNormal];
        [_goodButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_goodButton addTarget:self action:@selector(onTapGoodButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goodButton;
}

- (UIButton *)cuteButton
{
    if (!_cuteButton) {
        _cuteButton = [UIButton new];
        _cuteButton.backgroundColor = [UIColor redColor];
        [_cuteButton setTitle:@"Cute" forState:UIControlStateNormal];
        [_cuteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cuteButton addTarget:self action:@selector(onTapCuteButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cuteButton;
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
