# PictureCarousel
图片轮播

使用方法

第一步

pod 'PictureCarousel', :git => 'https://github.com/rwpnyn/PictureCarousel.git'

第二步

RScrollImgView *s = [[RScrollImgView alloc] init];
s.frame = CGRectMake(0, 0, 300, 200);
[self.view addSubview:s];

NSMutableArray *dataSource = [NSMutableArray array];
for (int i=0; i<10; i++) {
RImgModel *m = [[RImgModel alloc] initWithImgUrl:@"https://ss1.bdstatic.com/6ONYsjip0QIZ8tyhnq/it/u=2812578287,2368245058&fm=58&w_h=121_75&cs=2812578287,2368245058&ow_h=121_75&src=801" defaultImg:@"" mark:@""];

[dataSource addObject:m];
}

// 添加数据

[s setImgs:dataSource];

// 点击事件

[s setClickImgsAtIndex:^(RImgModel *model) {

}];
