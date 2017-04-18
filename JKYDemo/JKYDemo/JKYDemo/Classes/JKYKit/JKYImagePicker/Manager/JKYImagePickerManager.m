//
//  JKYImagePickerManager.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/4/7.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYImagePickerManager.h"


@import Photos;


@implementation JKYImagePickerManager

+ (void)checkAlbumPrivacy:(BOOL)showTip completionBlock:(void (^)(BOOL hasAuthorization))block
{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    switch (status) {
        case PHAuthorizationStatusRestricted:
        case PHAuthorizationStatusDenied:
            if (showTip) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"没有照片权限" message:@"请在iPhone的“设置-隐私-照片”选项中，允许访问你的相册。" preferredStyle:UIAlertControllerStyleActionSheet];
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
                UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
                [vc presentViewController:alert animated:YES completion:nil];
                if (block) {
                    block(NO);
                }
            }
            break;
        case PHAuthorizationStatusAuthorized:
            if (block) {
                block(YES);
            }
            break;
        case PHAuthorizationStatusNotDetermined:
            
            break;
            
        default:
            break;
    }
    
    
}



















@end
