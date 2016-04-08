//
//  PWAlbumModel.h
//  Pods
//
//  Created by Paul Wang on 16/4/8.
//
//

#import <Foundation/Foundation.h>

/**
 *  @author Paul Wang, 16-04-08 14:04:45
 *
 *  @brief 相册模型，有 PHFetchResult<PHAsset> 或 ALAssetsGroup<ALAsset> 结果集
 */
@interface PWAlbumModel : NSObject

/**
 *  @author Paul Wang, 16-04-08 11:04:17
 *
 *  @brief <PHFetchResult>
 */
@property (nonatomic, strong) id    result;

@property (nonatomic, copy) NSString    *name;

@property (nonatomic, copy) NSString    *count;

/**
 *  @author Paul Wang, 16-04-08 10:04:24
 *
 *  @brief 初始化类方法
 */
+ (instancetype)modelWithResult:(id)result name:(NSString *)name;

@end
