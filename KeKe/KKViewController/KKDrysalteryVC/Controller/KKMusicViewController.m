//
//  KKMusicViewController.m
//  KeKe
//
//  Created by 毛蛋 on 2018/11/22.
//  Copyright © 2018年 zhb. All rights reserved.
//

#import "KKMusicViewController.h"
#import "KKMusicCollectionViewCell.h"
#import "KKCollectDetailViewController.h"
#import "KKCollectModel.h"
#import "KKWebviewViewController.h"

static NSString * headViewIdentifier=@"headView";
static NSString * identifiyId=@"cell";

@interface KKMusicViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *CollectionView;

@end

@implementation KKMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray=[NSMutableArray new];
//    _dataArray =[NSMutableArray arrayWithObjects:@"世界上最璀璨的烟火，即是你的粲然一笑",@"45度仰望星空，这些歌会让你打开回忆",@"我可以一辈子注视你，你就像我最爱的电影",@"飘渺深邃，空灵之境",@"世界上很好听的纯音乐",@"【白噪声】写论文必备",@"纯音乐的殿堂，震撼你的心灵",@"学习用【安静的音乐】",@"最丧也最甜美",@"开口即俘获人心",@"世界上最好听的钢琴曲",@"无前奏英文歌精选", nil];
//    _NameDataArray =[NSMutableArray arrayWithObjects:@"45度仰望星空",@"钢琴曲",@"爱的电影",@"空灵之境",@"纯音乐",@"【白噪声】",@"震撼你的心灵",@"【安静的音乐】",@"最甜美",@"俘获人心",@"世界",@"英文歌精选", nil];
    [self getData];
    [self showBackButtonWithImage:@"icon_back"];
    UICollectionViewFlowLayout *flayOut=[[UICollectionViewFlowLayout alloc] init];
    flayOut.scrollDirection = UICollectionViewScrollDirectionVertical;

    flayOut.headerReferenceSize=CGSizeMake(self.view.frame.size.width, 100);
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.CollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headViewIdentifier];
//    [self.CollectionView registerClass:[KKMusicCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.CollectionView registerNib:[UINib nibWithNibName:@"KKMusicCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:identifiyId];
    
    
}
-(void)getData{
    [ZZBHttpHandler loadTestInfoWithTestId:@"" successBlock:^(id resp) {
        for (NSDictionary *temp in resp[@"data"]) {
            KKCollectModel * model=[KKCollectModel initWithModel:temp];
            [_dataArray addObject:model];
        }
        [_CollectionView reloadData];
    } failedBlock:^(NSError *err) {
        
    }];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KKMusicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifiyId forIndexPath:indexPath];
    cell.backgroundColor=[UIColor whiteColor];
    cell.ImageView.backgroundColor=randomColor;
//    cell.titleLabel.text = _dataArray[indexPath.row];
//    cell.AccountLabel.text=[NSString stringWithFormat:@"%zd万",10+indexPath.row];
//    cell.NameLabel.text =_NameDataArray[indexPath.row];
    [cell setFileInfo:_dataArray[indexPath.row]];
    return cell;
    
}


-(void)backBarButtonPressed:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    //如果是头视图

    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    { UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headViewIdentifier forIndexPath:indexPath];
        //添加头视图的内容
        [self addContent];
        //头视图添加view
        [header addSubview:self.headView];
        return header;
        
    } //如果底部视图
    //
    if([kind isEqualToString:UICollectionElementKindSectionFooter]){
    }
    return nil;
}
-(void)addContent {
    UIView *header=[[UIView alloc]init];
    header.frame=CGRectMake(0, 0, self.view.frame.size.width, 100);
    header.backgroundColor = [UIColor redColor];
    self.headView=header;
    
}
#pragma mark 定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width /2,(self.view.frame.size.height/ 3));
}
#pragma mark 定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
    //（上、左、下、右）
}
#pragma mark 定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
    
}
#pragma mark 定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
    
}
#pragma mark 点击CollectionView触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   
    NSLog(@"---------------------");
//    KKCollectDetailViewController *vc=[[KKCollectDetailViewController alloc] initWithNibName:@"KKCollectDetailViewController" bundle:nil];
//    [self.navigationController pushViewController:vc animated:YES];
//    vc.hidesBottomBarWhenPushed = YES;
//    self.hidesBottomBarWhenPushed = NO;
//
    KKCollectModel * model= _dataArray[indexPath.row];
    KKWebviewViewController *vc=[[KKWebviewViewController alloc] initWithNibName:@"KKWebviewViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    vc.hidesBottomBarWhenPushed = YES;
    self.hidesBottomBarWhenPushed = NO;
    vc.pathUrl = model.url;
}
#pragma mark 设置CollectionViewCell是否可以被点击
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
    
}
@end
