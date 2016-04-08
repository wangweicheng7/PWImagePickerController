//
//  PWImagePreviewViewController.m
//  Pods
//
//  Created by Paul Wang on 16/4/8.
//
//

#import "PWImagePreviewViewController.h"

@interface PWImagePreviewViewController ()

@property (nonatomic, strong) UIImageView   *imageView;
@property (nonatomic, strong) UIScrollView  *mainScrollView;


@end

@implementation PWImagePreviewViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainScrollView];
}

- (UIScrollView *)mainScrollView {
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _mainScrollView.contentSize = self.view.bounds.size;
    }
    return _mainScrollView;
}

@end
