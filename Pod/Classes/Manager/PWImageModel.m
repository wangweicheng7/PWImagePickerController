//
//  PWImageModel.m
//  Pods
//
//  Created by Paul Wang on 16/4/7.
//
//

#import "PWImageModel.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>

@implementation PWImageModel

+ (instancetype)modelWithResult:(id)result name:(NSString *)name {
    PWImageModel *model = [[PWImageModel alloc]init];
    model.name = name;
    model.result = result;
    if ([result isKindOfClass:[PHFetchResult class]]) {
        PHFetchResult *fecthResult = (PHFetchResult *)result;
        model.count = fecthResult.count;
    }else if ([result isKindOfClass:[ALAssetsGroup class]]) {
        ALAssetsGroup *group = (ALAssetsGroup *)result;
        model.count = group.numberOfAssets;
    }
    return model;
}

@end
