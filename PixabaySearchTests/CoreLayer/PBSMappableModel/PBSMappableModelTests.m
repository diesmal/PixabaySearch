//
//  PBSMappableModelTests.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PBSTestModel.h"
#import "PBSMapper.h"

@interface PBSMappableModelTests : XCTestCase

@property (nonatomic, strong) NSDictionary *testInputFlatData;
@property (nonatomic, strong) NSArray<NSDictionary *> *testInputArrayData;

@end

@implementation PBSMappableModelTests

- (void)setUp {
    [super setUp];
    
    self.testInputFlatData = @{@"testString" : @"StringFromFlatData",
                               @"subData" : @{@"testNumber" : @1}};
    
    self.testInputArrayData = @[@{@"testString" : @"StringFromArrayData_1",
                               @"subData" : @{@"testNumber" : @2}},
                                @{@"testString" : @"StringFromArrayData_2",
                                  @"subData" : @{@"testNumber" : @3}}];
    
}

- (void)tearDown {
    
    self.testInputFlatData = nil;
    self.testInputArrayData = nil;
    
    [super tearDown];
}

- (void)testFlatData {
    PBSTestModel *testModel = [PBSMapper mapData:self.testInputFlatData toClass:[PBSTestModel class]];
    XCTAssert([testModel isKindOfClass:[PBSTestModel class]]);
    XCTAssert([testModel.valueString isEqualToString:@"StringFromFlatData"]);
    XCTAssert([testModel.valueNumber isEqualToNumber:@1]);
}

- (void)testArrayData {
    NSArray<PBSTestModel *> *testModels = [PBSMapper mapArray:self.testInputArrayData toArrayofClasses:[PBSTestModel class]];
    XCTAssert([testModels isKindOfClass:[NSArray class]]);
    XCTAssert([testModels count] == 2);
    XCTAssert([testModels[0].valueString isEqualToString:@"StringFromArrayData_1"]);
    XCTAssert([testModels[0].valueNumber isEqualToNumber:@2]);
    XCTAssert([testModels[1].valueString isEqualToString:@"StringFromArrayData_2"]);
    XCTAssert([testModels[1].valueNumber isEqualToNumber:@3]);
}

- (void)testEmptyData {
    PBSTestModel *testModel = [PBSMapper mapData:@{} toClass:[PBSTestModel class]];
    XCTAssert([testModel isKindOfClass:[PBSTestModel class]]);
    XCTAssertNil(testModel.valueString);
    XCTAssertNil(testModel.valueNumber);

    NSArray<PBSTestModel *> *testModels = [PBSMapper mapArray:@[] toArrayofClasses:[PBSTestModel class]];
    
    XCTAssert([testModels isKindOfClass:[NSArray class]]);
    XCTAssert([testModels count] == 0);
}

@end
