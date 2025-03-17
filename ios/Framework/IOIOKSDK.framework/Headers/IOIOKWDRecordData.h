//
//  IOIOKWDRecordData.h
//  IOIOKSDK
//
//  Created by zhijieli on 2024/9/9.
//

#import <Foundation/Foundation.h>
#import <IOIOKSDK/IOIOKWDRecordItemData.h>
#import <IOIOKSDK/IOIOKBalances.h>
#import <IOIOKSDK/IOIOKWDRecordData.h>
NS_ASSUME_NONNULL_BEGIN


@interface IOIOKWDRecordData : NSObject

@property (nonatomic, assign) float total;
@property (nonatomic, strong) NSArray<IOIOKWDRecordItemData *> *list;
@property (nonatomic, strong) NSArray<IOIOKBalances *> *zhanghuyue;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;
@end

NS_ASSUME_NONNULL_END
