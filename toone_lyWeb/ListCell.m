//
//  ListCell.m
//  toone_lyWeb
//
//  Created by 上海同望 on 2018/1/2.
//  Copyright © 2018年 st. All rights reserved.
//

#import "ListCell.h"
#import "UIImageView+WebCache.h"
@interface ListCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *bigLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLab;


@end
@implementation ListCell

- (void)awakeFromNib {
    [super awakeFromNib];
}


-(void)setModel:(Data *)model {
    _model = model;
    _bigLabel.text = model.title;
    _subTitleLab.text = model.xiangmubuname;
    [_icon sd_setImageWithURL:[NSURL URLWithString:ImgUrl(model.imgname)] placeholderImage:[UIImage imageNamed:@"隐患排查"]];
}

@end
