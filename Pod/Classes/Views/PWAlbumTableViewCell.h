//
//  PWAlbumTableViewCell.h
//  Pods
//
//  Created by Paul Wang on 16/4/8.
//
//

#import <UIKit/UIKit.h>
#import "PWAlbumModel.h"

static  NSString    *ideAlbumTableViewCell = @"PWAlbumTableViewCellIdentifier";

@interface PWAlbumTableViewCell : UITableViewCell

@property (nonatomic, strong) PWAlbumModel  *model;

@end
