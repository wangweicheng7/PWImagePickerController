//
//  PWAlbumTableViewCell.m
//  Pods
//
//  Created by Paul Wang on 16/4/8.
//
//

#import "PWAlbumTableViewCell.h"
#import "PWAlbumModel.h"
#import "PWImageManager.h"

@interface PWAlbumTableViewCell ()

@property (nonatomic, strong) UIImageView   *imageView;
@property (nonatomic, strong) UILabel       *albumNameLabel;

@end

@implementation PWAlbumTableViewCell

@synthesize imageView = _imageView;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.albumNameLabel];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void)setModel:(PWAlbumModel *)model {
    _model = model;
    __weak typeof(self) weakSelf = self;

    [[PWImageManager manager] imageWithAsset:[model.result lastObject] completion:^(UIImage *image, NSDictionary *info, BOOL isDegraded) {
        weakSelf.imageView.image = image;
        
    }];
    NSMutableAttributedString   *attrString = [[NSMutableAttributedString alloc] initWithString:model.name attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16.0f]}];
    [attrString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n(%@)", model.count] attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}]];
    
    self.albumNameLabel.attributedText = attrString;
}

#pragma mark - getters
- (UILabel *)albumNameLabel {
    if (!_albumNameLabel) {
        _albumNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 5, 200, 68)];
        _albumNameLabel.numberOfLines = 0;
    }
    return _albumNameLabel;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 68, 68)];
    }
    return _imageView;
}

@end
