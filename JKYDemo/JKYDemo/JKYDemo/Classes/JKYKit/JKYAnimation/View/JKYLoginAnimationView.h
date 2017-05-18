//
//  JKYLoginAnimationView.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/18.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JKYLoginAnimationType) {
    JKYLoginAnimationTypeHideAllEyes,
    JKYLoginAnimationTypeHideNoEyes,
    JKYLoginAnimationTypeHideLeftEye,
    JKYLoginAnimationTypeHideRightEye,
};


@interface JKYLoginAnimationView : UIView

@property (nonatomic, assign) JKYLoginAnimationType animationType;

@property (nonatomic, strong) UILabel *titleLabel;




@end
