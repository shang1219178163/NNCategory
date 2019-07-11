//
//  NSMutableDictionary+Helper.h
//  
//
//  Created by BIN on 2017/8/11.
//  Copyright © 2017年 SHANG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (Helper)

-(void)setSafeObjct:(id)obj forKey:(id<NSCopying>)akey;


@end

NS_ASSUME_NONNULL_END
