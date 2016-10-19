//
//  GDMarginLabel.m
//  GDPerformanceView
//
//  Created by Daniil on 19.10.16.
//  Copyright © 2016 Gavrilov Daniil. All rights reserved.
//

#import "GDMarginLabel.h"

@interface GDMarginLabel ()

@property (nonatomic, assign) UIEdgeInsets edgeInsets;

@end

@implementation GDMarginLabel

#pragma mark - 
#pragma mark - Init Methods & Superclass Overriders

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.edgeInsets = UIEdgeInsetsMake(0.0f, 5.0f, 0.0f, 5.0f);
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    size.width += self.edgeInsets.left + self.edgeInsets.right;
    size.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return size;
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize sizeThatFits = [super sizeThatFits:size];
    sizeThatFits.width += self.edgeInsets.left + self.edgeInsets.right;
    sizeThatFits.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return sizeThatFits;
}

@end
