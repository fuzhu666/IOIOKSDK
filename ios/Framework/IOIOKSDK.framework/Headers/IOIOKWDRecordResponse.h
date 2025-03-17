//
//  IOIOKWDRequestData.h
//  IOIOKSDK
//
//  Created by zhijieli on 2024/9/9.
//

#import <Foundation/Foundation.h>
#import <IOIOKSDK/IOIOKWDRecordData.h>
NS_ASSUME_NONNULL_BEGIN


@interface IOIOKWDRecordResponse : NSObject

@property (nonatomic, strong) IOIOKWDRecordData *data;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;
@end

NS_ASSUME_NONNULL_END
