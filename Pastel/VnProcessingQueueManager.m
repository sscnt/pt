//
//  VnProcessingQueue.m
//  Vintage 2.0
//
//  Created by SSC on 2014/04/22.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnProcessingQueueManager.h"

@implementation VnProcessingQueueManager

static VnProcessingQueueManager* sharedVnProcessingQueue = nil;

+ (VnProcessingQueueManager*)instance {
	@synchronized(self) {
		if (sharedVnProcessingQueue == nil) {
			sharedVnProcessingQueue = [[self alloc] init];
		}
	}
	return sharedVnProcessingQueue;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (sharedVnProcessingQueue == nil) {
			sharedVnProcessingQueue = [super allocWithZone:zone];
			return sharedVnProcessingQueue;
		}
	}
	return nil;
}

- (id)copyWithZone:(NSZone*)zone {
	return self;  // シングルトン状態を保持するため何もせず self を返す
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (BOOL)canceled
{
    if (_canceled) {
        LOG(@"CANCELED!!!!");
    }
    return _canceled;
}

+ (NSString *)generateQueueId
{
    UInt64 milisec = (UInt64)floor((CFAbsoluteTimeGetCurrent() + kCFAbsoluteTimeIntervalSince1970) * 1000.0);
    uint32_t rand = arc4random_uniform(9999);
    NSString* seed = [NSString stringWithFormat:@"%llu.%d", milisec, rand];
    seed = [VnProcessingQueueManager makeQueueIdFromSeeds:seed];
    return seed;
}

+ (NSString *)makeQueueIdFromSeeds:(NSString *)input
{
    const char *cStr = [input UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

#pragma mark queue

+ (void)addQueue:(VnObjectProcessingQueue *)queue
{
    [[VnProcessingQueueManager instance] addQueue:queue];
}

- (void)addQueue:(VnObjectProcessingQueue *)queue
{
    [_queueList addObject:queue];
    if (_processing == NO) {
        [self processQueue];
    }
}

- (void)processQueue
{
    if ([_queueList count] == 0) {
        _processing = NO;
        return;
    }
    _processing = YES;
    __block VnProcessingQueueManager* _self = self;
    __block VnObjectProcessingQueue* queue;
    
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_global, ^{
        @autoreleasepool {
            queue = [_self shiftQueue];
            if (queue) {
                switch (queue.type) {
                    case VnObjectProcessingQueueTypePreset:
                        [_self processQueueTypePreset:queue];
                        break;
                    case VnObjectProcessingQueueTypePreview:
                        [_self processQueueTypePreview:queue];
                        break;
                    default:
                        break;
                }
            }
        }
        dispatch_async(q_main, ^{
            [_self didFinishProcessingQueue:queue];
        });
    });
}

- (void)didFinishProcessingQueue:(VnObjectProcessingQueue *)queue
{
    [self.delegate queueDidFinished:queue];
    _processing = NO;
    if ([_queueList count] != 0) {
        if (self.canceled) {
            return;
        }
        [self processQueue];
    }
}

- (void)processQueueTypePreview:(VnObjectProcessingQueue *)queue
{
    VnEditorSliderManager* sm = [VnEditorSliderManager instance];
    [self.delegate dispatchPreviewprogress:0.1f];
    if ([VnCurrentImage processedColorImageExists] == NO) {
        @autoreleasepool {
            if (self.canceled) {
                return;
            }
            UIImage* image = [VnProcessor applyEffect:[VnEditorViewManager currentSelectedColorLayerEffectId] ToImage:[VnCurrentImage originalPreviewImage]];
            [VnCurrentImage saveTmpImage:image];
        }
        if (sm.colorOpacity != 1.0f) {
            @autoreleasepool {
                if (self.canceled) {
                    return;
                }
                UIImage* image = [VnProcessor mergeBaseImage:[VnCurrentImage originalPreviewImage] overlayImage:[VnCurrentImage tmpImage] opacity:sm.colorOpacity blendingMode:VnBlendingModeNormal];
                [VnCurrentImage saveProcessedColorPreviewImage:image];
            }
        }else{
            [VnCurrentImage saveProcessedColorPreviewImage:[VnCurrentImage tmpImage]];
        }
    }
    if ([VnCurrentImage processedEffectImageExists] == NO) {
        [self.delegate dispatchPreviewprogress:0.3f];
        @autoreleasepool {
            if (self.canceled) {
                return;
            }
            UIImage* image = [VnProcessor applyEffect:[VnEditorViewManager currentSelectedEffectLayerEffectId] ToImage:[VnCurrentImage processedColorPreviewImage]];
            [VnCurrentImage saveTmpImage:image];
        }
        if (sm.effectOpacity != 1.0f) {
            @autoreleasepool {
                if (self.canceled) {
                    return;
                }
                UIImage* image = [VnProcessor mergeBaseImage:[VnCurrentImage processedColorPreviewImage] overlayImage:[VnCurrentImage tmpImage] opacity:sm.effectOpacity blendingMode:VnBlendingModeNormal];
                [VnCurrentImage saveProcessedEffectPreviewImage:image];
            }
        }else{
            [VnCurrentImage saveProcessedEffectPreviewImage:[VnCurrentImage tmpImage]];
        }
    }
    if ([VnCurrentImage processedOverlayImageExists] == NO) {
        [self.delegate dispatchPreviewprogress:0.6f];
        @autoreleasepool {
            if (self.canceled) {
                return;
            }
            UIImage* image = [VnProcessor applyEffect:[VnEditorViewManager currentSelectedOverlayLayerEffectId] ToImage:[VnCurrentImage processedEffectPreviewImage]];
            [VnCurrentImage saveTmpImage:image];
        }
        if (sm.overlayOpacity != 1.0f) {
            @autoreleasepool {
                if (self.canceled) {
                    return;
                }
                UIImage* image = [VnProcessor mergeBaseImage:[VnCurrentImage processedEffectPreviewImage] overlayImage:[VnCurrentImage tmpImage] opacity:sm.overlayOpacity blendingMode:VnBlendingModeNormal];
                [VnCurrentImage saveProcessedOverlayPreviewImage:image];
            }
        }else{
            [VnCurrentImage saveProcessedOverlayPreviewImage:[VnCurrentImage tmpImage]];
        }
    }
    if (self.canceled) {
        return;
    }
    [self.delegate dispatchPreviewprogress:0.9f];
    queue.image = [VnCurrentImage processedOverlayPreviewImage];
    
    LOG(@"Color: %f", sm.colorOpacity);
    LOG(@"Effect: %f", sm.effectOpacity);
    LOG(@"Overlay: %f", sm.overlayOpacity);
    
    @autoreleasepool {
        if (self.canceled) {
            return;
        }
        VnFilterLensBlur* filter = [[VnFilterLensBlur alloc] init];
        filter.blurRadiusInPixels = 10.0f;
        UIImage* image = [VnProcessor mergeBaseImage:queue.image overlayFilter:filter opacity:1.0f blendingMode:VnBlendingModeNormal];
        [VnCurrentImage saveBlurredPreviewImage:image];
        image = nil;
    }
    [self.delegate dispatchPreviewprogress:1.0f];
}

- (void)processQueueTypePreset:(VnObjectProcessingQueue *)queue
{
    UIImage* image = [VnCurrentImage presetBaseImage];
    if (queue.effectId != VnEffectIdNone) {
        if (self.canceled) {
            return;
        }
        image = [VnProcessor applyEffect:queue.effectId ToImage:queue.image];
        float opacity = [VnEffect defalutOpacityByEffectId:queue.effectId];
        if([VnCurrentImage faceDetected]){
            opacity = [VnEffect faceOpacityByEffectId:queue.effectId];
        }
        if (opacity < 1.0f) {
            if (self.canceled) {
                return;
            }
            image = [VnProcessor mergeBaseImage:[VnCurrentImage presetBaseImage] overlayImage:image opacity:opacity blendingMode:VnBlendingModeNormal];
        }
    }
    if (self.canceled) {
        return;
    }
    if (image.imageOrientation != UIImageOrientationUp) {
        image = [UIImage imageWithCGImage:image.CGImage scale:image.scale orientation:UIImageOrientationUp];
    }
    queue.image = image;
}


#pragma mark shift

+ (VnObjectProcessingQueue *)shiftQueue
{
    return [[VnProcessingQueueManager instance] shiftQueue];
}

- (VnObjectProcessingQueue *)shiftQueue
{
    if ([_queueList count] == 0) {
        return nil;
    }
    VnObjectProcessingQueue* queue = [_queueList objectAtIndex:0];
    [_queueList removeObjectAtIndex:0];
    if (queue.type == VnObjectProcessingQueueTypePreset) {
        queue.image = [VnCurrentImage presetBaseImage];
    }
    return queue;
}

+ (VnObjectProcessingQueue *)shiftEffectQueue
{
    return [[VnProcessingQueueManager instance] shiftEffectQueue];
}

- (VnObjectProcessingQueue *)shiftEffectQueue
{
    if ([_effectsPresetQueueList count] == 0) {
        return nil;
    }
    VnObjectProcessingQueue* queue = [_effectsPresetQueueList objectAtIndex:0];
    [_effectsPresetQueueList removeObjectAtIndex:0];
    return queue;
}

#pragma mark number

+ (int)numberOfEffectsInPreset
{
    return (int)[[self instance].effectsPresetQueueList count];
}

+ (void)cancelAllQueue
{
    [self instance].canceled = YES;
}

#pragma mark init

- (void)commonInit
{
    _processing = NO;
    _canceled = NO;
    _queueList = [NSMutableArray array];
    _effectsPresetQueueList = [NSMutableArray array];
    VnObjectProcessingQueue* queue;
    VnObjectEffect* effect;
    
    for (int i = 0; i < [VnDataLayers effectsCount]; i++) {
        effect = [VnDataLayers effectAtIndex:i];
        if (effect) {
            queue = [[VnObjectProcessingQueue alloc] init];
            queue.effectId = effect.effectId;
            queue.type = VnObjectProcessingQueueTypePreset;
            [_effectsPresetQueueList addObject:queue];
        }
    }
    
}

- (void)reset
{
    [_queueList removeAllObjects];
    [_effectsPresetQueueList removeAllObjects];
}

@end
