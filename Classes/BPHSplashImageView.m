//
//  BPHSplashImageView.m
//
//  Created by BPH on 18/06/2015.
//  Copyright (c) 2015 BPH. All rights reserved.
//

#import "BPHSplashImageView.h"
#import "SysUtils.h"
#import "UIImage+BPHHelper.h"

@implementation BPHSplashImageView

- (void) start {
    [self _setImage];
}

- (void) dealloc {
    self.image = nil;
}

- (void) onRotate {
    [self _setImage];
}

- (void) _setImage {
    NSString *name = [self _getSplashName];
    if([SysUtils isLandscape] && ![SysUtils isiPad]) {
        //there's no splash for phones in landscape mode!
        //so rotate the image:
        if([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft) {
            self.image = [[UIImage imageNamed:name] imageRotatedByDegrees:-90.0];
        } else {
            //it's UIDeviceOrientationLandscapeRight
            self.image = [[UIImage imageNamed:name] imageRotatedByDegrees:90.0];
        }
    } else {
        self.image = [UIImage imageNamed:name];
    }
    self.frame = [self _getFrame];
    
}


- (NSString *) _getSplashName {
    UIInterfaceOrientation orientation =[[UIApplication sharedApplication] statusBarOrientation];
    CGSize viewSize = [self _getScreenSize];
    NSString* viewOrientation = @"Portrait";
    if (UIDeviceOrientationIsLandscape(orientation) && [SysUtils isiPad]) {
        viewSize = CGSizeMake(viewSize.height, viewSize.width);
        viewOrientation = @"Landscape";
    }
    if(![SysUtils isiPad]) {
        //enforce portrait image file name for phones, as they don't have a landscape image:
        viewSize = CGSizeMake(MIN(viewSize.width, viewSize.height), MAX(viewSize.width, viewSize.height));
    }
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
            return dict[@"UILaunchImageName"];
    }
    return nil;
}

- (CGRect) _getFrame {
    CGSize screenSize = [self _getScreenSize];
    return CGRectMake(0, 0, screenSize.width, screenSize.height);
}

- (CGSize) _getScreenSize {
    if([SysUtils isiOS:7.0] && ![SysUtils isiOS:8.0] && [SysUtils isLandscape]) {
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        return CGSizeMake(screenSize.height, screenSize.width);
    } else {
        return [UIScreen mainScreen].bounds.size;
    }
}

@end
