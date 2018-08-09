//
//  MVVMSampleViewModelTest.swift
//  SwiftArchitectureSampleTests
//
//  Created by asmz on 2018/08/05.
//  Copyright © 2018年 asmz. All rights reserved.
//

import XCTest

@testable import SwiftArchitectureSample

class MVVMSampleViewModelTest: XCTestCase {

    private var viewModel: MVVMSampleViewModel!

    override func setUp() {
        super.setUp()

        self.viewModel = MVVMSampleViewModel()
    }

    func testCountUp() {
        self.viewModel.countLabelText.bind { text in
            XCTAssertEqual(text, "1")
        }
        self.viewModel.canCountDown.bind { canCountDown in
            XCTAssertTrue(canCountDown)
        }

        self.viewModel.countUp()
    }

    func testCountUpMultiple() {
        self.viewModel.countLabelText.bind { text in
            XCTAssertEqual(text, "100")
        }
        self.viewModel.canCountDown.bind { canCountDown in
            XCTAssertTrue(canCountDown)
        }

        self.viewModel.countUp(num: 100)
    }

    func testCountDownFirst() {
        self.viewModel.countLabelText.bind { text in
            XCTAssertEqual(text, "0")
        }
        self.viewModel.canCountDown.bind { canCountDown in
            XCTAssertFalse(canCountDown)
        }

        self.viewModel.countDown()
    }

    func testCountDown() {
        // count + 1
        self.viewModel.countUp()

        self.viewModel.countLabelText.bind { text in
            XCTAssertEqual(text, "0")
        }
        self.viewModel.canCountDown.bind { canCountDown in
            XCTAssertFalse(canCountDown)
        }

        self.viewModel.countDown()
    }

    func testCountDownMultiple() {
        // count + 100
        self.viewModel.countUp(num: 100)

        self.viewModel.countLabelText.bind { text in
            XCTAssertEqual(text, "50")
        }
        self.viewModel.canCountDown.bind { canCountDown in
            XCTAssertTrue(canCountDown)
        }

        self.viewModel.countDown(num: 50)
    }

}
