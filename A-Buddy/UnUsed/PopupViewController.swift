//
//  PopupViewController.swift
//  A-Buddy
//
//  Created by Ahmad Fariz on 24/03/23.
//
import UIKit
import QuartzCore

class PopupViewController: UIViewController {
    var popupView: UIView!
    
    func initPopupView() {
        popupView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        popupView.backgroundColor = UIColor.white
        popupView.layer.cornerRadius = 10.0
        popupView.layer.shadowOpacity = 0.8
        popupView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initPopupView()
        view.addSubview(popupView)
    }
    func animateIn() {
        self.view.addSubview(popupView)
        popupView.center = self.view.center
        popupView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popupView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.popupView.alpha = 1
            self.popupView.transform = CGAffineTransform.identity
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateIn()
    }
}
