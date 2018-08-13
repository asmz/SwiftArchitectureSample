//
//  MVPTableSamplePresenterTest.swift
//  SwiftArchitectureSampleTests
//
//  Created by Shimizu Akira on 2018/08/09.
//  Copyright © 2018年 asmz. All rights reserved.
//

import XCTest

@testable import SwiftArchitectureSample

class MVPTableSamplePresenterTest: XCTestCase {

    // MARK: - Mock

    private final class MockMVPTableSampleView: MVPTableSampleView {

        var didCalledReloadTableData: (() -> Void)?
        var didCalledUpdateDeleteButtonState: ((Bool) -> Void)?

        init() {}

        func reloadTableData() {
            self.didCalledReloadTableData?()
        }

        func updateDeleteButtonState(isEnabled: Bool) {
            self.didCalledUpdateDeleteButtonState?(isEnabled)
        }

    }

    // MARK: - Tests

    private var view: MockMVPTableSampleView!
    private var presenter: MVPTableSamplePresenter!

    override func setUp() {
        super.setUp()

        self.view = MockMVPTableSampleView()
        self.presenter = MVPTableSamplePresenter(view: self.view)
    }

    func testAdd() {
        XCTAssertEqual(self.presenter.numberOfCellData, 0)  // Check model count before test

        self.view.didCalledReloadTableData = {
            XCTAssertEqual(self.presenter.numberOfCellData, 1)
        }
        self.view.didCalledUpdateDeleteButtonState = { isEnabled in
            XCTAssertTrue(isEnabled)
        }

        self.presenter.add()
    }

    func testDeleteFirst() {
        XCTAssertEqual(self.presenter.numberOfCellData, 0)  // Check model count before test

        self.view.didCalledReloadTableData = {
            XCTAssertEqual(self.presenter.numberOfCellData, 0)
        }
        self.view.didCalledUpdateDeleteButtonState = { isEnabled in
            XCTAssertFalse(isEnabled)
        }

        self.presenter.delete()
    }

    func testDelete() {
        self.presenter.add()
        XCTAssertEqual(self.presenter.numberOfCellData, 1)  // Check model count before test

        self.view.didCalledReloadTableData = {
            XCTAssertEqual(self.presenter.numberOfCellData, 0)
        }
        self.view.didCalledUpdateDeleteButtonState = { isEnabled in
            XCTAssertFalse(isEnabled)
        }

        self.presenter.delete()
    }

    func testDeleteAndRemain() {
        self.presenter.add()
        self.presenter.add()
        self.presenter.add()
        XCTAssertEqual(self.presenter.numberOfCellData, 3)  // Check model count before test

        self.view.didCalledReloadTableData = {
            XCTAssertEqual(self.presenter.numberOfCellData, 2)
        }
        self.view.didCalledUpdateDeleteButtonState = { isEnabled in
            XCTAssertTrue(isEnabled)
        }

        self.presenter.delete()
    }

    func testCellData() {
        self.presenter.add()
        self.presenter.add()
        self.presenter.add()
        XCTAssertEqual(self.presenter.numberOfCellData, 3)  // Check model count before test

        XCTAssertNotNil(self.presenter.cellData(at: 0))
        XCTAssert(type(of: self.presenter.cellData(at: 0)!) == MVPTableSampleModel.self)
        print(type(of: self.presenter.cellData(at: 0)!))
        print(MVPTableSampleModel.self)
    }

    func testCellDataIsNil() {
        XCTAssertEqual(self.presenter.numberOfCellData, 0)  // Check model count before test

        XCTAssertNil(self.presenter.cellData(at: 0))
    }
}
