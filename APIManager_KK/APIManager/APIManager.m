//
//  APIManager.m
//  APIManager_KK
//
//  Created by ＵＳＥＲ on 2019/9/9.
//  Copyright © 2019 hsin_project. All rights reserved.
//

#import "APIManager.h"


@implementation APIManager

-(void) fetchGetResponseWithCallback:(void (^)(NSDictionary *dict, NSError *error))callback{
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://httpbin.org/get"]];
    
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            callback(responseDictionary,error);
       
    }];
    [dataTask resume];
}


- (void)postCustomerName:(NSString *)name callback:(void(^)(NSDictionary *dict, NSError *error))callback {
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://httpbin.org/post"]];
    
    //create the Method "post"
    [urlRequest setHTTPMethod:@"post"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                        callback(responseDictionary,error);
                                          
                                      }];
    [dataTask resume];
}

- (void)fetchImageWithCallback:(void(^)(UIImage *img, NSError *error))callback {
    
    NSURL *url = [NSURL URLWithString:
                  @"http://httpbin.org/image/png"];
    
    NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession]
                                                   downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                                       UIImage *downloadedImage = [UIImage imageWithData:
                                                                           [NSData dataWithContentsOfURL:location]];

                                                       callback(downloadedImage,error);
                                                   }];
    
    [downloadPhotoTask resume];
}

#pragma mark - singleton

+(APIManager *) sharedInstance {
    
    static APIManager *instance = nil;
    if (!instance) {
        instance = [[APIManager alloc] init];
    }
    return instance;
    
}


@end
