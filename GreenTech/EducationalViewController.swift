//
//  EducationalViewController.swift
//  GreenTech
//
//  Created by Shivani Murali on 9/27/16.
//  Copyright © 2016 Shivani Murali. All rights reserved.
//

import UIKit

class EducationalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

     var resourceTitle:[String] = ["Example"];
     var resourceLink:[String] = ["www.example.com"];
     var resourceDescription:[String] = ["This is an example resource"];
    
    
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
        return resourceTitle.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let mycell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! MyCustomTableViewCell
        mycell.resourceTitleLabel.text = resourceTitle[indexPath.row]
        mycell.resourceLinkLabel.text = resourceLink[indexPath.row]
        mycell.resourceDescriptionLabel.text = resourceDescription[indexPath.row]
        return mycell;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
  /*  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EduFormSegue" {
            if let destination = segue.destinationViewController as? EduFormViewController {
                destination.lat = self.lat
            }
        }
    }*/

    @IBAction func leftSideButton(sender: AnyObject) {
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
    @IBAction func AddNewResourceButtonPressed(sender: UIButton) {
        self.performSegueWithIdentifier("EduFormSegue", sender: self)
    }
    
}
