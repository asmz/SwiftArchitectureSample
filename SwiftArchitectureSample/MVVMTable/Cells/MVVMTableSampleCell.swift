//
//  MVVMTableSampleCell.swift
//  SwiftArchitectureSample
//
//  Created by Shimizu Akira on 2018/08/09.
//  Copyright © 2018年 asmz. All rights reserved.
//

import UIKit

class MVVMTableSampleCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var titleLabel: UILabel!


    // MARK: - IBOutlets

    func setupCell(title: String) {
        self.titleLabel.text = title
    }
}
