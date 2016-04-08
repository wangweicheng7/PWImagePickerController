//
//  PWPhotoPickerController.m
//  Pods
//
//  Created by Paul Wang on 16/4/7.
//
//

#import "PWPhotoPickerController.h"
#import "PWAssetModel.h"
#import "PWImageManager.h"
#import "PWPhotoCollectionViewCell.h"
#import "PWPhotoBottomView.h"
#import "Utils.h"

@interface PWPhotoPickerController () <UICollectionViewDelegate,UICollectionViewDataSource> {
    NSArray *_photoArr;
}

@property (nonatomic, strong) UICollectionView  *collectionView;
@property (nonatomic, strong) PWPhotoBottomView *bottomView;

@end

@implementation PWPhotoPickerController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        _photoArr = [[NSArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = self.albumModel.name;
    self.navigationItem.hidesBackButton = NO;
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.bottomView];
    
    [self loadImageFromAlbum:self.albumModel];
}
#pragma mark - event
/**
 *  @author Paul Wang, 16-04-08 14:04:53
 *
 *  @brief 加载相册中的图片
 *
 *  @param model 相册模型
 */
- (void)loadImageFromAlbum:(PWAlbumModel *)model {
    
    __weak typeof(self) weakSelf = self;
    [[PWImageManager manager] assetsWithFetchResult:self.albumModel.result allowVideo:YES completion:^(NSArray<PWAssetModel *> *array) {
        _photoArr = array;
        [weakSelf.collectionView reloadData];
    }];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _photoArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PWPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:idePhotoCollectionViewCell forIndexPath:indexPath];
    cell.model = [_photoArr objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - getters
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake((ScreenWidth - 25)/4.0f, (ScreenWidth - 25)/4.0f);
        layout.minimumLineSpacing = 5.0f;
        layout.minimumInteritemSpacing = 5.0f;
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5 + 49, 5);
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.alwaysBounceHorizontal = NO;
        [_collectionView registerClass:[PWPhotoCollectionViewCell class] forCellWithReuseIdentifier:idePhotoCollectionViewCell];
        
    }
    return _collectionView;
}

- (PWPhotoBottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[PWPhotoBottomView alloc] init];
    }
    return _bottomView;
}


@end
