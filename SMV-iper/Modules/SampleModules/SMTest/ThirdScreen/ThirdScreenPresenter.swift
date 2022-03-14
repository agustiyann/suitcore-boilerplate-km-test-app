//
//  ThirdScreenPresenter.swift
//  SMV-iper
//
//  Created by Agus Tiyansyah Syam on 07/03/22.
//  Copyright © 2022 Rifat Firdaus. All rights reserved.
//

import Foundation

protocol ThirdScreenPresenterProtocol: BaseProtocol {}

class ThirdScreenPresenter: PaginationPresenter<User> {
    weak var view: ThirdScreenPresenterProtocol?
    
    override func refresh() {
        super.refresh()
    }
    
    override func next() {
        let page = pageStatus.currentPage + 1
        UserApi.getUsers(page: page, perpage: perPage)
            .do(onNext: { pagination in
                self.pageStatus = pagination.pageStatus
                if self.pageStatus.currentPage <= 1 {
                    self.items.removeAll()
                }
                self.items.append(contentsOf: pagination.data)
                self.saveListOfModels(data: pagination.data.detached())
                self.view?.showData()
            })
            .do(onError: { error in
                self.view?.showError(error: error)
            })
            .subscribe()
            .disposed(by: disposeBag)

    }
    
    // User defaults selected user
    static let selectedUser = "selectedUser"
    
    static var user: String {
        get {
            return UserDefaults.standard.string(forKey: selectedUser) ?? ""
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: selectedUser)
        }
    }
    
    static func deteleAll() -> Bool {
        if let domain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: domain)
            synchronize()
            return true
        } else { return false }
    }

    static func synchronize() {
        UserDefaults.standard.synchronize()
    }
}
