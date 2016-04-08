//
//  PWViewController.m
//  PWImagePickerController
//
//  Created by 陌上一梦觅琴音 on 03/28/2016.
//  Copyright (c) 2016 陌上一梦觅琴音. All rights reserved.
//

#import "PWViewController.h"
#import "PWImagePickerController.h"

@interface PWViewController ()

@end

@implementation PWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 40);
    [btn setTitle:@"选择照片" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(choseImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)choseImage:(id)sender {
    PWImagePickerController *pick = [[PWImagePickerController alloc] init];
    [self presentViewController:pick animated:YES completion:^{
        
    }];
}


@end
