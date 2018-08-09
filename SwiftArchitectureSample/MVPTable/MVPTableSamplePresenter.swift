//
//  MVPTableSamplePresenter.swift
//  SwiftArchitectureSample
//
//  Created by Shimizu Akira on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

import Foundation

class MVPTableSamplePresenter {

    // MARK: - Variables

    private weak var view: MVPTableSampleView?
    private var models: [MVPTableSampleModel] {
        didSet {
            self.refreshViews()
        }
    }

    var numberOfCellData: Int {
        return self.models.count
    }

    // MARK: - Constructor

    init(view: MVPTableSampleView) {
        self.view = view
        self.models = []
        self.refreshViews()
    }

    // MARK: - Internal Methods

    func add() {
        var model = MVPTableSampleModel()
        model.title = UUID().uuidString
        self.models.append(model)
    }

    func delete() {
        if !self.models.isEmpty {
            self.models.remove(at: 0)
        }
    }

    func cellData(at index: Int) -> MVPTableSampleModel? {
        if self.models.isEmpty {
            return nil
        }
        return self.models[index]
    }

    // MARK: - Private Methods

    private func refreshViews() {
        self.view?.reloadTableData()
        self.view?.updateDeleteButtonState(isEnabled: !self.models.isEmpty)
    }
}
