//
//  EditController.h
//  toone_lyWeb
//
//  Created by 上海同望 on 2018/1/2.
//  Copyright © 2018年 st. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditController : UIViewController
@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, copy) void(^block)(NSString *text);

@property (nonatomic, assign) NSInteger row;
@end
