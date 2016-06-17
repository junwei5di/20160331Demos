 //
//  main.m
//  drawShape(C实现)
//
//  Created by qingyun on 16/3/31.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    kCircle,//圆形
    kRectangle,//矩形
    kEgg//椭圆
}shapeType;//表示形状的枚举
typedef enum
{
    kYellow,
    kGreen,
    kRed,
    kBlue,
    kBlack
}shapeColor;//表示颜色的枚举
typedef struct
{
    int x;
    int y;
    int width;
    int height;
}shapeRect;//表示范围（区域）的结构体

typedef struct
{
    shapeType _type;
    shapeColor _fillColor;
    shapeRect _rect;
}Shape;//把三种数据类型聚合在一块

void draw(Shape shape[]);//main函数访问
char* colorNameWithEnum(shapeColor color);//将枚举转换为具体的颜色
void drawCircle(shapeRect rect,shapeColor color);//绘制
void drawEgg(shapeRect rect,shapeColor color);
void drawRectangle(shapeRect rect,shapeColor color);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //方法一
        drawCircle((shapeRect){23,34,5,6}, kGreen);
        drawEgg((shapeRect){12,4,5,76}, kYellow);
        drawRectangle((shapeRect){2,5,76,7}, kRed);
        printf("方法二\n");
        //方法二 外界只访问一个方法 draw
        Shape shape[3];//创建结构体变量
        shape[0]._type=kCircle;
        shapeRect rect1={1,23,4,5};
        shape[0]._rect=rect1;
        shape[0]._fillColor=kBlack;
//        draw(shape1);
        
//        Shape shape2;
        shape[1]._rect=(shapeRect){32,4,5,6};
        shape[1]._fillColor=kRed;
        shape[1]._type=kEgg;
//        draw(shape2);
        
//        Shape shape3;
        shape[2]._fillColor=kBlack;
        shape[2]._rect=(shapeRect){2,5,6,7};
        shape[2]._type=kRectangle;
        draw(shape);
        
    }
    return 0;
}
//实现
void draw(Shape shape[])
{
    for (int i=0; i<3; i++)
    {
        switch (shape[i]._type)
        {
            case kCircle:
                drawCircle(shape[i]._rect, shape[i]._fillColor);
                break;
            case kEgg:
                drawEgg(shape[i]._rect, shape[i]._fillColor);
                break;
            case kRectangle:
                drawRectangle(shape[i]._rect, shape[i]._fillColor);
                break;
                
            default:
                break;
        }
    }
}
char* colorNameWithEnum(shapeColor color)
{
    switch (color)
    {
        case kBlack:
            return "BlackColor";
            break;
        case kBlue:
            return "BlueColor";
            break;
        case kGreen:
            return "GreenColor";
            break;
        case kRed:
            return "RedColor";
            break;
        case kYellow:
            return "YellowColor";
            break;
            
        default:
            break;
    }
}
void drawCircle(shapeRect rect,shapeColor color)
{
    printf("draw circle at (%d,%d,%d,%d) with %s\n",rect.x,rect.y,rect.width,rect.height,colorNameWithEnum(color));
}
void drawEgg(shapeRect rect,shapeColor color)
{
    printf("draw Egg at (%d,%d,%d,%d) with %s\n",rect.x,rect.y,rect.width,rect.height,colorNameWithEnum(color));
}
void drawRectangle(shapeRect rect,shapeColor color)
{
    printf("draw Rectangle at (%d,%d,%d,%d) with %s\n",rect.x,rect.y,rect.width,rect.height,colorNameWithEnum(color));
}