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
#import "webList_Model.h"
#import "WebViewController.h"
#import "EditController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tb;
@property (nonatomic,strong) NSMutableArray* data;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
    [self loadData];
}
-(void)loadUI{
    self.title = @"上海同望";
    self.tb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tb.delegate = self;
    self.tb.dataSource = self;
    [self.view addSubview:self.tb];
    self.tb.tableFooterView = [[UIView alloc] init];
//    self.tb.separatorColor = [UIColor clearColor];

    [self.tb registerNib:[UINib nibWithNibName:@"ListCell" bundle:nil] forCellReuseIdentifier:@"ListCell"];
}
-(void)loadData {
//    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"Webdata" ofType:@"plist"];
//    NSArray* list = [[NSArray alloc] initWithContentsOfFile:plistPath]; 
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path1 = [pathArray objectAtIndex:0];
    NSString *myPath = [path1 stringByAppendingPathComponent:@"xiaoxi.plist"];
    //根据之前保存的容器类型读取数据
    NSMutableArray * datas = [NSMutableArray array];
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:myPath];
    for (int i = 0; i < 9; ++i) {
        NSString *num = [NSString stringWithFormat:@"num%d",i];
        webList_Model * model = [webList_Model modelWithDict:dataDictionary[num]];
        [datas addObject:model];
    }
    
//    for (NSDictionary* dict in dataDictionary) {
////        @autoreleasepool {
//            webList_Model * model = [webList_Model modelWithDict:dict];
//            [datas addObject:model];
////        }
//    }
    self.data = datas;
    [self.tb reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    webList_Model *model = [self.data objectAtIndex:indexPath.row];
    cell.model = model;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WebViewController *vc = [[WebViewController alloc] init];
    webList_Model *model = [self.data objectAtIndex:indexPath.row];
    vc.urlString = model.departid;
    vc.title = model.banhezhanminchen;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle !=UITableViewCellEditingStyleDelete) {
        return;
    }
    EditController *vc = [[EditController alloc] init];
    webList_Model *model = [self.data objectAtIndex:indexPath.row];
    vc.urlString = model.departid;
    vc.title = model.banhezhanminchen;
    vc.row = indexPath.row;
    vc.block = ^(NSString *text) {
        [self loadData];
        NSLog(@"====%@",text);
    };
//    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:vc];
    MyNavigationController *nav = [[MyNavigationController alloc] initWithRootViewController:vc];
    self.definesPresentationContext = YES;
    vc.wantsFullScreenLayout = YES;
    [self presentModalViewController:nav animated:YES];
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"修改网址";
}



@end
