//
//  ViewController.m
//  toone_lyWeb
//
//  Created by 上海同望 on 2018/1/2.
//  Copyright © 2018年 st. All rights reserved.
//

#import "ViewController.h"
#import "MyNavigationController.h"
#import "ListCell.h"
#import "WebViewController.h"
#import "EditController.h"
#import "BaseModel.h"
#import "SVProgressHUD.h"
#import "MJRefresh.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tb;
@property (nonatomic,strong) NSMutableArray* data;
@property (nonatomic,strong) MJRefreshHeader *header;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
    _header = [MJRefreshHeader headerWithRefreshingBlock:^{
        [self startRequest];
    }];
    _tb.mj_header = _header;
    [_header beginRefreshing];
}
-(void)loadUI{
    self.title = @"综合平台";
    self.tb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tb.delegate = self;
    self.tb.dataSource = self;
    [self.view addSubview:self.tb];
    self.tb.tableFooterView = [[UIView alloc] init];
//    self.tb.separatorColor = [UIColor clearColor];

    [self.tb registerNib:[UINib nibWithNibName:@"ListCell" bundle:nil] forCellReuseIdentifier:@"ListCell"];
}

- (void)startRequest
{
    [SVProgressHUD showWithStatus:@"Loading..."];
    NSURL *url = [NSURL URLWithString:BaseUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
            [_header endRefreshing];
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if (dic)
            {
                BaseModel *model = [BaseModel modelObjectWithDictionary:dic];
                self.data = [NSMutableArray arrayWithArray:model.data];
                [self.tb reloadData];
            }
            else
            {
                [SVProgressHUD showErrorWithStatus:@"请求失败,请重试"];
            }
        });
    }];
    [task resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    Data *model = [self.data objectAtIndex:indexPath.row];
    cell.model = model;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Data *model = [self.data objectAtIndex:indexPath.row];
    if (model.url.length <=5)
    {
        [SVProgressHUD showErrorWithStatus:@"链接不存在,请联系管理员添加系统链接"];
    }
    else
    {
        WebViewController *vc = [[WebViewController alloc] init];
        vc.urlString = model.url;
        vc.title = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
