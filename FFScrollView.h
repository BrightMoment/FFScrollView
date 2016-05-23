//
//  FFScrollView.h
//  ScrollViewDemo
//
//  Created by Juncy_Fan on 13-11-11.
//  Copyright (c) 2013年 aifeng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    FFScrollViewSelecttionTypeTap = 100,  //默认的为可点击模式
    FFScrollViewSelecttionTypeNone   //不可点击的
}FFScrollViewSelecttionType;

@protocol FFScrollViewDelegate <NSObject>

@optional
- (void)scrollViewDidClickedAtPage:(NSInteger)pageNumber;

@end

@interface FFScrollView : UIView <UIScrollViewDelegate>
{
    NSTimer *timer;
    NSArray *sourceArr;
    
    NSString * tagStr;
    
    UILabel * lable1;
    UILabel * lable2;
    UILabel * lable3;
}
@property(strong,nonatomic) UIScrollView *scrollView;
@property(strong,nonatomic) UIPageControl *pageControl;
@property(assign,nonatomic) FFScrollViewSelecttionType selectionType;
@property(assign,nonatomic) id <FFScrollViewDelegate> pageViewDelegate;
- (id)initPageViewWithFrame:(CGRect)frame views:(NSArray *)views tag:(NSString *)tag;
@end
