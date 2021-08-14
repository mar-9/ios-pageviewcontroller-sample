//
//  ViewController.swift
//  ios-pageviewcontroller-sample
//
//  Created by Mar 9 on 2021/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var buttonPrev: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    
    let pageVC = PageViewController(transitionStyle: .scroll,
                                    navigationOrientation: .horizontal,
                                    options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // コンテナに追加
        pageVC.view.frame = CGRect(origin: .zero, size: contentView.frame.size)
        pageVC.view.backgroundColor = .white

        contentView.addSubview(pageVC.view)
        pageVC.didMove(toParent: self)

        view.layoutIfNeeded()
    }

    @IBAction func nextButton(_ sender: Any) {
        self.buttonNext.isEnabled = false
        pageVC.currentIndex = pageVC.currentIndex >= pageVC.contentVCs.count - 1 ? 0 : pageVC.currentIndex + 1
        pageVC.setViewControllers([pageVC.contentVCs[pageVC.currentIndex]], direction: .forward, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.buttonNext.isEnabled = true
        }
    }
    
    @IBAction func prevButton(_ sender: Any) {
        self.buttonPrev.isEnabled = false
        pageVC.currentIndex = pageVC.currentIndex <= 0 ? pageVC.contentVCs.count - 1 : pageVC.currentIndex - 1
        pageVC.setViewControllers([pageVC.contentVCs[pageVC.currentIndex]], direction: .reverse, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.buttonPrev.isEnabled = true
        }
    }
}

