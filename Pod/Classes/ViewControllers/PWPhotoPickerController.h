//
//  PWPhotoPickerController.h
//  Pods
//
//  Created by Paul Wang on 16/4/7.
//
//

#import <UIKit/UIKit.h>
#import "PWImageModel.h"
#import "PWAlbumModel.h"

@interface PWPhotoPickerController : UIViewController

@property (nonatomic, strong) PWAlbumModel  *albumModel;

@property (nonatomic, assign) BOOL shouldFixOrientation;

@end
