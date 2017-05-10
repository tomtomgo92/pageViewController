//
//  CustomPageViewController.swift
//  pageTest
//
//  Created by mac on 10/05/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class CustomPageViewController: UIPageViewController
{
    // MARK: Ordre des views
    
    private(set) lazy var orderedViewControllers: [UIViewController] =
    {
        return  [
            self.newColoredViewController(color: "Red"),
            self.newColoredViewController(color: "Yellow"),
            self.newColoredViewController(color: "Green")
        ]
    }()
    
    private func newColoredViewController(color: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(color)ViewController")
    }

    // MARK: viewDidLoad()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first
        {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    
}//[End Class]

// MARK: UIPageViewControllerDataSource

extension CustomPageViewController: UIPageViewControllerDataSource
{
    
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else
        {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]


    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else
        {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else
        {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else
        {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    

}//[End Extention]
