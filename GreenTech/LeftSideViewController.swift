//
//  LeftSideViewController.swift
//  GreenTech
//
//  Created by Shivani Murali on 9/26/16.
//  Copyright © 2016 Shivani Murali. All rights reserved.
//
import UIKit
class LeftSideViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var menuItems:[String] = ["Maps","Educational", "Search", "Upload"];
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.view.layoutSubviews()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuItems.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let mycell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! MyCustomTableViewCell
        mycell.menuItemLabel.text = menuItems[indexPath.row]
        return mycell;
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        switch(indexPath.row)
        {
        case 0:
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            let centerNavController = UINavigationController(rootViewController: centerViewController)
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.centerContainer!.centerViewController = centerNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            break;
        case 1:
            let educationalViewController = self.storyboard?.instantiateViewControllerWithIdentifier("EducationalViewController") as! EducationalViewController
            let educationalNavController = UINavigationController(rootViewController: educationalViewController)
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.centerContainer!.centerViewController = educationalNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            break;
        case 2:
            let searchViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SearchViewController") as! SearchViewController
            let searchNavController = UINavigationController(rootViewController: searchViewController)
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.centerContainer!.centerViewController = searchNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            break;
        case 3:
            let uploadViewController = self.storyboard?.instantiateViewControllerWithIdentifier("UploadViewController") as! UploadViewController
            let uploadNavController = UINavigationController(rootViewController: uploadViewController)
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.centerContainer!.centerViewController = uploadNavController
            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            break;
        default:
            print("\(menuItems[indexPath.row]) is selected");
        }
    }
}
