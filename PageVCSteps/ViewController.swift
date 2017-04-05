//
//  ViewController.swift
//  PageVCSteps
//
//  Created by Iggy on 4/4/17.
//  Copyright © 2017 Iggy Mwangi. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self as? UIPageViewControllerDelegate
        // this sets the background color of the built-in paging dots
        view.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view, typically from a nib.
        setViewControllers([getOne()], direction: .forward, animated: false, completion: nil)
    }
    
    func getOne() -> One {
        return storyboard!.instantiateViewController(withIdentifier: "One") as! One
    }
    func getTwo() -> Two {
        return storyboard!.instantiateViewController(withIdentifier: "Two") as! Two
    }
    func getThree() -> Three {
        return storyboard!.instantiateViewController(withIdentifier: "Three") as! Three
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var currentPage: Int = 0
    func goToPageTwo(){
               currentPage = 1
         setViewControllers([getTwo()], direction: .forward, animated: false, completion: nil)
 
    }
    func goToPageThree(){
        currentPage = 2
        setViewControllers([getThree()], direction: .forward, animated: false, completion: nil)
        
    }
    func goToPageOne(){
        currentPage = 0
        setViewControllers([getOne()], direction: .forward, animated: false, completion: nil)
        
    }


}

extension ViewController:  UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController is Three {
            // 2 -> 1
            return getTwo()
        } else if viewController is Two {
            // 1 -> 0
            return getOne()
        } else {
            // 0 -> end of the road
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter  viewController: UIViewController) -> UIViewController? {
        if viewController is One {
            // 0 -> 1
            return getTwo()
        } else if viewController is Two {
            // 1 -> 2
            return getThree()
        } else {
            // 2 -> end of the road
            return nil
        }
    }
    
    // Enables pagination dots
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }// The number of items reflected in the page indicator.
    
 
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentPage
    }// The selected item reflected in the page indicator.


    
    
}

