//
//  EventEmitterModule.m
//  AwesomeProject
//
//  Created by 林 on 2024/7/27.
//

#import "EventEmitterModule.h"


@implementation EventEmitterModule

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents {
  return @[@"UsersLoaded"];
}

RCT_EXPORT_METHOD(emitEvent:(NSString *)name body:(NSDictionary *)body) {
  [self sendEventWithName:name body:body];
}

+ (BOOL)requiresMainQueueSetup {
  return YES;
}

@end
