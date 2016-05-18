//
//  PWPhotoBottomView.m
//  Pods
//
//  Created by Paul Wang on 16/4/8.
//
//

#import "PWPhotoBottomView.h"
#import "UIImage+format.h"
#import "Utils.h"

@interface PWPhotoBottomView () {
    UILabel *_separatorLineLabel;
}

@property (nonatomic, strong) UIButton  *sureButton;
@property (nonatomic, strong) UIButton  *previewButton;
@property (nonatomic, strong) UIButton  *originalButton;

@end

@implementation PWPhotoBottomView

- (instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, ScreenHeight  - 49.0f, ScreenWidth, 49.0f)];
    if (self) {
        [self loadView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, ScreenHeight - 64.0f - 49.0f, ScreenWidth, 49.0f)];
    if (self) {
        [self loadView];
    }
    return self;
}

- (void)loadView {
    
    [self addSubview:self.previewButton];
    [self addSubview:self.sureButton];
    [self addSubview:self.originalButton];
    _separatorLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.5f)];
//    _separatorLineLabel.backgroundColor = UIColorFromRGB(PWSeparatorLineColor);
    [self addSubview:_separatorLineLabel];
    
}

#pragma mark - getters
- (UIButton *)sureButton {
    if (!_sureButton) {
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureButton.frame = CGRectMake(self.frame.size.width - 44 - 12, 3, 44, 44);
        _sureButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_sureButton addTarget:self action:@selector(okButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [_sureButton setTitle:@"确定" forState:UIControlStateDisabled];
//        [_sureButton setTitleColor:UIColorFromRGB(PWPrimaryColor) forState:UIControlStateNormal];
//        [_sureButton setTitleColor:UIColorFromRGB(PWDisableColor) forState:UIControlStateDisabled];
    }
    return _sureButton;
}

- (UIButton *)previewButton {
    if (!_previewButton) {
        _previewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _previewButton.frame = CGRectMake(10, 3, 44, 44);
        [_previewButton addTarget:self action:@selector(previewButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _previewButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_previewButton setTitle:@"预览" forState:UIControlStateNormal];
        [_previewButton setTitle:@"预览" forState:UIControlStateDisabled];
        [_previewButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_previewButton setImage:[UIImage imageNamed:@"resource.bundle/icon_1"] forState:UIControlStateNormal];
        _previewButton.enabled = NO;
    }
    return _previewButton;
}

- (UIButton *)originalButton {
    if (!_originalButton) {
        _originalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _originalButton.frame = CGRectMake(64, 3, 130, 44);
        
        [_originalButton addTarget:self action:@selector(originalButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _originalButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_originalButton setTitle:@"原图" forState:UIControlStateNormal];
        [_originalButton setTitle:@"原图" forState:UIControlStateSelected];
//        [_originalButton setTitleColor:UIColorFromRGB(PWDisableColor) forState:UIControlStateNormal];
        [_originalButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [_originalButton setImage:[UIImage imageNamed:@"icon_1"] forState:UIControlStateNormal];
        [_originalButton setImage:[UIImage imageNamed:@"icon_2"] forState:UIControlStateSelected];
//        _originalButton.imageView.tintColor = UIColorFromRGB(PWPrimaryColor);
        //    _originalButton.enabled = _selectedPhotoArr.count > 0;
        _originalButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
    }
    return _originalButton;
}

#pragma mark - actions
- (void)originalButtonClicked:(id)sender {
    
}

- (void)previewButtonClicked:(id)sender {
    
}


@end
