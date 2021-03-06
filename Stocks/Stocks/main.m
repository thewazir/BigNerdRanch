//
//  main.m
//  Stocks
//
//  Created by Omer Wazir on 7/27/14.
//  Copyright (c) 2014 Omer Wazir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRForeignStockHolding.h"
#import "BNRPortfolio.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRStockHolding *amazon = [[BNRStockHolding alloc] init];
        [amazon setPurchaseSharePrice:86.49];
        [amazon setCurrentSharePrice:324.01];
        [amazon setNumberOfShares:23000];
        [amazon setSymbol:@"Amazon"];
        
        
        BNRStockHolding *nike = [[BNRStockHolding alloc] init];
        [nike setPurchaseSharePrice:26.08];
        [nike setCurrentSharePrice:77.72];
        [nike setNumberOfShares:3450];
        [nike setSymbol:@"NKE"];
        
        BNRStockHolding *starbucks = [[BNRStockHolding alloc] init];
        [starbucks setPurchaseSharePrice:17.70];
        [starbucks setCurrentSharePrice:78.74];
        [starbucks setNumberOfShares:4750];
        [starbucks setSymbol:@"SBUX"];
        
        BNRForeignStockHolding *toyota = [[BNRForeignStockHolding alloc] init];
        [toyota setPurchaseSharePrice:3990.00];
        [toyota setCurrentSharePrice:6136.00];
        [toyota setNumberOfShares:1750];
        [toyota setConversionRate:0.0098];
        [toyota setSymbol:@"TM"];
        
        BNRForeignStockHolding *bmw = [[BNRForeignStockHolding alloc] init];
        [bmw setPurchaseSharePrice:30.86];
        [bmw setCurrentSharePrice:92.21];
        [bmw setNumberOfShares:2375];
        [bmw setConversionRate:1.34];
        [bmw setSymbol:@"BMW"];
        
        
        BNRPortfolio *portfolio = [[BNRPortfolio alloc] init];
        [portfolio addStock:nike];
        [portfolio addStock:starbucks];
        [portfolio addStock:toyota];
        [portfolio addStock:bmw];
        
        float valueOfPortfolio = [portfolio valueOfPortfolio];
        NSLog(@"The current value of the portfolio is $%.2f.", valueOfPortfolio);
        
        NSLog(@"Top 3 stock peformers: %@",[portfolio topThreeMostValuableStocks]);
        NSLog(@"Stocks sorted alphabetically by symbol name. %@",[portfolio alphabeticallySorted]);
        
        [portfolio removeStock:bmw];
        [portfolio removeStock:toyota];
        
        float adjustedValueOfPortfolio = [portfolio valueOfPortfolio];
        NSLog(@"With BMW and Toyota removed from the portfolio the value changed by $%.2f", valueOfPortfolio - adjustedValueOfPortfolio);
        
    }
    return 0;
}
