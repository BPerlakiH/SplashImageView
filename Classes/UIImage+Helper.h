//
//  UIImage+Helper.h
//  Postcards
//
//  Created by Balazs on 19/05/2013.
//  Copyright (c) 2013 PictureCabinet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Helper)

- (BOOL) isHF;
- (BOOL) isVF;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

@end
