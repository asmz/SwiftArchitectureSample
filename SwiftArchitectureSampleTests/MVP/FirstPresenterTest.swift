//
//  FirstPresenterTest.swift
//  SwiftArchitectureSampleTests
//
//  Created by asmz on 2018/08/04.
//  Copyright © 2018年 asmz. All rights reserved.
//

import XCTest

@testable import SwiftArchitectureSample

class FirstPresenterTest: XCTestCase {

    // MARK: - Mock

    private final class MockFirstView: FirstView {

        var didCalledUpdateLabel: ((String) -> Void)?
        var didCalledUpdateCountDownButtonState: ((Bool) -> Void)?

        init() {}

        func updateLabel(text: String) {
            self.didCalledUpdateLabel?(text)
        }

        func updateCountDownButtonState(isEnabled: Bool) {
            self.didCalledUpdateCountDownButtonState?(isEnabled)
        }

    }

    // MARK: - Tests

    private var view: MockFirstView!
    private var presenter: FirstPresenter!

    override func setUp() {
        super.setUp()

        self.view = MockFirstView()
        self.presenter = FirstPresenter(view: self.view)
    }

    func testCountUp() {
        self.view.didCalledUpdateLabel = { text in
            XCTAssertEqual(text, "1")
        }
        self.view.didCalledUpdateCountDownButtonState = { isEnabled in
            XCTAssertTrue(isEnabled)
        }

        self.presenter.countUp()
    }

    func testCountUpMultiple() {
        self.view.didCalledUpdateLabel = { text in
            XCTAssertEqual(text, "100")
        }
        self.view.didCalledUpdateCountDownButtonState = { isEnabled in
            XCTAssertTrue(isEnabled)
        }

        self.presenter.countUp(num: 100)
    }

    func testCountDownFirst() {
        self.view.didCalledUpdateLabel = { text in
            XCTAssertEqual(text, "0")
        }
        self.view.didCalledUpdateCountDownButtonState = { isEnabled in
            XCTAssertFalse(isEnabled)
        }

        self.presenter.countDown()
    }

    func testCountDown() {
        // count + 1
        self.presenter.countUp()

        self.view.didCalledUpdateLabel = { text in
            XCTAssertEqual(text, "0")
        }
        self.view.didCalledUpdateCountDownButtonState = { isEnabled in
            XCTAssertFalse(isEnabled)
        }

        self.presenter.countDown()
    }

    func testCountDownMultiple() {
        // count + 100
        self.presenter.countUp(num: 100)

        self.view.didCalledUpdateLabel = { text in
            XCTAssertEqual(text, "50")
        }
        self.view.didCalledUpdateCountDownButtonState = { isEnabled in
            XCTAssertTrue(isEnabled)
        }

        self.presenter.countDown(num: 50)
    }

}
