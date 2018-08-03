//
//  FirstViewController.swift
//  SwiftArchitectureSample
//
//  Created by Shimizu Akira on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    // MARK: - Variables

    private lazy var presenter = FirstPresenter(view: self)

    // MARK: - IBOutlets

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countDownButton: UIButton!
    @IBOutlet weak var countUpButton: UIButton!

    // MARK: - IBActions

    @IBAction func didTappedCountDownButton() {
        self.presenter.countDown()
    }

    @IBAction func didTappedCountUpButton() {
        self.presenter.countUp()
    }

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        _ = presenter
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension FirstViewController: FirstView {

    func updateLabel(text: String) {
        self.countLabel.text = text
    }

    func updateCountDownButtonState(isEnabled: Bool) {
        self.countDownButton.isEnabled = isEnabled
    }

}
