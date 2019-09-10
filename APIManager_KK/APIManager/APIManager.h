//
//  APIManager.h
//  APIManager_KK
//
//  Created by ＵＳＥＲ on 2019/9/9.
//  Copyright © 2019 hsin_project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol APIManagerDelegate <NSObject>

- (void)fetchGetResponse:(NSDictionary *)dict;
- (void)postCustomerName:(NSDictionary *)dict;
- (void)fetchImageWithCallback:(UIImage *)img;

@end


@interface APIManager : NSObject

+(APIManager *) sharedInstance;

// Block
- (void) fetchGetResponseWithCallback:(void (^)(NSDictionary *dict, NSError *error))callback;
- (void) postCustomerName:(NSString * __nullable)name callback:(void(^)(NSDictionary *dict, NSError *error))callback;
- (void) fetchImageWithCallback:(void(^)(UIImage *img, NSError *error))callback;

// Delegate
- (void)fetchGetResponse;
- (void)postCustomerName:(NSString *__nullable)name;
- (void)fetchImageWithCallback;

@property (weak, nonatomic) id<APIManagerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
