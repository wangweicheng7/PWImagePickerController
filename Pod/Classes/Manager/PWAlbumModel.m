//
//  PWAlbumModel.m
//  Pods
//
//  Created by Paul Wang on 16/4/8.
//
//
//

#import "PWAlbumModel.h"
#import <Photos/PHFetchResult.h>

@implementation PWAlbumModel

+ (instancetype)modelWithResult:(id)result name:(NSString *)name{
    PWAlbumModel *model = [[PWAlbumModel alloc] init];
    model.result = result;
    model.name = name;
    if ([result isKindOfClass:[PHFetchResult class]]) {
        PHFetchResult *fetchResult = (PHFetchResult *)result;
        model.count = [NSString stringWithFormat:@"%@",@(fetchResult.count)];
    }
//    } else if ([result isKindOfClass:[ALAssetsGroup class]]) {
//        ALAssetsGroup *gruop = (ALAssetsGroup *)result;
//        model.count = [gruop numberOfAssets];
//    }
    return model;
}


@end
