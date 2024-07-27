//
//  AWUIEeventManager.m
//  AwesomeProject
//
//  Created by 林 on 2024/7/27.
//

#import "AWUIEeventManager.h"
#import <React/RCTLog.h>
#import <UIKit/UIKit.h>

@implementation AWUIEeventManager

// To export a module named AlertManager
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(showAlert:(NSString *)title message:(NSString *)message)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                       // Handle the action
                                                     }];

    [alertController addAction:okAction];
    UIViewController * rootViewController = [UIApplication sharedApplication].windows.firstObject.rootViewController;
      if (rootViewController.presentedViewController) {
          [rootViewController.presentedViewController presentViewController:alertController animated:YES completion:nil];
      }
  });
}

@end
