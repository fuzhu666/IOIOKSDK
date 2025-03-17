//
//  IOIOKWDRequestResponse.h
//  IOIOKSDK
//
//  Created by zhijieli on 2024/9/9.
//

#import <Foundation/Foundation.h>
#import <IOIOKSDK/IOIOKWDRequestData.h>
NS_ASSUME_NONNULL_BEGIN

@interface IOIOKWDRequestResponse : NSObject

@property (nonatomic, strong) IOIOKWDRequestData *data;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
