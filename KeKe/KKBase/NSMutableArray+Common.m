//
//  NSMutableArray+Common.m
//

#import "NSMutableArray+Common.h"

@implementation NSMutableArray(Common)

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    if(anObject == nil){
        return;
    }
    if(index<self.count){
        [self insertObject:anObject atIndex:index];
    }
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index
{
    if(index<self.count){
        [self removeObjectAtIndex:index];
    }
}
- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if(anObject == nil){
        return;
    }
    if(index<self.count){
        [self replaceObjectAtIndex:index withObject:anObject];
    }
}
@end
