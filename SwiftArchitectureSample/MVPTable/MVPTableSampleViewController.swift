//
//  MVPTableSampleViewController.swift
//  SwiftArchitectureSample
//
//  Created by Shimizu Akira on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

import UIKit

class MVPTableSampleViewController: UIViewController {

    // MARK: - Variables

    private lazy var presenter = MVPTableSamplePresenter(view: self)

    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var deleteButtonItem: UIBarButtonItem!

    // MARK: - IBActions

    @IBAction func didTappedAddButton() {
        self.presenter.add()
    }

    @IBAction func didTappedDeleteButton() {
        self.presenter.delete()
    }

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        _ = presenter
        self.setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Private methods

    func setupTableView() {
        self.tableView.dataSource = self
        let cellName = String(describing: MVPTableSampleCell.self)
        let nib = UINib(nibName: cellName, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: cellName)
    }
}

extension MVPTableSampleViewController: MVPTableSampleView {

    func reloadTableData() {
        self.tableView.reloadData()
    }

    func updateDeleteButtonState(isEnabled: Bool) {
        self.deleteButtonItem.isEnabled = isEnabled
    }
}

extension MVPTableSampleViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfCellData
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MVPTableSampleCell.self), for: indexPath) as! MVPTableSampleCell
        if let cellData = self.presenter.cellData(at: indexPath.row) {
            cell.setupCell(title: cellData.title)
        }
        return cell
    }
}
