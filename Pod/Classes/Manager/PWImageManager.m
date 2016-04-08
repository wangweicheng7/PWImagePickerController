//
//  PWImageManager.m
//  Pods
//
//  Created by Paul Wang on 16/4/7.
//
//

#import "PWImageManager.h"
#import "UIImage+format.h"
#import "Utils.h"

@implementation PWImageManager

+ (instancetype)manager {
    static PWImageManager *manager;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[[self class] alloc] init];
        manager.cachingImageManager = [[PHCachingImageManager alloc] init];
        manager.shouldFixOrientation = YES; // 默认修复图片显示的方向
    });
    return manager;
}

// 获取相机胶卷中相册对象
- (void)cameraRoll:(BOOL)allowVideo completion:(void (^)(PWAlbumModel *))completion {
    PWAlbumModel *model;
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    if (!allowVideo) {
        // NSPredicate 通过给定的格式解析结果
        options.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld", PHAssetMediaTypeImage];
    }
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil];
    

    for (PHAssetCollection *collection in smartAlbums) {
        if ([collection.localizedTitle isEqualToString:@"Camera Roll"] || [collection.localizedTitle isEqualToString:@"相机胶卷"]) {
            PHFetchResult *fetchResult = [PHAsset fetchAssetsInAssetCollection:collection options:options];
            model = [PWAlbumModel modelWithResult:fetchResult name:collection.localizedTitle];
            if (completion) completion(model);
            return;
        }
    }
}

- (void)imageWithAsset:(PHAsset *)asset completion:(void (^)(UIImage *, NSDictionary *, BOOL isDegraded))completion {
    if ([asset isKindOfClass:[PHAsset class]]) {
        PHAsset *aAsset = (PHFetchResult *)asset;
        
        [[PHImageManager defaultManager] requestImageForAsset:aAsset targetSize:CGSizeMake(100, 100) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            BOOL isImageLoad = (![[info objectForKey:PHImageResultIsDegradedKey] boolValue]);
            if (isImageLoad && result) {
                if (self.shouldFixOrientation) {
                    result = [result imageSmartOrientation];
                }
                if (completion) {
                    completion(result,info, isImageLoad);
                }
            }
        }];
    }
}

- (void)assetsWithFetchResult:(PHFetchResult * _Nonnull )result allowVideo:(BOOL)allowVideo completion:(void (^)(NSArray<PWAssetModel *> *))completion {
    NSMutableArray *imageArr = [NSMutableArray array];
    if ([result isKindOfClass:[PHFetchResult class]]) {
        PHFetchResult *fetchResult = (PHFetchResult *)result;
        [fetchResult enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[PHAsset class]]) {
                PHAsset *asset = (PHAsset *)obj;
                if (!allowVideo && asset.mediaType == PHAssetMediaTypeVideo) {
                    return ;
                }
                PWAssetModel *model = [PWAssetModel modelWithAsset:asset];
                
                [imageArr addObject:model];
                if (completion && idx == fetchResult.count - 1) completion(imageArr);
            }
        }];
    }
}

- (void)albums:(BOOL)allowVideo completion:(void (^)(NSArray<PWAlbumModel *> *))completion {
    NSMutableArray *albumArr = [NSMutableArray array];
    PHFetchOptions  *option = [[PHFetchOptions alloc] init];
    if (!allowVideo) {
        option.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld",PHAssetMediaTypeImage];
    }
    option.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
    
    PHAssetCollectionSubtype smartAlbumSubType = PHAssetCollectionSubtypeSmartAlbumUserLibrary | PHAssetCollectionSubtypeSmartAlbumRecentlyAdded | PHAssetCollectionSubtypeSmartAlbumVideos;
    if (iOS9Later) {
        smartAlbumSubType = PHAssetCollectionSubtypeSmartAlbumUserLibrary | PHAssetCollectionSubtypeSmartAlbumRecentlyAdded | PHAssetCollectionSubtypeSmartAlbumScreenshots | PHAssetCollectionSubtypeSmartAlbumSelfPortraits | PHAssetCollectionSubtypeSmartAlbumVideos;
    }
    PHFetchResult *smartAlbumsResult = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:smartAlbumSubType options:nil];
    for (PHAssetCollection *collection in smartAlbumsResult) {
        PHFetchResult *fetchResult = [PHAsset fetchAssetsInAssetCollection:collection options:option];
        if (fetchResult.count < 1) continue;
        if ([collection.localizedTitle containsString:@"Deleted"] || [collection.localizedTitle containsString:@"最近删除"]) {
            continue;
        }
        if ([collection.localizedTitle containsString:@"Camera Roll"] || [collection.localizedTitle isEqualToString:@"相机胶卷"]) {
            [albumArr addObject:[PWAlbumModel modelWithResult:fetchResult name:collection.localizedTitle]];
        }else{
            [albumArr addObject:[PWAlbumModel modelWithResult:fetchResult name:collection.localizedTitle]];
        }
    }
    PHFetchResult *albumsResult = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular | PHAssetCollectionSubtypeAlbumSyncedAlbum options:nil];
    for (PHAssetCollection *collection in albumsResult) {
        PHFetchResult *fetchResult = [PHAsset fetchAssetsInAssetCollection:collection options:option];
        if (fetchResult.count < 1) continue;
        if ([collection.localizedTitle isEqualToString:@"My Photo Stream"] || [collection.localizedTitle isEqualToString:@"我的照片流"]) {
            [albumArr insertObject:[PWAlbumModel modelWithResult:fetchResult name:collection.localizedTitle] atIndex:1];
        } else {
            [albumArr addObject:[PWAlbumModel modelWithResult:fetchResult name:collection.localizedTitle]];
        }
    }
    if (completion && albumArr.count > 0) completion(albumArr);
}


@end
