//
//  NSMutableArray+Common.h
//

#import <Foundation/Foundation.h>

@interface NSMutableArray(Common)
- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)safeRemoveObjectAtIndex:(NSUInteger)index;
- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
@end
