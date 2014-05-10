//
//  VnDataEffects.h
//  Vintage 2.0
//
//  Created by SSC on 2014/04/23.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VnDataLayers : NSObject

@property (nonatomic, strong) NSMutableArray* colorList;
@property (nonatomic, strong) NSMutableArray* effectsList;
@property (nonatomic, strong) NSMutableArray* overlaysList;

+ (VnDataLayers*)instance;
+ (int)effectsCount;
+ (VnObjectEffect*)effectAtIndex:(int)index;
+ (int)colorCount;
+ (VnObjectEffect*)colorAtIndex:(int)index;
+ (int)overlaysCount;
+ (VnObjectEffect*)overlayAtIndex:(int)index;

+ (VnObjectEffect*)effectRandom;
+ (VnObjectEffect*)colorRandom;
+ (VnObjectEffect*)overlayRandom;

- (void)initColorList;
- (void)initEffectsList;
- (void)initOverlayList;

@end
