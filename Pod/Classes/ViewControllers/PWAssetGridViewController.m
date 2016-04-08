//
//  PWAssetGridViewController.m
//  Pods
//
//  Created by Paul Wang on 16/3/28.
//
//

#import "PWAssetGridViewController.h"
#import "PWPhotoCollectionViewCell.h"

@interface PWAssetGridViewController () {

}

@end

@implementation PWAssetGridViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)showImagePickerOnController:(UIViewController *)viewController {
    NSString *tipTextWhenNoPhotosAuthorization; //
    ALAuthorizationStatus authorizationStatus = [ALAssetsLibrary authorizationStatus];
    // 获取当前应用对照片的访问授权状态
    // 如果没有获取访问授权，或者访问授权状态已经被明确禁止，则显示提示语，引导用户开启授权
    if (authorizationStatus == ALAuthorizationStatusRestricted || authorizationStatus == ALAuthorizationStatusDenied) {
        NSDictionary *mainInfoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *appName = [mainInfoDictionary objectForKey:@"CFBundleDisplayName"];
        tipTextWhenNoPhotosAuthorization = [NSString stringWithFormat:@"请在设备的\"设置-隐私-照片\"选项中，允许%@访问你的手机相册", appName];
        // 展示提示语
    }
    NSMutableArray *albumArr = [NSMutableArray array];
    ALAssetsLibrary *assetsLib = [[ALAssetsLibrary alloc] init];
    [assetsLib enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            [group setAssetsFilter:[ALAssetsFilter allPhotos]];
            if (group.numberOfAssets > 0) {
                [albumArr addObject:group];
            }
            else{
                if (albumArr.count > 0) {
                    
                }else{
                    NSLog(@"没有相册资源");
                }
            }
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"asset group not found!");
    }];
    NSMutableArray *imageAssetArray = [[NSMutableArray alloc] init];
    ALAssetsGroup *assetsGtoup = [[ALAssetsGroup alloc] init];
    [assetsGtoup enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if (result) {
            [imageAssetArray addObject:result];
        }else{
            // result is nil, 遍历完毕
        }
    }];
    ALAsset *imageAsset = [[ALAsset alloc] init];
    ALAssetRepresentation *representation = [imageAsset defaultRepresentation];
    UIImage *contentImage = [UIImage imageWithCGImage:[representation fullScreenImage]];
}

- (void)resource {
    
}

@end
