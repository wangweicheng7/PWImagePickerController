//
//  PWAssetModel.m
//  Pods
//
//  Created by Paul Wang on 16/4/7.
//
//

#import "PWAssetModel.h"

@implementation PWAssetModel

+ (instancetype)modelWithAsset:(id)asset {
    PWAssetModel *model = [[PWAssetModel alloc] init];
    
    model.asset = asset;

    model.isSelected = NO;
    return model;
}

@end
