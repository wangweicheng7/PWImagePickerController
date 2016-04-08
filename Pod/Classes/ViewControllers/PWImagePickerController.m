//
//  PWImagePickerController.m
//  Pods
//
//  Created by Paul Wang on 16/4/7.
//
//

#import "PWImagePickerController.h"
#import "PWAlbumViewController.h"
#import "PWPhotoPickerController.h"
#import "PWImageManager.h"

@interface PWImagePickerController ()

@end

@implementation PWImagePickerController

- (instancetype)init {
    PWAlbumViewController *albumsVC = [[PWAlbumViewController alloc] init];
    if (self = [super initWithRootViewController:albumsVC]) {
        [self pushPhotoPicker];
        
    }
    return self;
}

- (void)pushPhotoPicker {
    PWPhotoPickerController *photoPickerVC = [[PWPhotoPickerController alloc ] init];
    [[PWImageManager manager] cameraRoll:YES completion:^(PWImageModel *model) {
        photoPickerVC.albumModel = model;
        [self pushViewController:photoPickerVC animated:YES];
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
