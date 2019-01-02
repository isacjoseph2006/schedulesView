//
//  DateSelectionView.swift
//  SchedulesView
//
//  Created by Isac Joseph on 29/12/18.
//  Copyright © 2018 Isac Joseph. All rights reserved.
//

import UIKit

protocol DateSelectionViewDelegate: class
{
    func selectedDate(date:Date)
}

class DateSelectionView: UIView
{
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var datesCollectionView: UICollectionView!
    
    weak var delegate: DateSelectionViewDelegate?
    var selectedDate = Date()
    {
        didSet
        {
            datesCollectionView.reloadData()
        }
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit()
    {
        self.loadNibs()
        self.datesCollectionView.register(UINib(nibName:"DatesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"datesCell")
        self.datesCollectionView.delegate = self
        self.datesCollectionView.dataSource = self
    }
    
    
    func loadNibs()
    {
        Bundle.main.loadNibNamed("DateSelectionView", owner: self, options:nil)
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        // align contentView from the left and right
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["view": contentView]))
        // align contentView from the top and bottom
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["view": contentView]))
    }
    
    func getDateForCell(index:Int) -> Date
    {
        let time = TimeInterval(index * 60 * 60 * 24)
        let date = Date().addingTimeInterval(time)
        return date
    }
}


extension DateSelectionView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath)
    {
        collectionView.deselectItem(at: indexPath, animated: false)
        selectedDate = getDateForCell(index: indexPath.row)
        self.delegate?.selectedDate(date: selectedDate)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return Int(Int16.max)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "datesCell", for: indexPath) as! DatesCollectionViewCell
        let date = getDateForCell(index: indexPath.row)
        cell.lblDate.text = date.dateString()
        cell.dateOverlayView.backgroundColor = (Calendar.current.isDate(date, inSameDayAs: selectedDate)) ? UIColor.black : UIColor.clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let maxWidth = UIScreen.main.bounds.width
        let size = maxWidth / 7
        return CGSize(width: size, height: 34)
    }
}
