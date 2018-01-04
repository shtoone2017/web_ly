//
//  WebViewController.m
//  toone_lyWeb
//
//  Created by 上海同望 on 2018/1/2.
//  Copyright © 2018年 st. All rights reserved.
//

#import "WebViewController.h"
#import "SVProgressHUD.h"

@interface WebViewController ()

@end
@implementation WebViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadWKView];
    [SVProgressHUD showWithStatus:@"加载中...."];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self loadWKView];
}


#pragma mark - webView
-(void)loadWKView{
    self.wkView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    NSString *urlString = @"";
    urlString = _urlString;
    [self.wkView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    self.wkView.navigationDelegate = self;
    [self.view addSubview:self.wkView];
    //    [[UIApplication sharedApplication].keyWindow addSubview:self.wkView];
    //侧滑返回上级
    [self.wkView setAllowsBackForwardNavigationGestures:true];
    [self.wkView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
}
// 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self.wkView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1) {
            self.progressView.hidden = YES;
            [self.progressView setProgress:0 animated:NO];
        }else {
            self.progressView.hidden = NO;
            [self.progressView setProgress:newprogress animated:YES];
        }
    }
}
-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    [self.wkView removeObserver:self forKeyPath:@"estimatedProgress"];
    [SVProgressHUD dismiss];
}
- (UIProgressView *)progressView {
    if(!_progressView) {
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 66, [UIScreen mainScreen].bounds.size.width, 2)];
        self.progressView.tintColor = [UIColor greenColor];
        self.progressView.trackTintColor = [UIColor whiteColor];
        [self.view addSubview:self.progressView];
    }
    return _progressView;
}
#pragma mark - WKUIDelegate
//开始加载
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
}
//当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    
}
//页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [SVProgressHUD dismiss];
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
     [SVProgressHUD showErrorWithStatus:@"加载失败！"];
}
//跳转到其他的服务器
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
    
}


@end
