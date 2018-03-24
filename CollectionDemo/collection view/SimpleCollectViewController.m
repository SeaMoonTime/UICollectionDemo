//
//  ViewController.m
//  CollectionDemo
//
//  Created by SeaMoonTime on 24/03/2018.
//  Copyright © 2018 SeaMoonTime. All rights reserved.
//

#import "SimpleCollectViewController.h"

static NSString *const SCELLID = @"simpleCollectCell";

@interface SimpleCollectViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation SimpleCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    [collectView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:SCELLID];
    
    [self.view addSubview:collectView];
    
    NSLog(@"ID=%@,TYPE=%@",_ID,_type);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - collection view source

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SCELLID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
    return cell;
}

#pragma mark - collection view delegate



@end
