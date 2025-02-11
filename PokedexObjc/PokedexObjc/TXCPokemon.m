//
//  TXCPokemon.m
//  PokedexObjc
//
//  Created by Thomas Cacciatore on 7/26/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

#import "TXCPokemon.h"

@implementation TXCPokemon


- (instancetype)initWithName:(NSString *)name identifier:(id)identifier alibilities:(NSArray *)abilities sprite:(NSString *)sprite
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _identifier = [identifier intValue];
//        _abilities = [abilities copy];
        _sprite = sprite;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    
    _name = dictionary[@"name"];
    _identifier = [dictionary[@"id"] intValue];
    NSArray *abilitiesArray = dictionary[@"abilities"];
    NSLog(@"Abilities Array: %@", abilitiesArray);
    NSMutableArray *finalAbilitiesArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in abilitiesArray) {
        NSString *ability = dict[@"ability"][@"name"];
        NSLog(@"ability: %@", ability);
        [finalAbilitiesArray addObject:ability];
    }
    _abilities = finalAbilitiesArray;
    _sprite = dictionary[@"sprites"][@"front_default"];
    
    return self;
    
}


@end
