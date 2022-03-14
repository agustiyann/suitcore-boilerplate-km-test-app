//
//  SecondScreenViewController.swift
//  SMV-iper
//
//  Created by Agus Tiyansyah Syam on 07/03/22.
//  Copyright © 2022 Rifat Firdaus. All rights reserved.
//

import UIKit

class SecondScreenViewController: UIViewController {

    var name: String = ""
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSelectedUser: UILabel!
    @IBOutlet weak var buttonChooseUser: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        ThirdScreenPresenter.user = "Selected User Name"
        title = "Second Screen"
        labelName.text = name
        buttonChooseUser.layer.cornerRadius = 12
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !ThirdScreenPresenter.user.isEmpty {
            labelSelectedUser.text = ThirdScreenPresenter.user
        }
    }

    @IBAction func chooseUserPressed(_ sender: UIButton) {
        navigationController?.pushViewController(ThirdScreenViewController(), animated: true)
    }
}
