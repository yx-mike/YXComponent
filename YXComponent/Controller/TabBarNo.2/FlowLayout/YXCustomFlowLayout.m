//
//  YXCustomFlowLayout.m
//  YXComponent
//
//  Created by weidian2015090112 on 12/23/15.
//  Copyright © 2015 yx. All rights reserved.
//

#import "YXCustomFlowLayout.h"

@implementation YXCustomFlowLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)prepareLayout {
    [super prepareLayout];
    //
}

#pragma mark - 返回cell的布局属性

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return nil;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - 自动停在某个位置

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset {
    return CGPointZero;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    return CGPointZero;
}

#pragma mark - CollectionView改变时是否重新布局

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
