#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    NSMutableArray *digitsOfNumber = [TelephoneFinder numberFromString: number];
    if (digitsOfNumber == nil) {
        return nil;
    }
    
    NSMutableArray *res =[TelephoneFinder variantsOfNumber: digitsOfNumber];
    return res;
}


+ (NSMutableArray <NSNumber*>*) numberFromString: (NSString*)number
{
    int IntNumer = [number intValue];
    if (IntNumer < 0) {
        return nil;
    }
    NSMutableArray *digitsOfNumber = [[NSMutableArray alloc] init];
    while (IntNumer != 0) {
        [digitsOfNumber addObject: [NSNumber numberWithInt: IntNumer % 10]];
        IntNumer = IntNumer / 10;
    }
    digitsOfNumber = [[digitsOfNumber reverseObjectEnumerator] allObjects];
    return digitsOfNumber;
}

+(NSMutableArray*) variantsOfNumber: (NSMutableArray*)number
{
    NSMutableArray *res = [[NSMutableArray alloc] init];
    NSArray *neighbors = @[ @[@8],              //0
                            @[@2, @4],          //1
                            @[@1, @3, @5],      //2
                            @[@2, @6],          //3
                            @[@1, @5, @7],      //4
                            @[@2, @4, @6, @8],  //5
                            @[@3, @5, @9],      //6
                            @[@4, @8],          //7
                            @[@5, @7, @9, @0],  //8
                            @[@6, @8]];         //9
    
    for (int i = 0; i < [number count]; i++) {
        int value = [number[i] intValue];
        for (NSNumber *el in neighbors[value]) {
            NSMutableArray *copy = [[NSMutableArray alloc] initWithArray: number copyItems:YES];
            copy[i] = el;
            [res addObject: [TelephoneFinder stringFromArray: copy]];
        }
    }
    return res;
}


+ (NSString*) stringFromArray:(NSMutableArray*) array
{
    NSString *res = @"";
    for (NSNumber *el in array) {
        res = [res stringByAppendingString: [NSString stringWithFormat: @"%d", [el intValue]]];
    }
    return res;
}

@end
