//
//  PWPhotoCollectionViewCell.h
//  Pods
//
//  Created by Paul Wang on 16/3/28.
//
// NS_CLASS_AVAILABLE_IOS(6_0)

#import <UIKit/UIKit.h>
#import "PWAssetModel.h"

@class PHAsset;

typedef void(^PWSelectImageBlock)(id);

static  NSString *idePhotoCollectionViewCell = @"PWPhotoCollectionViewCellIdentifier";

@interface PWPhotoCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) PWAssetModel  *model;

@property (nonatomic, copy) PWSelectImageBlock  selectImageBlock;

@property (nonatomic, strong) UIImageView   *imageView;
@property (nonatomic, strong) UIButton      *selectedButton;
@property (nonatomic, copy) NSString        *representedAssetIdentifier;

@end
