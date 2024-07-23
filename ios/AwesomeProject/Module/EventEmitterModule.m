//
//  EventEmitterModule.m
//  AwesomeProject
//
//  Created by 林 on 2024/7/22.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"
@interface RCT_EXTERN_MODULE(EventEmitterModule, RCTEventEmitter)
//RCT_EXTERN_METHOD(supportedEvents)

RCT_EXTERN_METHOD(emitEvent:(NSString *)name body:(NSDictionary *)body)
@end
