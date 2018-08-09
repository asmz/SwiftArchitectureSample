//
//  MVPSampleView.swift
//  SwiftArchitectureSample
//
//  Created by Shimizu Akira on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

protocol MVPSampleView: class {
    func updateLabel(text: String)
    func updateCountDownButtonState(isEnabled: Bool)
}
