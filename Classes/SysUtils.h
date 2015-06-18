//
//  SysUtils.h
//  MemoryPrintsApp
//
//  Created by Balazs Perlaki-Horvath on 07/11/2012.
//  Copyright (c) 2012 CabinetUK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SysUtils : NSObject

+ (BOOL) isiOS: (float) minVersion;
+ (BOOL) isiOSBelow: (float) maxVersion;
+ (BOOL) isPortrait;
+ (BOOL) isLandscape;
+ (BOOL) isiPad;
+ (BOOL) isCamera;
+ (BOOL) isPhotoAlbumSaved;
+ (BOOL) isPhotoLibrary;
+ (BOOL) isFourInchDisplay;
+ (NSString*) getDiplayKey;
+ (BOOL) isApplicationActive;
+ (void) setApplicationActive: (BOOL) value;
+ (float) getMaxDeviceHeight;
+ (float) getMaxDeviceWidth;
+ (float) getStatusBarHeight;

@end
