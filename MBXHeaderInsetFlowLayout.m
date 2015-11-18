//
//  MBXHeaderInsetFlowLayout.m
//  ParkWhiz
//
//  Created by Mo Bitar on 11/18/15.
//  Copyright © 2015 ParkWhiz. All rights reserved.
//

#import "MBXHeaderInsetFlowLayout.h"

@implementation MBXHeaderInsetFlowLayout

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
@end
