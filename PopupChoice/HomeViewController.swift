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

    @IBAction func showChoiceButtonDidTap(_ sender: UIButton) {
        let models = [Model(name: "Time 1 Time 1 Time 1", id: 1), Model(name: "Time 2 Time 1 Time 1", id: 2), Model(name: "Time 3 Time 1 Time 1", id: 3)]
        let controller = ChoicesViewController(models, labels: { (model) -> String in
            return model.name
        }) { (model) in
            print(model.name)
        }
        controller.preferredContentSize = CGSize(width: 256, height: 44*5 + 0.5)
        controller.view.backgroundColor = .black
        
        // MARK: Tricks
        // This is the hack for showing the controller in the middle when used in combination with UIPopoverArrowDirection(rawValue: 0)
        let sourceView = UIView(frame: CGRect.zero)
        view.addSubview(sourceView)
        sourceView.translatesAutoresizingMaskIntoConstraints = false
        sourceView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sourceView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        showPopup(controller, sourceView: sourceView)
    }
    
    private func showPopup(_ controller: UIViewController, sourceView: UIView) {
        let presentationController = AlwaysPresentAsPopover.configurePresentation(forController: controller)
        presentationController.sourceView = sourceView
        presentationController.sourceRect = sourceView.bounds
        presentationController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        self.present(controller, animated: true)
    }
    
}

