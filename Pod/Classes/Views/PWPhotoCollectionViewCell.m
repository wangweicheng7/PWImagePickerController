//
//  PWPhotoCollectionViewCell.m
//  Pods
//
//  Created by Paul Wang on 16/3/28.
//
//

#import "PWPhotoCollectionViewCell.h"
#import "PWImageManager.h"
#import "Utils.h"

@interface PWPhotoCollectionViewCell () {}

/**
 *  @author Paul Wang, 16-04-08 20:04:09
 *
 *  @brief 选中的半透明视图
 */
@property (nonatomic, strong) UIView    *selectedBlurView;

@end

@implementation PWPhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.selectedButton];
    }
    return self;
}

- (void)setModel:(PWAssetModel *)model {
    _model = model;
    __weak typeof(self) weakSelf = self;
    [[PWImageManager manager] imageWithAsset:model.asset completion:^(UIImage *image, NSDictionary *info, BOOL isDegraded) {
        weakSelf.imageView.image = image;
    }];
    if (model.selected) {
        [self.contentView insertSubview:self.selectedBlurView belowSubview:self.selectedButton];
    }
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.imageView.image = nil;
    [self.selectedButton setImage:nil forState:UIControlStateNormal];
    [self.selectedBlurView removeFromSuperview];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
    self.selectedButton.frame = CGRectMake(self.frame.size.width - 30, 3, 27, 27);
//    ALAsset *asset;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UIButton *)selectedButton {
    if (!_selectedButton) {
        _selectedButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_selectedButton setBackgroundImage:[UIImage imageNamed:PWResourceName(@"icon_5")] forState:UIControlStateNormal];
        [_selectedButton setBackgroundImage:[UIImage imageNamed:PWResourceName(@"icon_9")] forState:UIControlStateSelected];
        [_selectedButton addTarget:self action:@selector(selectImage:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectedButton;
}

- (UIView *)selectedBlurView {
    if (!_selectedBlurView) {
        _selectedBlurView = [[UIView alloc] initWithFrame:self.bounds];
        _selectedBlurView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    }
    return _selectedBlurView;
}

- (void)selectImage:(id)sender {
    self.model.isSelected = !self.model.selected;
    if (self.model.selected) {
        [self.contentView insertSubview:self.selectedBlurView belowSubview:self.selectedButton];
    }else{
        [self.selectedBlurView removeFromSuperview];
    }
    if (self.selectImageBlock) {
        self.selectImageBlock(sender);
    }
}

@end
