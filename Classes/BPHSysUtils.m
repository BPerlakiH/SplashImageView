//
//  BPHSysUtils.m
//
//  Created by BPH on 07/11/2012.
//  Copyright (c) 2012 BPH. All rights reserved.
//

#import "BPHSysUtils.h"

@implementation BPHSysUtils

static BOOL _isActive;

+ (BOOL) isiOS: (float)minVersion {
    return (minVersion <= [[UIDevice currentDevice].systemVersion floatValue]);
}

+ (BOOL)isiOSBelow:(float)maxVersion {
    return ([[UIDevice currentDevice].systemVersion floatValue] < maxVersion);
}

+ (BOOL) isiPad {
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad);
}

+ (BOOL) isCamera {
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypeCamera];
}

+ (BOOL) isPhotoAlbumSaved {
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypeSavedPhotosAlbum];
}

+ (BOOL) isPhotoLibrary {
    return ([UIImagePickerController isSourceTypeAvailable:
             UIImagePickerControllerSourceTypePhotoLibrary]);
}

+ (BOOL)isLandscape {
    return UIDeviceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
}

+ (BOOL) isPortrait {
    return ![SysUtils isLandscape];
}

+ (BOOL) isFourInchDisplay {
    if([SysUtils isiPad]) return false;
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat longestSide = MAX(screenSize.width, screenSize.height);
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && (568.0 <= longestSide));
}

+ (NSString *) getDiplayKey {
    NSString *key = [SysUtils isFourInchDisplay] ? @"screen4-" : @"screen3-";
    key = [key stringByAppendingString: [SysUtils isLandscape] ? @"landscape" : @"portrait"];
    return key;
}

+ (BOOL)isApplicationActive {
    return _isActive;
}

+ (void) setApplicationActive:(BOOL)value {
    _isActive = value;
}

+ (float) getMaxDeviceHeight {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ([SysUtils isPortrait]) {
        return screenSize.height;
    } else {
        return screenSize.width;
    }
}

+ (float) getMaxDeviceWidth {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ([SysUtils isPortrait]) {
        return screenSize.width;
    } else {
        return screenSize.height;
    }
}

+ (float) getStatusBarHeight {
    CGSize sSize = [[UIApplication sharedApplication] statusBarFrame].size;
    return MIN(sSize.width, sSize.height);
}

@end
