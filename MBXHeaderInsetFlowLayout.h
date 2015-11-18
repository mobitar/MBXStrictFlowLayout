//
//  MBXHeaderInsetFlowLayout.h
//  ParkWhiz
//
//  Created by Mo Bitar on 11/18/15.
//  Copyright © 2015 ParkWhiz. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
When applying a section inset to a section, the section is shifted down by that inset, 
 but the header is not, and stays at the top of the section.
 This class shifts the header of that section by the respective section inset.
 */

@interface MBXHeaderInsetFlowLayout : UICollectionViewFlowLayout

@end
