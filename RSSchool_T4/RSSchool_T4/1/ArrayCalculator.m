#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    NSMutableArray *mutCopy = [ArrayCalculator delNotNumber: array];
    if ([mutCopy count] == 0 || [mutCopy count] <= numberOfItems) {
        return [ArrayCalculator ProductElementsOfArray: mutCopy];
    }
    
    NSInteger res = 1;
    NSArray *arrForWork = [[[mutCopy sortedArrayUsingSelector:@selector(compare:)] reverseObjectEnumerator] allObjects];
    NSInteger first = 0;
    NSInteger last = [arrForWork count] -1;
    NSInteger step = 0;
    for (; first < [array count] && step < numberOfItems;) {
        
        NSInteger prodOfFirst = [arrForWork[first] integerValue] * [arrForWork[first + 1] integerValue];
        NSInteger prodOfLast = [arrForWork[last] integerValue] * [arrForWork[last - 1] integerValue];
        
        if (step == numberOfItems -1) {
            if ([arrForWork[first] integerValue] > [arrForWork[last] integerValue]) {
                res *= [arrForWork[first] integerValue];
                first++;
            }
            else {
                res *= [arrForWork[last] integerValue];
                last--;
            }
            step++;
        }
        else {
            if (prodOfFirst > prodOfLast) {
                res *= prodOfFirst;
                first += 2;
            }
            else {
                res *= prodOfLast;
                last -= 2;
            }
            step += 2;
        }
    }
    
    
    return res;
}


+(NSMutableArray*) delNotNumber:(NSArray*) array {
    NSMutableArray* mutCopy = [[NSMutableArray alloc] init];
    for (int i = 0; i < [array count]; i++) {
        if ([array[i] isKindOfClass: [NSNumber class]]) {
            [mutCopy addObject: array[i]];
        }
    }
    return mutCopy;
}

+(NSInteger) ProductElementsOfArray: (NSMutableArray *)array {
    
    int res = 0;
    for (NSObject *el in array) {
        res = res == 0? 1 : res;
        NSNumber *n_el = (NSNumber*) el;
        res *= n_el.intValue;
    }
    return res;
}




@end

