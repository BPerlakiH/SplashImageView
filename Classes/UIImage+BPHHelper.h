//
//  UIImage+BPHHelper.h
//
//  Created by BPH on 19/05/2013.
//  Copyright (c) 2013 BPH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BPHHelper)

- (BOOL) isHF;
- (BOOL) isVF;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

@end
