//
//  IOIOKWDRecordRequest.h
//  IOIOKSDK
//
//  Created by zhijieli on 2024/9/9.
//
#import <IOIOKSDK/IOIOKBaseRequestBean.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOIOKWDRecordRequest : IOIOKBaseRequestBean
@property (nonatomic, assign) NSInteger zichanleixing;
@property (nonatomic, assign) NSInteger tixianleixing;
- (NSDictionary *)toDictionary;
- (NSString *)toJson;

@end
NS_ASSUME_NONNULL_END
