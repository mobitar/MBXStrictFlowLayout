//
//  MBXStrictFlowLayout.m
//  ParkWhiz
//
//  Created by Mo Bitar on 10/17/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "MBXStrictFlowLayout.h"

#define FLOAT_EPSILON 0.0001

@implementation MBXStrictFlowLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *answer = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    for(int i = 0; i < [answer count]; i++) {
        UICollectionViewLayoutAttributes *currentLayoutAttributes = answer[i];
        CGRect currentFrame = currentLayoutAttributes.frame;
        if(i == 0) {
            currentFrame.origin.x = self.sectionInset.left;
            currentLayoutAttributes.frame = currentFrame;
            continue;
        }
        UICollectionViewLayoutAttributes *prevLayoutAttributes = answer[i - 1];
        CGFloat previousMaxX = CGRectGetMaxX(prevLayoutAttributes.frame);
        CGFloat expectedMaxX = previousMaxX + self.actualItemSpacing + currentLayoutAttributes.frame.size.width;
        CGFloat difference = self.collectionViewContentSize.width - expectedMaxX;
        
        if(difference > 0 || fabs(difference) <= FLOAT_EPSILON || (self.scrollDirection == UICollectionViewScrollDirectionHorizontal && difference > 0)) {
            currentFrame.origin.x = previousMaxX + self.actualItemSpacing;
            currentFrame.origin.y = CGRectGetMinY(prevLayoutAttributes.frame);
        } else {
            currentFrame.origin.x = self.sectionInset.left;
            currentFrame.origin.y = CGRectGetMaxY(prevLayoutAttributes.frame) + self.minimumLineSpacing;
        }
        currentLayoutAttributes.frame = currentFrame;
    }
    return answer;
}

@end
