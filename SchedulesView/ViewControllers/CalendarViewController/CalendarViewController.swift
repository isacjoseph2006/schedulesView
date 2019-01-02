//
//  CalendarViewController.swift
//  SchedulesView
//
//  Created by Isac Joseph on 29/12/18.
//  Copyright © 2018 Isac Joseph. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController
{
    @IBOutlet weak var tblHours: UITableView!
    @IBOutlet weak var dateSelectionView: DateSelectionView!
    
    var selectedDate = Date()
    {
        willSet(newDate)
        {
            print(newDate)
            print(selectedDate)
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setUpViews()
    }

    func setUpViews()
    {
        self.dateSelectionView.delegate = self
        self.tblHours.delegate = self
        self.tblHours.dataSource = self
        self.tblHours.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }

}

extension CalendarViewController:DateSelectionViewDelegate
{
    func selectedDate(date: Date)
    {
        selectedDate = date
    }

}

extension CalendarViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hrsCell", for: indexPath) as! HrsTableViewCell
        cell.configureCell(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
