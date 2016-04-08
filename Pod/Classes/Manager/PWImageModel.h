//
//  PWImageModel.h
//  Pods
//
//  Created by Paul Wang on 16/4/7.
//
//

#import <Foundation/Foundation.h>

/**
 *  @author Paul Wang, 16-04-08 14:04:10
 *
 *  @brief 图片模型，包含 PHAsset 或 ALAsset 图片集
 */
@interface PWImageModel : NSObject

/**
 *  @author Paul Wang, 16-04-07 17:04:59
 *
 *  @brief 照片数量
 */
@property (nonatomic, strong) NSString  *name;
/**
 *  @author Paul Wang, 16-04-07 17:04:49
 *
 *  @brief 相册包含的照片数量
 */
@property (nonatomic, assign) NSInteger count;
/**
 *  @author Paul Wang, 16-04-07 17:04:34
 *
 *  @brief <PHAsset> or <ALAsset>
 */
@property (nonatomic, strong) id        result;

/**
 *  @author Paul Wang, 16-04-07 17:04:36
 *
 *  @brief 初始化类方法
 *
 *  @param result 传入result
 *  @param name   name
 *
 *  @return 实例
 */
+ (instancetype)modelWithResult:(id)result name:(NSString *)name;

@end
