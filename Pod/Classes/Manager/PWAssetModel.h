//
//  PWAssetModel.h
//  Pods
//
//  Created by Paul Wang on 16/4/7.
//
//

#import <Photos/Photos.h>

@interface PWAssetModel : NSObject

@property (nonatomic, strong) id    asset;

@property (nonatomic, copy) NSString    *name;

@property (nonatomic, assign,getter=selected) BOOL  isSelected;
/**
 *  @author Paul Wang, 16-04-07 20:04:45
 *
 *  @brief 视频的时刻
 */
@property (nonatomic, strong) NSString  *times;

/**
 *  @author Paul Wang, 16-04-08 20:04:37
 *
 *  @brief 初始化类方法
 */
+ (instancetype)modelWithAsset:(id _Nonnull)asset;

@end
