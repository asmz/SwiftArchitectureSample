//
//  MVVMSampleViewController.swift
//  SwiftArchitectureSample
//
//  Created by Shimizu Akira on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

import UIKit

class MVVMSampleViewController: UIViewController {

    // MARK: - Variables

    private let viewModel = MVVMSampleViewModel()

    // MARK: - IBOutlets

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countDownButton: UIButton!
    @IBOutlet weak var countUpButton: UIButton!

    // MARK: - IBActions

    @IBAction func didTappedCountDownButton() {
        self.viewModel.countDown()
    }

    @IBAction func didTappedCountUpButton() {
        self.viewModel.countUp()
    }

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.countDownButton.isEnabled = false
        self.setupBind()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Binding

    private func setupBind() {
        self.viewModel.countLabelText.bind { text in
            self.countLabel.text = text
        }

        self.viewModel.canCountDown.bind { canCountDown in
            self.countDownButton.isEnabled = canCountDown
        }
    }

}
