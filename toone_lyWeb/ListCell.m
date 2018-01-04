//
//  ListCell.m
//  toone_lyWeb
//
//  Created by 上海同望 on 2018/1/2.
//  Copyright © 2018年 st. All rights reserved.
//

#import "ListCell.h"
#import "webList_Model.h"

@interface ListCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *bigLabel;


@end
@implementation ListCell

- (void)awakeFromNib {
    [super awakeFromNib];
}


-(void)setModel:(webList_Model *)model {
    _model = model;
    _bigLabel.text = model.banhezhanminchen;
    _icon.image = [UIImage imageNamed:model.icon];
}

@end
