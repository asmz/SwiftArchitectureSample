//
//  SecondViewController.swift
//  SwiftArchitectureSample
//
//  Created by Shimizu Akira on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - Variables


    // MARK: - IBOutlets

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countDownButton: UIButton!
    @IBOutlet weak var countUpButton: UIButton!

    // MARK: - IBActions

    @IBAction func didTappedCountDownButton() {
    }

    @IBAction func didTappedCountUpButton() {
    }

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
