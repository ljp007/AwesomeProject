//
//  EventEmitterModule.h
//  AwesomeProject
//
//  Created by 林 on 2024/7/27.
//

#import <Foundation/Foundation.h>
#import <React/RCTEventEmitter.h>
#import <React/RCTBridgeModule.h>
NS_ASSUME_NONNULL_BEGIN

@interface EventEmitterModule : RCTEventEmitter <RCTBridgeModule>

@end

NS_ASSUME_NONNULL_END
