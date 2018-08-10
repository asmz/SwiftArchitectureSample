//
//  MVVMTableSampleViewModelTest.swift
//  SwiftArchitectureSampleTests
//
//  Created by Shimizu Akira on 2018/08/10.
//  Copyright © 2018年 asmz. All rights reserved.
//

import XCTest

@testable import SwiftArchitectureSample

class MVVMTableSampleViewModelTest: XCTestCase {

    private var viewModel: MVVMTableSampleViewModel!

    override func setUp() {
        super.setUp()

        self.viewModel = MVVMTableSampleViewModel()
    }

    func testAdd() {
        XCTAssertEqual(self.viewModel.models.value.count, 0)      // Check model count before test

        self.viewModel.models.bind { models in
            XCTAssertEqual(models.count, 1)
        }

        self.viewModel.add()
    }

    func testDeleteFirst() {
        XCTAssertEqual(self.viewModel.models.value.count, 0)      // Check model count before test

        self.viewModel.models.bind { models in
            XCTAssertEqual(models.count, 0)
        }

        self.viewModel.delete()
    }

    func testDelete() {
        self.viewModel.add()
        XCTAssertEqual(self.viewModel.models.value.count, 1)      // Check model count before test

        self.viewModel.models.bind { models in
            XCTAssertEqual(models.count, 0)
        }

        self.viewModel.delete()
    }

    func testDeleteAndRemain() {
        self.viewModel.add()
        self.viewModel.add()
        self.viewModel.add()
        XCTAssertEqual(self.viewModel.models.value.count, 3)      // Check model count before test

        self.viewModel.models.bind { models in
            XCTAssertEqual(models.count, 2)
        }

        self.viewModel.delete()
    }

}
