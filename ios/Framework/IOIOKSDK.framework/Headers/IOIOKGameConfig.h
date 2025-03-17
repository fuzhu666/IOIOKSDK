//
//  IOIOKGameConfig.h
//  IOIOKSDK
//
//  Created by zhijieli on 2024/9/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOIOKGameConfig : NSObject

@property (nonatomic, copy) NSString *bCode;
@property (nonatomic, strong) id configContent;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
