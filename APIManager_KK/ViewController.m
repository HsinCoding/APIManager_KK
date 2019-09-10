//
//  ViewController.m
//  APIManager_KK
//
//  Created by ＵＳＥＲ on 2019/9/9.
//  Copyright © 2019 hsin_project. All rights reserved.
//

#import "ViewController.h"
#import "APIManager.h"

@interface ViewController ()<APIManagerDelegate>
   


@property (weak, nonatomic) IBOutlet UIImageView *bolckImgView;
@property (weak, nonatomic) IBOutlet UIImageView *delegateImgView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    #pragma mark - Block
    [[APIManager sharedInstance] fetchGetResponseWithCallback:^(NSDictionary * _Nonnull dict, NSError * _Nonnull error) {
        if (error == nil) {
            NSLog(@"Dict: %@",dict);
        } else {
            NSLog(@"Error: %@",error);
        }
       
    }];
    
    
    [[APIManager sharedInstance] postCustomerName:nil callback:^(NSDictionary * _Nonnull dict, NSError * _Nonnull error) {
        if (error == nil) {
            NSLog(@"Dict: %@",dict);
        } else {
            NSLog(@"Error: %@",error);
        }
    }];
    
    [[APIManager sharedInstance] fetchImageWithCallback:^(UIImage * _Nonnull img, NSError * _Nonnull error) {
        if (error == nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.bolckImgView  setImage:img];
            }) ;
        } else {
            NSLog(@"Error: %@",error);
        }
    }];
    
    
    #pragma mark - Delegate
    [APIManager sharedInstance].delegate = self;
    [[APIManager sharedInstance] fetchGetResponse];
    [[APIManager sharedInstance] postCustomerName:nil];
    [[APIManager sharedInstance] fetchImageWithCallback];
}

#pragma mark - APIManagerDelegate

- (void)fetchGetResponse:(NSDictionary *)dict {
    NSLog(@"Dict: %@",dict);
}

- (void)postCustomerName:(NSDictionary *)dict {
    NSLog(@"Dict: %@",dict);
}

- (void)fetchImageWithCallback:(UIImage *)img {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self->_delegateImgView setImage:img];
    });
  
}


@end
