//
//  DetailView.swift
//  CitiesDB
//
//  Created by DarkBringer on 9.12.2021.
//

import UIKit
import BaseComponents
import WebKit

class DetailView: GenericBaseView<DetailViewData>  {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var shadowContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.4
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var flagContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [shadowContainerView, titleStack, countryLink])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 5
        return temp
    }()
    
    private lazy var titleStack: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [title, countryId])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .horizontal
        temp.spacing = 5
        return temp
    }()
    
    private lazy var title: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .black
        temp.text = "Country ID"
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .left
        return temp
    }()
    
    private lazy var countryId: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .black
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .left
        return temp
    }()
    
    private lazy var countryLink: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .black
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .left
        return temp
    }()
    
    lazy var webView: WKWebView = {
        let temp = WKWebView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.isUserInteractionEnabled = false
        temp.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponent()
    }
    
    private func addComponent() {
        
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        configureFlagContainer()
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 90),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10)
            
        ])
    }
    private func configureFlagContainer() {
        
        shadowContainerView.addSubview(flagContainerView)
        flagContainerView.addSubview(webView)
        
        NSLayoutConstraint.activate([
            
            flagContainerView.topAnchor.constraint(equalTo: shadowContainerView.topAnchor),
            flagContainerView.bottomAnchor.constraint(equalTo: shadowContainerView.bottomAnchor),
            flagContainerView.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor),
            flagContainerView.trailingAnchor.constraint(equalTo: shadowContainerView.trailingAnchor),
            
            webView.topAnchor.constraint(equalTo: flagContainerView.topAnchor, constant: 10),
            webView.bottomAnchor.constraint(equalTo: flagContainerView.bottomAnchor, constant: -10),
            webView.leadingAnchor.constraint(equalTo: flagContainerView.leadingAnchor, constant: 10),
            webView.trailingAnchor.constraint(equalTo: flagContainerView.trailingAnchor, constant: -10)
            
        ])
        
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        DispatchQueue.main.async { [self] in
            countryId.text = data.countryId
            countryLink.text = data.countryLink
            webView.load(data.imageRequest)
        }
    }
}
