//
//  ThirdScreenViewController.swift
//  SMV-iper
//
//  Created by Agus Tiyansyah Syam on 07/03/22.
//  Copyright © 2022 Rifat Firdaus. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding
import DZNEmptyDataSet
import SVProgressHUD

class ThirdScreenViewController: UIViewController {
    
    lazy var viewShimmer = SimpleListShimmerView()
    var tableView: TPKeyboardAvoidingTableView!
    
    var presenter: ThirdScreenPresenter!
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.title = "Third Screen"
        self.presenter = ThirdScreenPresenter()
        presenter.view = self
        setupTableView()
        refresh()
    }
    
    func refresh() {
        self.tableView.pullToRefreshView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.presenter.refresh()
        }
    }
    
    func setupTableView() {
        tableView = SMContainerView.createTableView(viewParent: self.view)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.emptyDataSetDelegate = self
        tableView.emptyDataSetSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 75
        tableView.register(UserTableViewCell.loadNib(), forCellReuseIdentifier: UserTableViewCell.className())
        
        // TEST SHIMMER
        //
        tableView.register(UINib(nibName: "ShimmerRepoCell", bundle: nil), forCellReuseIdentifier: "ShimmerRepoCell")
        
        tableView.addPullToRefresh { [weak self] in
            self?.refresh()
        }
        tableView.addInfiniteScrolling { [weak self] in
            self?.presenter.next()
        }
        view.layoutIfNeeded()
        tableView.layoutIfNeeded()
    }
}

extension ThirdScreenViewController: ThirdScreenPresenterProtocol {
    func showData() {
        tableView.infiniteScrollingView.enabled = self.presenter.items.count != 0
        tableView.pullToRefreshView.stopAnimationLoading()
        tableView.infiniteScrollingView.stopAnimationLoading()
        tableView.reloadData()
    }
    
    func showError(error: Error?) {
        tableView.pullToRefreshView.stopAnimating()
    }
}

extension ThirdScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.className(), for: indexPath) as! UserTableViewCell
        if indexPath.row < presenter.items.count {
            cell.user = presenter.items[indexPath.row]
        }
        return cell
    }
    
}

extension ThirdScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let content = presenter.items[indexPath.row]
        self.username = "\(content.firstName!) \(content.lastName!)"
        ThirdScreenPresenter.user = username
    }
}

extension ThirdScreenViewController: DZNEmptyDataSetDelegate, DZNEmptyDataSetSource {
    func customView(forEmptyDataSet scrollView: UIScrollView) -> UIView? {
        return viewShimmer
    }
}
