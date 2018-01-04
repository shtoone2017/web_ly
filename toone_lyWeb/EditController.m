//
//  EditController.m
//  toone_lyWeb
//
//  Created by 上海同望 on 2018/1/2.
//  Copyright © 2018年 st. All rights reserved.
//

#import "EditController.h"
#import "SVProgressHUD.h"

@interface EditController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end
@implementation EditController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _textField.text = _urlString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
//    [self tt];
}
-(void)tt {
//    NSString *filePatch = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"xiaoxi.plist"];
//    //写入数据到plist文件
//    NSMutableDictionary *dic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"小小虎",@"name",@"5",@"age",@"boy",@"sex",nil];
//    NSMutableDictionary *dic2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"小小兮",@"name",@"6",@"age",@"girl",@"sex",nil];
//    //将上面2个小字典保存到大字典里面
//    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];    [dataDic setObject:dic1 forKey:@"一年级"];
//    [dataDic setObject:dic2 forKey:@"二年级"];    //写入plist里面
//    [dataDic writeToFile:filePatch atomically:YES];        //读取plist文件的内容
//    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
//    NSLog(@"---plist一开始保存时候的内容---%@",dataDictionary);
    
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path1 = [pathArray objectAtIndex:0];
    NSString *myPath = [path1 stringByAppendingPathComponent:@"xiaoxi.plist"];
    //根据之前保存的容器类型读取数据
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:myPath];
    NSLog(@"---plist一开始保存时候的内容---%@",dataDictionary);
    //修改字典里面的内容,先按照结构取到你想修改内容的小字典
    NSMutableDictionary *dd = [dataDictionary objectForKey:@"一年级"];
    [dd setObject:@"我改名字了哦" forKey:@"name"];
    [dd setObject:@"我添加的新内容" forKey:@"content"];
    //修改成功以后，将这个小字典重新添加到大字典里面
    [dataDictionary setObject:dd forKey:@"一年级"];
    [dataDictionary writeToFile:myPath atomically:YES];
    NSLog(@"---plist做过操作之后的字典里面内容---%@",dataDictionary);
}


-(void)loadData:(NSString *)text{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    //获取文件的完整路径
    NSString *filePatch = [path stringByAppendingPathComponent:@"xiaoxi.plist"];
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
//    NSLog(@"---plist一开始保存时候的内容---%@",dataDictionary);
    
    
    //根据列表一一对应顺序关系进行修改(太死板)
    NSString *num = [NSString stringWithFormat:@"num%zd",_row?:1];
    NSMutableDictionary *dd = [dataDictionary objectForKey:num];
    [dd setObject:text forKey:@"departid"];
    
    //修改成功以后，将这个小字典重新添加到大字典里面
    [dataDictionary setObject:dd forKey:num];
    [dataDictionary writeToFile:filePatch atomically:YES];
//    NSLog(@"---plist做过操作之后的字典里面内容---%@",dataDictionary);
}

-(void)loadUI {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:0 target:self action:@selector(searchButtonClick:)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem.tag = 3;
    self.navigationItem.rightBarButtonItem.enabled = NO;
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:14],NSFontAttributeName, nil] forState:UIControlStateNormal];
    [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:0 target:self action:@selector(searchButtonClick:)];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:14],NSFontAttributeName, nil] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem.tag = 2;
}

-(void)searchButtonClick:(UIBarButtonItem *)button {
    switch (button.tag) {
        case 2:{
            [self dismissModalViewControllerAnimated:YES];
        }
            break;
        case 3:{
            NSString *text = self.textField.text;
            if (text.length == 0) {
                [SVProgressHUD showErrorWithStatus:@"内容不能为空"];
                return;
            }
            if (self.block) {
                [self loadData:text];
                self.block(text);
            }
            [self dismissModalViewControllerAnimated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)textFieldDidChange:(id)sender {
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

@end
