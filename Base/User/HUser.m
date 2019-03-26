//
//  HUser.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/29.
//  Copyright © 2019 makerLJ. All rights reserved.
//  利用runtime  实例化数据
//  https://www.jianshu.com/p/fe131f8757ba

#import "HUser.h"

@implementation HUser

//序列化
- (void)encodeWithCoder:(NSCoder *)aCoder{
    //    [aCoder encodeObject:self.name forKey:@"name"];
    //    [aCoder encodeObject:self.Br_Date forKey:@"Br_Date"];
    //    [aCoder encodeObject:self.sex forKey:@"sex"];
    //    [aCoder encodeObject:self.horoscope forKey:@"horoscope"];
    //    [aCoder encodeBool:self.marry forKey:@"marry"];
    //    [aCoder encodeInt:self.horoscopeInt forKey:@"horoscopeInt"];
    //    [aCoder encodeObject:self.avatar forKey:@"avatar"];
    
    unsigned int count = 0;
    
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    
    free(ivarList);
    
}
//反序列化
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (!self) { return nil; }
    //    self.name = [aDecoder decodeObjectForKey:@"name"];
    //    self.Br_Date = [aDecoder decodeObjectForKey:@"Br_Date"];
    //    self.sex = [aDecoder decodeObjectForKey:@"sex"];
    //    self.horoscope = [aDecoder decodeObjectForKey:@"horoscope"];
    //    self.marry = [aDecoder decodeObjectForKey:@"marry"];
    //    self.horoscopeInt = [aDecoder decodeIntForKey:@"horoscopeInt"];
    //    self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
    //
    unsigned int count = 0;
    //    获取所有属性
    Ivar * ivarList = class_copyIvarList([self class], &count);
    for (int i = 0 ; i < count; i++) {
        //        读取单个属性
        Ivar ivar = ivarList[i];
        const char * ivarName = ivar_getName(ivar);
        //        key
        NSString * key = [NSString stringWithUTF8String:ivarName];
        //        value
        id value = [aDecoder decodeObjectForKey:key];
        [self setValue:value forKey:key];
        
    }
    //释放指针
    free(ivarList);
    
    return self;
}


//获取属性列表
-(void)getallProperty{
    unsigned int count;
    objc_property_t * propertyList = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        const char * propertyName = property_getName(propertyList[i]);
         NSLog(@"PropertyName(%d): %@",i,[NSString stringWithUTF8String:propertyName]);
    }
    free(propertyList);
    
}
//获取所有成员变量
-(void)getallIvar{
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (int i= 0; i<count; i++) {
        Ivar ivar = ivarList[i];
        const char *ivarName = ivar_getName(ivar);
        NSLog(@"Ivar(%d): %@", i, [NSString stringWithUTF8String:ivarName]);
    }
    free(ivarList);
}
//获取所有方法
-(void)getallMethod{
    unsigned int count;
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i = 0; i<count; i++) {
        Method method = methodList[i];
        SEL mthodName = method_getName(method);
        NSLog(@"MethodName(%d): %@",i,NSStringFromSelector(mthodName));
    }
    free(methodList);
}
//获取当前遵循的所有协议
-(void)getallProtocol{
//    unsigned int count;
//    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
//    for (int i=0; i< count; i++) {
//        Protocol *protocal = protocolList[i];
//        const char *protocolName = protocol_getName(protocal);
//        NSLog(@"protocol(%d): %@",i, [NSString stringWithUTF8String:protocolName]);
//    }
//    free(propertyList);
}

@end
//brew install ios-deploy
