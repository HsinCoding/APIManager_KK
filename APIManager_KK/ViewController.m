//
//  ViewController.m
//  APIManager_KK
//
//  Created by ＵＳＥＲ on 2019/9/9.
//  Copyright © 2019 hsin_project. All rights reserved.
//

#import "ViewController.h"
#import "APIManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[APIManager sharedInstance] fetchGetResponseWithCallback:^(NSDictionary * _Nonnull dict, NSError * _Nonnull error) {
        
    }];
    
    [[APIManager sharedInstance] postCustomerName:nil callback:^(NSDictionary * _Nonnull dict, NSError * _Nonnull error) {
        
    }];
    
    [[APIManager sharedInstance] fetchImageWithCallback:^(UIImage * _Nonnull img, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
             [self.imgView  setImage:img];
        }) ;
       
        
    }];
    
}


@end
