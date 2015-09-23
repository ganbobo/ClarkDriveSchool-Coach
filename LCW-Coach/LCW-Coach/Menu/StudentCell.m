//
//  StudentCell.m
//  LCW-Coach
//
//  Created by Clark.Gan on 15/9/23.
//  Copyright © 2015年 Clark. All rights reserved.
//

#import "StudentCell.h"

@implementation StudentCell

- (void)awakeFromNib {
    // Initialization code
    self.detailTextLabel.textColor = RGBA(0x00, 0x7A, 0xFF, 1);
    self.textLabel.textColor = RGBA(0x32, 0x32, 0x32, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCell:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            self.imageView.image = [UIImage imageNamed:@"student_current"];
            self.textLabel.text = @"目前学员";
        }
            break;
        case 1: {
            self.imageView.image = [UIImage imageNamed:@"student_pass"];
            self.textLabel.text = @"通过学员";
        }
            break;
        case 2: {
            self.imageView.image = [UIImage imageNamed:@"student_all"];
            self.textLabel.text = @"全部学员";
        }
            break;
        default:
            break;
    }
}

@end
