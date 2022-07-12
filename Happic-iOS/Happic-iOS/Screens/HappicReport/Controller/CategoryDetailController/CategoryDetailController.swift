//
//  HourCategoryDetailController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/12.
//

import UIKit

enum CategoryType {
    case hourCategory
    case whereCategory
    case whoCategory
    case whatCategory
}

class CategoryDetailController: UIViewController {
    // MARK: - Properties
    var type: CategoryType = .hourCategory
    
    // MARK: - UI
    
    // MARK: - Initialization
    init(type: CategoryType) {
        self.type = type
        super.init(nibName: nil, bundle: nil)
        setViewForType()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    private func setViewForType() {
        switch type {
        case .hourCategory:
            view.backgroundColor = .systemPink
        case .whereCategory:
            view.backgroundColor = .green
        case .whoCategory:
            view.backgroundColor = .purple
        case .whatCategory:
            view.backgroundColor = .brown
        }
    }
}
