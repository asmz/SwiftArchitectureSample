//
//  MVVMTableSampleViewController.swift
//  SwiftArchitectureSample
//
//  Created by Shimizu Akira on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

import UIKit

class MVVMTableSampleViewController: UIViewController {

    // MARK: - Variables

    private let viewModel = MVVMTableSampleViewModel()
    private var cellData: [MVVMTableSampleModel] = []

    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var deleteButtonItem: UIBarButtonItem!

    // MARK: - IBActions

    @IBAction func didTappedAddButton() {
        self.viewModel.add()
    }

    @IBAction func didTappedDeleteButton() {
        self.viewModel.delete()
    }

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.setupTableView()
        self.setupBind()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Private methods

    private func setupTableView() {
        self.tableView.dataSource = self
        let cellName = String(describing: MVVMTableSampleCell.self)
        let nib = UINib(nibName: cellName, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: cellName)
    }

    private func setupBind() {
        self.viewModel.cellData.bind { data in
            self.cellData = data
            self.tableView.reloadData()
        }
    }

}

extension MVVMTableSampleViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MVVMTableSampleCell.self), for: indexPath) as! MVVMTableSampleCell
        cell.setupCell(title: self.cellData[indexPath.row].title)
        return cell
    }
}
