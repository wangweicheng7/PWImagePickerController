//
//  PWImageManager.h
//  Pods
//
//  Created by Paul Wang on 16/4/7.
//
//

#import <Foundation/Foundation.h>
#import "PWImageModel.h"
#import "PWAssetModel.h"
#import "PWAlbumModel.h"

@interface PWImageManager : NSObject

@property (nonatomic, strong) PHCachingImageManager *cachingImageManager;

@property (nonatomic, assign) BOOL  shouldFixOrientation;

+ (instancetype)manager;
/**
 *  @author Paul Wang, 16-04-08 10:04:53
 *
 *  @brief 获取系统相册集
 *
 *  @param allowVideo 允许视频
 *  @param completion 回调
 */
- (void)albums:(BOOL)allowVideo completion:(void (^)(NSArray<PWAlbumModel *> *))completion;
/**
 *  @author Paul Wang, 16-04-07 18:04:41
 *
 *  @brief 默认获取相机胶卷中的照片
 *
 *  @param allowVideo 是否允许视频
 *  @param completion 回调
 */
- (void)cameraRoll:(BOOL)allowVideo completion:(void (^)(PWImageModel *))completion;
/**
 *  @author Paul Wang, 16-04-07 20:04:41
 *
 *  @brief 从 PHFetchResult 对象中取出 PHAsset 对象
 *
 *  @param allowVideo 允许视频
 *  @param completion 回调
 */
- (void)assetsWithFetchResult:(PHFetchResult * _Nonnull )result allowVideo:(BOOL)allowVideo completion:(void (^)(NSArray<PWAssetModel *> *))completion;
/**
 *  @author Paul Wang, 16-04-07 20:04:29
 *
 *  @brief 从 PHAsset 中获取图片
 */
- (void)imageWithAsset:(PHAsset *)asset completion:(void (^)(UIImage *, NSDictionary *, BOOL isDegraded))completion;


@end
