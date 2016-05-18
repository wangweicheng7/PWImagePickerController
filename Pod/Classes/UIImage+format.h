//
//  UIImage+format.h
//  Pods
//
//  Created by Paul Wang on 16/4/8.
//
//

#import <UIKit/UIKit.h>
/**
 *  @author Paul Wang, 16-04-08 13:04:16
 *
 *  @brief 图片附加的一些操作
 */
@interface UIImage (format)

/**
 *  @author Paul Wang, 16-04-08 13:04:55
 *
 *  @brief 图片显示方向
 */
- (UIImage *)imageSmartOrientation;

+ (UIImage *)imageNamedInBundle:(NSString *)name;

@end
