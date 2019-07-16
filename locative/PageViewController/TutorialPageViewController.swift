//
//  TutorialPageViewController.swift
//  locative
//
//  Created by 大塚嶺 on 2019/07/02.
//  Copyright © 2019 大塚嶺. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    
    var pageController:UIPageViewController!
    
    let viewControllerIdArray = ["tutorialPage1","tutorialPage2","tutorialPage3"]
    var viewControllerArray = [UIViewController]()
    var currentViewController: UIViewController?
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for viewControllerId in viewControllerIdArray{
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:viewControllerId) as! UIViewController
            
            
            viewControllerArray.append(viewController)
        }
        
        currentViewController = viewControllerArray.first
        
        self.setViewControllers([viewControllerArray.first!], direction: .forward, animated: false, completion: nil)
        
        self.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let currentNum = viewControllerArray.firstIndex(of: viewController),
            currentNum > 0 {
            self.index = currentNum - 1
            return viewControllerArray[self.index]
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let currentNum = viewControllerArray.firstIndex(of: viewController),
            currentNum < viewControllerArray.count-1 {
            self.index = currentNum + 1
            return viewControllerArray[self.index]
        } else {
            return nil
        }
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllerArray.count
    }
    
    
    func moveToNextPage() -> Int {
        if let currentNum = viewControllerArray.firstIndex(of: currentViewController!),
            currentNum < viewControllerArray.count-1 {
            self.index = currentNum + 1
            currentViewController = viewControllerArray[self.index]
        }
        setViewControllers([currentViewController!], direction: .forward, animated: true, completion: nil)
        return index
    }
    
    func moveToPreviousPage() -> Int {
        if let currentNum = viewControllerArray.firstIndex(of: currentViewController!),
            currentNum > 0 {
            self.index = currentNum - 1
            currentViewController = viewControllerArray[self.index]
        }
        setViewControllers([currentViewController!], direction: .reverse, animated: true, completion: nil)
        return index
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
