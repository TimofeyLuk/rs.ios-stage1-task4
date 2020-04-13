#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    
    NSInteger finalValue = [number integerValue];
    NSInteger lastSqard = finalValue - 1;
    NSMutableArray *result = nil;
    if (finalValue < 5) {
        return result;
    }
    while (lastSqard > 0) {
        result = [SquareDecomposer findAnswerWithFilalValue: (long)pow(finalValue, 2) whithArray: [NSMutableArray arrayWithArray: @[[NSNumber numberWithLong: lastSqard]]] ];
        if (result != nil){
            break;
        }
        lastSqard--;
    }
    result = [[NSMutableArray alloc] initWithArray: [[result reverseObjectEnumerator] allObjects]];
    return result;
}


+(NSMutableArray*) findAnswerWithFilalValue: (NSInteger) finalValue whithArray:(NSMutableArray*) way {
    
    NSInteger sumOfSqares = [SquareDecomposer findSqaresSumOfArray: way];
    if (finalValue < sumOfSqares) {
        return nil;
    }
    if (finalValue == sumOfSqares) {
        return way;
    }
    
    NSInteger newElement = MIN((long) sqrt(finalValue - sumOfSqares), [[way lastObject] integerValue] - 1);
    while (newElement > 0) {
        NSMutableArray *copy = [way mutableCopy];
        [copy addObject: [NSNumber numberWithLong: newElement]];
        copy = [SquareDecomposer findAnswerWithFilalValue: finalValue whithArray: copy];
        if (copy != nil) {
            return copy;
        }
       newElement--;
    }
    return nil;
}

+ (NSInteger) findSqaresSumOfArray:(NSMutableArray*) sqares {
    NSInteger result = 0;
    for (NSNumber *el in sqares) {
        result += (long)pow([el integerValue], 2);
    }
    return result;
}

+ (NSMutableArray*) arrOfSqearesTo: (NSInteger) max {
    
    NSMutableArray *res = [[NSMutableArray alloc] init];
    for (int i = 1; i <= max; i++) {
        [res addObject: [NSNumber numberWithInt:(i * i)]];
    }
    return res;
}



@end
