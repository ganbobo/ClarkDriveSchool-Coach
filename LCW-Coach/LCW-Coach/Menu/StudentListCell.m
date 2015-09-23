//
//  StudentListCell.m
//  LCW-Coach
//
//  Created by Clark.Gan on 15/9/23.
//  Copyright © 2015年 Clark. All rights reserved.
//

#import "StudentListCell.h"

@interface StudentListCell () {
    
    __weak IBOutlet UILabel *_lblName;
    __weak IBOutlet UILabel *_lblCount;
    __weak IBOutlet UILabel *_lblDays;
    __weak IBOutlet UILabel *_lblState;
}

@end

@implementation StudentListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
