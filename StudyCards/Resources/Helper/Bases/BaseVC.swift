//
//  BaseVC.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 05.06.2022.
//

import UIKit
import NVActivityIndicatorView
import SnapKit

class BaseVC: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("Init \(String(describing: self))")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBaseConfiguration()
    }
    
    fileprivate func configureBaseConfiguration() {
        edgesForExtendedLayout = .top
        extendedLayoutIncludesOpaqueBars = true
        view.backgroundColor = .white
    }

    deinit {
        print("Deinit \(String(describing: self))")
    }
    
    func startIndicatorAnimation() {
        DispatchQueue.main.async {
            guard let keyWindow = UIApplication.appCurrentWindow else { return }
            let blackView = UIView(frame: keyWindow.frame)
            blackView.accessibilityIdentifier = "blackView"
            blackView.alpha = 0.0
            blackView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            keyWindow.addSubview(blackView)
            
            let loading = NVActivityIndicatorView(frame: .zero, type: .ballPulse, color: .systemRed, padding: 0)
            loading.translatesAutoresizingMaskIntoConstraints = false
            loading.accessibilityIdentifier = "NVActivityIndicatorView"
            keyWindow.addSubview(loading)
            
            loading.snp.remakeConstraints { make in
                make.height.width.equalTo(40)
                make.center.equalToSuperview()
            }
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut, animations: {
                blackView.alpha = 1
            }) { _ in
                loading.startAnimating()
            }
        }
    }
    
    func stopIndicatorAnimation() {
        DispatchQueue.main.async {
            guard let keyWindow = UIApplication.appCurrentWindow else { return }
            let blackViews = keyWindow.subviews.filter({ $0.accessibilityIdentifier == "blackView" })
            let loadings = keyWindow.subviews.filter({ $0.accessibilityIdentifier == "NVActivityIndicatorView" })
            
            UIView.animate(withDuration: 0.2, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                blackViews.forEach { $0.alpha = 0 }
            }) { _ in
                blackViews.first?.removeFromSuperview()
                
                (loadings.first as? NVActivityIndicatorView)?.stopAnimating()
                loadings.first?.removeFromSuperview()
            }
        }
    }
}

