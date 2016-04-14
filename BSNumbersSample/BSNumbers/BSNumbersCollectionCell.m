//
//  BSNumbersCollectionCell.m
//  BSNumbersSample
//
//  Created by 张亚东 on 16/4/6.
//  Copyright © 2016年 blurryssky. All rights reserved.
//

#import "BSNumbersCollectionCell.h"

@interface BSNumbersCollectionCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelLeadingSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelTrailingSpace;

@end

@implementation BSNumbersCollectionCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)drawRect:(CGRect)rect {
    
    [self layoutIfNeeded];
    
    [[UIColor lightGrayColor] set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.bounds.size.width, 0)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    path.lineWidth = 1;
    
    [path stroke];
}

- (void)prepareForReuse {
    [self setNeedsDisplay];
}

- (void)setHorizontalMargin:(CGFloat)horizontalMargin {
    _horizontalMargin = horizontalMargin;
    
    self.labelLeadingSpace.constant = horizontalMargin;
    self.labelTrailingSpace.constant = horizontalMargin;
    
    [self updateConstraints];
}

@end
