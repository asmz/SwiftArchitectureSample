//
//  MVPTableSampleView.swift
//  SwiftArchitectureSample
//
//  Created by Shimizu Akira on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

protocol MVPTableSampleView: class {
    func reloadTableData()
    func updateDeleteButtonState(isEnabled: Bool)
}
