//
//  menuScrollView.m
//  deyingSoft
//
//  Created by 李世飞 on 16/1/29.
//  Copyright © 2016年 李世飞. All rights reserved.
//

#import "menuScrollView.h"

@implementation menuScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (id)initMenuViewWithFrame:(CGRect)frame views:(NSMutableArray *)menu  num:(NSInteger)num
{
    self = [super initWithFrame:frame];
     if(self)
    {
        self.userInteractionEnabled = YES;
        
        widthNum=0;
        
        Num=num;

        menuArray = menu;
        
        if(menuArray.count>num)
        {
            if(menuArray.count%num==0)
            {
                widthNum=menuArray.count/num;
            }
            else
            {
                widthNum=(menuArray.count/num)+1;
            }
        }
        
        
  
        [self iniSubviewsWithFrame:frame];

  
   }
    return self;

}
-(void)iniSubviewsWithFrame:(CGRect)frame
{

    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    CGRect fitRect = CGRectMake(0, 0, width, height);
    
    scr = [[UIScrollView alloc]initWithFrame:fitRect];
    scr.pagingEnabled = YES;
    scr.delegate = self;
    scr.backgroundColor=[UIColor whiteColor];
    scr.contentSize = CGSizeMake(width*widthNum, height);
    scr.showsVerticalScrollIndicator = NO;
    scr.showsHorizontalScrollIndicator = NO;
    [self addSubview:scr];
    
    currenPage=0;
    
    
    for(int i=0;i<menuArray.count;i++)
    {
        NSInteger index = i%(Num/2);
        NSInteger page = i/(Num/2);
        
        CGFloat hh =0;
        
        if(i>=Num)
        {
            hh=(i/Num)*width;
            
        }
        
        NSDictionary * dic =[menuArray objectAtIndex:i];
        
        UIImageView * pic=  [MyUtil addSubviewImage:nil rect:CGRectMake(index*(width/(Num/2))+(width/(Num/2)-50)/2, page*80+5,50,50) View:scr Tag:i];
        
        [pic sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"pic"]] placeholderImage:nil];
        
        UITapGestureRecognizer * longPressGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
        longPressGr.view.tag=pic.tag;
        longPressGr.numberOfTapsRequired=1;
        [pic addGestureRecognizer:longPressGr];
        
        
        
       UILabel * lab= [MyUtil labelName:[dic objectForKey:@"typeName"] fontSize:13.0f rect:CGRectMake(index*(width/(Num/2)),page*80+55, width/(Num/2), 20) View:scr Alignment:1 Color:black Tag:i];
        
        lab.userInteractionEnabled=YES;
        
        UITapGestureRecognizer * longPressGr22 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
        longPressGr22.view.tag=lab.tag;
        longPressGr22.numberOfTapsRequired=1;
        [lab addGestureRecognizer:longPressGr22];
        
        
        
        [MyUtil setXianTiao:ColorHUI rect:CGRectMake(0, 80, width, 1) view:scr];
        
        
        [MyUtil setXianTiao:ColorHUI rect:CGRectMake(width/(Num/2), 0, 1, 160) view:scr];
        
        
        [MyUtil setXianTiao:ColorHUI rect:CGRectMake((width/(Num/2))*2, 0, 1, 160) view:scr];
        
    }
    
    if(widthNum>0)
    {
        for(int i=0;i<menuArray.count-Num;i++)
        {
            NSInteger index = i%(Num/2);
            NSInteger page = i/(Num/2);
            
            NSDictionary * dic =[menuArray objectAtIndex:i+6];
            
            UIImageView * pic=  [MyUtil addSubviewImage:nil rect:CGRectMake(width+index * (width/(Num/2))+(width/(Num/2)-50)/2, page  * 80 +5, 50,50) View:scr Tag:i];
            
            [pic sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"pic"]] placeholderImage:nil];
            
            UITapGestureRecognizer * longPressGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
            longPressGr.view.tag=pic.tag;
            longPressGr.numberOfTapsRequired=1;
            [pic addGestureRecognizer:longPressGr];

            
           UILabel *lb=   [MyUtil labelName:[dic objectForKey:@"typeName"] fontSize:13.0f rect:CGRectMake(width+index * (width/(Num/2)), page*80 +55, width/(Num/2), 20) View:scr Alignment:1 Color:black Tag:i];
            
            lb.userInteractionEnabled=YES;
            
            UITapGestureRecognizer * longPressGr1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
            longPressGr1.view.tag=lb.tag;
            longPressGr1.numberOfTapsRequired=1;
            [lb addGestureRecognizer:longPressGr1];
            
            
            [MyUtil setXianTiao:ColorHUI rect:CGRectMake(width, 80, width, 1) view:scr];
            
            [MyUtil setXianTiao:ColorHUI rect:CGRectMake(width/(Num/2)+width, 0, 1, 160) view:scr];
            
            [MyUtil setXianTiao:ColorHUI rect:CGRectMake((width/(Num/2))*2+width, 0, 1, 160) view:scr];
            
        }
        
    }

}

-(void)longPressToDo:(UILongPressGestureRecognizer *)gesture
{
   
    [self.delegate scrollViewDidClickedAtPage:gesture.view.tag current:currenPage];
    

}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    CGFloat width = scr.frame.size.width;
    //当手指滑动scrollview，而scrollview减速停止的时候 开始计算当前的图片的位置
    currenPage = scr.contentOffset.x/width;
 
}
@end
