//
//  PWAlbumViewController.m
//  Pods
//
//  Created by Paul Wang on 16/4/7.
//
//

#import "PWAlbumViewController.h"
#import "PWAlbumTableViewCell.h"
#import "PWPhotoPickerController.h"
#import "PWImageManager.h"
#import "Utils.h"

@interface PWAlbumViewController () <UITableViewDelegate,UITableViewDataSource> {
    NSArray *_albumArray;
}

@property (nonatomic, strong) UITableView   *tableView;

@end

@implementation PWAlbumViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    self.title = @"相册";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel:)];
//    self.navigationItem.rightBarButtonItem.tintColor = UIColorFromRGB(PWPrimaryColor);
}

- (void)cancel:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)loadData {
    __weak typeof(self) weakSelf = self;
    [[PWImageManager manager] albums:YES completion:^(NSArray<PWAssetModel *> *albums) {
        _albumArray = [NSArray arrayWithArray:albums];
        [weakSelf.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _albumArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PWAlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ideAlbumTableViewCell forIndexPath:indexPath];
    cell.model = [_albumArray objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 78.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PWPhotoPickerController *photoPickerVC = [[PWPhotoPickerController alloc] init];
    photoPickerVC.albumModel = [_albumArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:photoPickerVC animated:YES];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[PWAlbumTableViewCell class] forCellReuseIdentifier:ideAlbumTableViewCell];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

@end
