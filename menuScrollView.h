//
//  menuScrollView.h
//  deyingSoft
//
//  Created by 李世飞 on 16/1/29.
//  Copyright © 2016年 李世飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuScrollViewDelegate <NSObject>

- (void)scrollViewDidClickedAtPage:(NSInteger)pageNumber current:(NSInteger)curent;

@end

@interface menuScrollView : UIView<UIScrollViewDelegate>
{
    NSMutableArray * menuArray;
    
    UIScrollView * scr;
    
    NSInteger  widthNum;
    NSInteger Num;
    
    
    NSInteger currenPage;

}


@property(assign,nonatomic) id <MenuScrollViewDelegate>delegate;

- (id)initMenuViewWithFrame:(CGRect)frame views:(NSMutableArray *)menu  num:(NSInteger)num;

@end
