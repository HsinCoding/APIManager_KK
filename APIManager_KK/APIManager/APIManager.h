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

@interface APIManager : NSObject

+(APIManager *) sharedInstance;

- (void) fetchGetResponseWithCallback:(void (^)(NSDictionary *dict, NSError *error))callback;
- (void) postCustomerName:(NSString *)name callback:(void(^)(NSDictionary *dict, NSError *error))callback;
- (void) fetchImageWithCallback:(void(^)(UIImage *img, NSError *error))callback;

@end

NS_ASSUME_NONNULL_END
