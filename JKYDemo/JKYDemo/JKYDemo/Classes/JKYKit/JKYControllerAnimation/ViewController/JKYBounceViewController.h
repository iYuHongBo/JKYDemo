//
//  JKYModalViewController.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/23.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JKYBounceViewController;

@protocol JKYModalViewControllerDelegate <NSObject>

-(void) modalViewControllerDidClickedDismissButton:(JKYBounceViewController *)viewController;

@end


@interface JKYBounceViewController : UIViewController

@property (nonatomic, weak) id<JKYModalViewControllerDelegate> delegate;


@end
