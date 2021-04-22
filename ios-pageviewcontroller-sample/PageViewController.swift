//
//  PageViewController.swift
//  ios-pageviewcontroller-sample
//
//  Created by Mar 9 on 2021/04/22.
//  
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var contentVCs = [UIViewController]()
    var currentIndex: Int = 0

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        dataSource = self
        delegate = self

        for i in 0..<3 {
            let storyboard = UIStoryboard(name: "PageContent", bundle: Bundle(for: ViewController.self))
            let contentVC = storyboard.instantiateViewController(withIdentifier: "PageContentViewController") as! PageContentViewController

            contentVC.contentNumber = i
            contentVCs.append(contentVC)
        }
        setViewControllers([contentVCs[0]], direction: .forward, animated: true, completion: nil)
    }

    // MARK: - UIPageViewControllerDataSource

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = contentVCs.firstIndex(of: viewController) , index != NSNotFound else { return nil }
        if index < contentVCs.count - 1 {
            return contentVCs[index + 1]
        } else {
            return contentVCs.first
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?  {
        guard let index = contentVCs.firstIndex(of: viewController) , index != NSNotFound else { return nil }
        if index > 0 {
            return contentVCs[index - 1]
        } else {
            return contentVCs.last
        }
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return contentVCs.count
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }

    // MARK: - UIPageViewControllerDelegate

    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard finished else { return }
        guard let contentVC = pageViewController.viewControllers?.first else { return }
        guard let index = contentVCs.firstIndex(of: contentVC) , index != NSNotFound else { return }

        currentIndex = index
    }

}
