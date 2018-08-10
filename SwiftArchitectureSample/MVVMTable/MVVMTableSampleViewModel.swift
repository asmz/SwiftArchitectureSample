//
//  MVVMTableSampleViewModel.swift
//  SwiftArchitectureSample
//
//  Created by Shimizu Akira on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

import Foundation

class MVVMTableSampleViewModel {

    // MARK: - Variables

    private(set) var models = SimpleDataBinder<[MVVMTableSampleModel]>([])

    // MARK: - Internal Methods

    func add() {
        var model = MVVMTableSampleModel()
        model.title = String(describing: Date())
        self.models.value.append(model)
    }

    func delete() {
        if !self.models.value.isEmpty {
            self.models.value.remove(at: 0)
        }
    }

}
