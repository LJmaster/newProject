//
//  HUser.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/29.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HUser.h"

@implementation HUser

//序列化
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.Br_Date forKey:@"Br_Date"];
    [aCoder encodeObject:self.sex forKey:@"sex"];
    [aCoder encodeObject:self.horoscope forKey:@"horoscope"];
    [aCoder encodeBool:self.marry forKey:@"marry"];
    [aCoder encodeInt:self.horoscopeInt forKey:@"horoscopeInt"];
    [aCoder encodeObject:self.avatar forKey:@"avatar"];
}
//反序列化
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (!self) { return nil; }
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.Br_Date = [aDecoder decodeObjectForKey:@"Br_Date"];
    self.sex = [aDecoder decodeObjectForKey:@"sex"];
    self.horoscope = [aDecoder decodeObjectForKey:@"horoscope"];
    self.marry = [aDecoder decodeObjectForKey:@"marry"];
    self.horoscopeInt = [aDecoder decodeIntForKey:@"horoscopeInt"];
    self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
    return self;
}

@end
