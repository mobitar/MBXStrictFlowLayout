//
//  MBXHeaderInsetFlowLayout.m
//  ParkWhiz
//
//  Created by Mo Bitar on 11/18/15.
//  Copyright © 2015 ParkWhiz. All rights reserved.
//

#import "MBXHeaderInsetFlowLayout.h"

@implementation MBXHeaderInsetFlowLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes *attrs in attributes) {
        NSString *kind = [attrs representedElementKind];
        if (kind == UICollectionElementKindSectionHeader) {
            UIEdgeInsets sectionInsets = [(id<UICollectionViewDelegateFlowLayout>)[[self collectionView] delegate] collectionView:[self collectionView] layout:self insetForSectionAtIndex:[[attrs indexPath] section]];
            CGRect headerRect = [attrs frame];
            headerRect.origin.y = headerRect.origin.y + sectionInsets.top;
            [attrs setFrame:headerRect];
        }
    }
    return attributes;
}

- (UICollectionViewLayoutAttributes*)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attributes = [[super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath] copy];
    if(!self.animateEntrance) {
        return attributes;
    }
    attributes.transform = CGAffineTransformMakeScale(0.1, 0.1);
    return attributes;
}

- (UICollectionViewLayoutAttributes*)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attributes = [[super finalLayoutAttributesForDisappearingItemAtIndexPath:itemIndexPath] copy];
    if(!self.animateEntrance) {
        return attributes;
    }
    attributes.transform = CGAffineTransformIdentity;
    return attributes;
}

@end
