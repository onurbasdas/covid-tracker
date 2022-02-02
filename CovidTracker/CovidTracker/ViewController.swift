//
//  ViewController.swift
//  CovidTracker
//
//  Created by Onur Başdaş on 2.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var scope: APICaller.DataScope = .national

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Covid Cases"
        createFilterButton()
    }
    
    private func createFilterButton() {
        let buttonTitle: String = {
            switch scope {
            case .national: return "National"
            case .state(let state): return state.name
            }
        }()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: buttonTitle,
            style: .done,
            target: self,
            action: #selector(didTapFilter))
    }
    
    @objc private func didTapFilter() {
        let vc = FilterVC()
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }


}

