//
//  ChoicesViewController.swift
//  ChoicePopup
//
//  Created by Nayem on 2/14/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit

class ChoicesViewController<Element> : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    typealias SelectionHandler = (Element) -> Void
    typealias LabelProvider = (Element) -> String
    
    private let values : [Element]
    private let labels : LabelProvider
    private let onSelect : SelectionHandler?
    
    private let navigationBar = StandaloneNavigationBar(frame: .zero)
    private let separatorLine = UIView(frame: .zero)
    private let bottomButton = UIButton(type: .system)
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    init(_ values : [Element], labels : @escaping LabelProvider = String.init(describing:), onSelect : SelectionHandler?) {
        self.values = values
        self.onSelect = onSelect
        self.labels = labels
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupNavigationBar()
        setupSeparatorLine()
        setupBottomDismissButton()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        view.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navigationBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        let navItem = UINavigationItem(title: "Choice Options")
        navigationBar.setItems([navItem], animated: false)
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
    
    private func setupSeparatorLine() {
        view.addSubview(separatorLine)
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        separatorLine.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        separatorLine.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        separatorLine.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        separatorLine.backgroundColor = .white
    }
    
    private func setupBottomDismissButton() {
        view.addSubview(bottomButton)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        bottomButton.setTitle("Dismiss", for: .normal)
        bottomButton.setTitleColor(.white, for: .normal)
        bottomButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        bottomButton.backgroundColor = .black
        
        bottomButton.addTarget(self, action: #selector(bottomButtonDidTap(_:)), for: .touchUpInside)
    }
    
    @objc func bottomButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: separatorLine.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomButton.topAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.registerReusableCell(ChoiceTableViewCell.self)
        tableView.rowHeight = 44
        
        tableView.backgroundColor = .clear
        tableView.separatorInset = .zero
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = labels(values[indexPath.row])
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
//        let cell = ChoiceTableViewCell.dequeue(fromTableView: tableView, atIndex: indexPath)
//        cell.choiceLabel.text = labels(values[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true)
        onSelect?(values[indexPath.row])
    }
    
}
