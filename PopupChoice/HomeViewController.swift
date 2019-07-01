//
//  HomeViewController.swift
//  PopupChoice
//
//  Created by Nayem on 2/15/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit

class Model {
    let name: String
    let id: Int
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
}

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func optionsButtonDidTap(_ sender: UIButton) {
        let models = [Model(name: "Option 1", id: 1), Model(name: "Option 2", id: 2), Model(name: "Option 3", id: 3)]
        let controller = ChoicesViewController(models, labels: { (model) -> String in
            return model.name
        }) { (model) in
            print(model.name)
        }
        controller.preferredContentSize = CGSize(width: 215, height: 44*3)
        showPopup(controller, sourceView: sender)
    }
    
    private func showPopup(_ controller: UIViewController, sourceView: UIView) {
        let presentationController = AlwaysPresentAsPopover.configurePresentation(forController: controller)
        presentationController.sourceView = sourceView
        presentationController.sourceRect = sourceView.bounds
        presentationController.permittedArrowDirections = [.up, .down]
        presentationController.backgroundColor = UIColor(white: 0, alpha: 0)
        self.present(controller, animated: true)
    }
    
}

