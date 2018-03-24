//
//  Simple2CollectViewController.m
//  CollectionDemo
//
//  Created by SeaMoonTime on 24/03/2018.
//  Copyright © 2018 SeaMoonTime. All rights reserved.
//

#import "Simple2CollectViewController.h"

static NSString *const S1CELLID = @"simple1CollectCell";

@interface Simple2CollectViewController ()  <UICollectionViewDataSource, UICollectionViewDelegate>


@end

@implementation Simple2CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //create layout and configure its direction and itemsize
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(100, 100);
    
    //create collection view
    UICollectionView *collectView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    //delegate configure
    collectView.dataSource = self;
    collectView.delegate = self;
    collectView.backgroundColor = [UIColor whiteColor];//configure its background color
    
    //register item useing xib or class
    //while registering is not requierd for storyboard
    [collectView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:S1CELLID];
    
    [self.view addSubview:collectView];
    
    NSLog(@"ID=%@,TYPE=%@",_ID,_type);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - collection view source

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:S1CELLID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
    return cell;
}

#pragma mark - collection view delegate
//设置每个item的大小，双数的为50*50 单数的为100*100
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%2==0) {
        return CGSizeMake(50, 50);
    }else{
        return CGSizeMake(100, 100);
    }
}

@end
