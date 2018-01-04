//
//  WebViewController.h
//  toone_lyWeb
//
//  Created by 上海同望 on 2018/1/2.
//  Copyright © 2018年 st. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import<WebKit/WebKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate,WKNavigationDelegate>
@property (strong, nonatomic)  WKWebView *wkView;
@property (strong, nonatomic) UIProgressView *progressView;
@property (nonatomic, copy) NSString *urlString;

@end
