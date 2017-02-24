//
//  ViewController.m
//  ColelctionView
//
//  Created by walxyy on 16/8/19.
//  Copyright © 2016年 walxyy. All rights reserved.
//

#import "ViewController.h"
#import <__clang_cuda_runtime_wrapper.h>

@interface ViewController ()<UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 定义布局对象
    UICollectionViewFlowLayout *_customLayout = [[UICollectionViewFlowLayout alloc] init];
    
    //初始化UICollectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_customLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    //设置代理数据源为self
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    //添加到self.view
    [self.view addSubview:_collectionView];

    //  通过class  注册cell、sectionHeader、sectionFooter
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
//        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    
//    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId];
    
    //  通过nib文件  注册cell、sectionHeader、sectionFooter
    
    //    [_collectionView registerNib:[UINib nibWithNibName:@"CycleHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];

}


#pragma mark ---- UICollectionViewDataSource
//设置组的数量
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//设置每组的item数量
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

//设置每个Item的内容 类似uitableview 的 cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 10 * 0.1 green:arc4random() % 10 * 0.1 blue:arc4random() % 10 * 0.1 alpha:1];
        
    return cell;
}



#pragma mark ---- UICollectionViewDelegateFlowLayout
//设置item的高度 和 宽度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGSize){345 /3 ,345/3 };
}
//设置最小的 上下的 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 20.0f;
}
//设置最小的 左右的 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0f;
}


#pragma mark ---- UICollectionViewDelegate
//点击item的代理方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
