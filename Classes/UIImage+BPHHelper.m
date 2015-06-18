//
//  UIImage+BPHHelper.m
//
//  Created by BPH on 19/05/2013.
//  Copyright (c) 2013 BPH. All rights reserved.
//

#ifndef DEGREES_TO_RADIANS
    #define DEGREES_TO_RADIANS(x) (M_PI * x / 180.0)
#endif
#import "UIImage+BPHHelper.h"

@implementation UIImage (BPHHelper)

- (BOOL)isHF {
    if(self.size.height == 0) return false;
    float ratio = self.size.width / self.size.height;
    if(1.2f < ratio) {
        return true;
    }
    return false;
}

- (BOOL)isVF {
    return ![self isHF];
}

- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees
{
    // calculate the size of the rotated view's containing box for our drawing space
    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.size.width, self.size.height)];
    CGAffineTransform t = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(degrees));
    rotatedViewBox.transform = t;
    CGSize rotatedSize = rotatedViewBox.frame.size;
    
    // Create the bitmap context
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    
    // Move the origin to the middle of the image so we will rotate and scale around the center.
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    
    //   // Rotate the image context
    CGContextRotateCTM(bitmap, DEGREES_TO_RADIANS(degrees));
    
    // Now, draw the rotated/scaled image into the context
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}

@end
