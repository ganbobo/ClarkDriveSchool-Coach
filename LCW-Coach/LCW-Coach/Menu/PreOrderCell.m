//
//  PreOrderCell.m
//  LCW-Coach
//
//  Created by Clark.Gan on 15/9/22.
//  Copyright © 2015年 Clark. All rights reserved.
//

#import "PreOrderCell.h"

@interface PreOrderCell () {
    
    __weak IBOutlet UILabel *_lblName;
    __weak IBOutlet UILabel *_lblCount;
    __weak IBOutlet UILabel *_lblDays;
    __weak IBOutlet UIButton *_btnHandle;
}

@end

@implementation PreOrderCell

- (void)awakeFromNib {
    // Initialization code
    _btnHandle.layer.borderColor = RGBA(0x00, 0x7A, 0xFF, 1).CGColor;
    _btnHandle.layer.borderWidth = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)clickHandle:(id)sender {
    
}

@end
