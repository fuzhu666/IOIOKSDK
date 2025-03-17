//
//  IOIOKFileLog.h
//  IOIOKSDK
//
//  Created by zhijieli on 2024/9/6.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>

@interface IOIOKFileLog : NSObject
+ (void)logMessage:(NSString *)message withTag:(NSString *)tag;
+ (void)logError:(NSError *)error withTag:(NSString *)tag;
+ (void)logException:(NSException *)exception withTag:(NSString *)tag;
@end

