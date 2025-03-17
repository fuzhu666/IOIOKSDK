//
//  IOIOKSDK.h
//  IOIOKSDK
//
//  Created by zhijieli on 2024/8/20.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIViewController.h>
#import <IOIOKSDK/IOIOKConfig.h>
#import <IOIOKSDK/IOIOKUserInfo.h>
#import <IOIOKSDK/IOIOKAdListener.h>
#import <IOIOKSDK/IOIOKFileLog.h>
#import <IOIOKSDK/IOIOKTAPManager.h>
#import <IOIOKSDK/IOIOKArkData.h>
#import <IOIOKSDK/IOIOKGameConfig.h>
#import <IOIOKSDK/IOIOKWDRequestResponse.h>
#import <IOIOKSDK/IOIOKWDRecordData.h>
#import <IOIOKSDK/IOIOKBaseRequestBean.h>
#import <IOIOKSDK/IOIOKWDRecordRequest.h>
#import <IOIOKSDK/IOIOKWDRecordResponse.h>
#import <IOIOKSDK/IOIOKTAPInfoResponseBean.h>
#import <IOIOKSDK/IOIOKTAPListResponsesBean.h>
// In this header, you should import all the public headers of your framework using statements like #import <IOIOKSDK/PublicHeader.h>
NS_ASSUME_NONNULL_BEGIN
@interface IOIOKSDK : NSObject

+ (instancetype)getInstance;
-(UIViewController *) getContext;
- (void)initWithCompletion:(void (^)(BOOL success, IOIOKUserInfo* userinfo))completedCallback andUIViewCtrl:(UIViewController *) context;

- (IOIOKUserInfo*)getUserInfo;
- (NSString *)getLanguage;

-(void)feachArkConfigWithBizCodes:(NSString * )bizCodes andCallback:(void (^)(BOOL success, NSArray<IOIOKArkData *> * _Nullable response))completion;
-(void)feachIOIOKGameConfigWithBizCodes:(NSString * )bizCodes andCallback:(void (^)(BOOL success, NSArray<IOIOKGameConfig *> * _Nullable response))completion;
- (void)httpGetWithDict:(NSDictionary * _Nullable) dict andApi:(NSString *)api andComplete:(void (^)(NSString * response))complete;
- (void)httpPostWithDict:(NSDictionary * _Nullable) dict andApi:(NSString *)api andComplete:(void (^)(NSString * response))complete;


- (void)requestMicroWDWithAssetsType:(NSInteger)assetsType
                               paymentType:(NSString *)paymentType
                                   account:(NSString *)account
                                     name:(NSString *)name
                                   amount:(double)amount
                        disanfangzhanghuleixing:(NSString *)disanfangzhanghuleixing
                            gerenshibiehao:(NSString *)gerenshibiehao
                                completion:(void (^)(BOOL success, IOIOKWDRequestResponse *response))completion;

- (void)getWDRecordWithCompletion:(void (^)(BOOL success, IOIOKWDRecordData *data))completion;
////
////// 广告播放

- (void)showRewardVideoWithSceneId:(NSString *)sceneId
                          didReward:(DidRewardBlock)didReward
                           didFail:(DidFailBlock)didFail ;
//
- (BOOL)isRewardVideoReady ;


- (void)showInterstitialWithSceneId:(NSString *)sceneId
                              didHide:(DidHideBlock)didHide
                            didFail:(DidFailBlock)didFail ;

- (BOOL)isInterstitialReady;

- (void)showOpenAdWithSceneId:(NSString *)sceneId
                       didHide:(DidHideBlock)didHide
                      didFail:(DidFailBlock)didFail;
- (BOOL)isOpenAdReady ;
- (BOOL)isRewarded ;
- (BOOL)isBannerReady:(NSString *) type andSceneType:(NSString *)sceneType;
- (void)reShowBanner:(NSString *) type andSceneType:(NSString *)sceneType;
- (BOOL)isNativeReady:(NSString *) type andSceneType:(NSString *)sceneType;
-(void)destryBanner:(NSString *) type andSceneType:(NSString *)sceneType;
-(void)destryNative:(NSString *) type andSceneType:(NSString *)sceneType;
-(void)hideBanner:(NSString *) type andSceneType:(NSString *)sceneType;
- (void)showBannerWithSceneId:(NSString *)sceneId
                              didHide:(DidHideBlock)didHide
                            didFail:(DidFailBlock)didFail
                      context:(UIViewController *)context
                        bannerView:(UIView *)bannerView
                        bannerType:(NSString *) type;
- (void)showNativeWithSceneId:(NSString *)sceneId
                              didHide:(DidHideBlock)didHide
                            didFail:(DidFailBlock)didFail
                            didShow:(DidShowBlock)didShow
                      context:(UIViewController *)context
                        nativeView:(UIView *)nativeView
                    andAdType:(NSString *) adType;
//
+ (void)showVideoWithSceneType:(NSString *)sceneType
                      didReward:(DidRewardBlock)didReward
                       didFail:(DidFailBlock)didFail;
// 打点
- (void)trackWithEventName:(NSString *)eventName
                   dictMap:(NSDictionary<NSString *, NSString *> *)dictMap;
//
- (void)trackImmediatelyWithEventName:(NSString *)eventName
                              dictMap:(NSDictionary<NSString *, NSString *> *)dictMap;
// 打点
- (void)trackWithEventName:(NSString *)eventName
                 eventJson:(NSString *)eventJson;
//
// 打点
- (void)trackImmediatelyWithEventName:(NSString *)eventName
                            eventJson:(NSString *)eventJson ;


- (void)afTrackWithEventName:(NSString *)eventName
                    eventMap:(NSDictionary<NSString *, NSString *> *)eventMap;
- (NSString *)getVersionName;
- (NSString *)getVersionCode;
- (long)getServerRealTimeStamp;
- (NSString *)getServerRealTimeData;
- (void)trackLevelplayWithRevenue:(NSString *)af_revenue
                           currency:(NSString *)af_currency
                          quantity:(NSString *)af_quantity
                        contentID:(NSString * _Nullable)af_content_id
                          orderID:(NSString * _Nullable)af_order_id
                        receiptID:(NSString * _Nullable)af_receipt_id;
- (void)trackPShowWithType:(NSString *)type result:(NSString *)result;
- (void)trackPSucWithType:(NSString *)type
                    result:(NSString *)result
                     level:(NSString *)level
                    reason:(NSString *)reason
                  goodsId:(NSString *)goodsId
                   sku_id:(NSString * _Nullable)sku_id ;
- (void)trackPClickWithType:(NSString *)type
                      result:(NSString *)result
                       level:(NSString *)level
                      reason:(NSString *)reason
                    goodsId:(NSString *)goodsId
                     sku_id:(NSString * _Nullable)sku_id;
- (void)initializeFBWithApplication:(UIApplication *)application
                            launchOptions:(NSDictionary *)launchOptions ;

- (BOOL)handleFBOpenURL:(UIApplication *)application
                 url:(NSURL *)url
                      options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options ;

- (void)handleFBOpenURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts API_AVAILABLE(ios(13.0));
- (void)fbTrackWithEventName:(NSString *)eventName
                    eventMap:(nullable NSDictionary<NSString *, NSString *> *)eventMap;
@end
NS_ASSUME_NONNULL_END
