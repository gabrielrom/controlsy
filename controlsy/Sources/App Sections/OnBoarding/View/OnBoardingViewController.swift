//
//  OnBoardingViewController.swift
//  controlsy
//
//  Created by Gabriel Matheus on 16/08/22.
//

import Foundation
import UIKit

class OnBoardingViewController: UIViewController {
    @IBOutlet var greetingsCollection: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var signInButton: UIButton!
    
    private let greetings: [GreetingModel] = [
        GreetingModel(greetingImageName: "plan-finances",
                      greetingTitle: "PLAN YOUR FINANCES",
                      greetingDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since th"),
        GreetingModel(greetingImageName: "save-money",
                      greetingTitle: "CONTROL YOUR SAVINGS",
                      greetingDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since th"),
        GreetingModel(greetingImageName: "watch-investments",
                      greetingTitle: "WATCH YOUR INVESTMENTS",
                      greetingDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since th")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        greetingsCollection.register(GreetingsViewCell.self,
                                     forCellWithReuseIdentifier: "GreetingsViewCell")
        greetingsCollection.dataSource = self
        greetingsCollection.delegate = self
    }
}

// MARK: Collection Data Source
extension OnBoardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return greetings.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GreetingsViewCell",
                                                      for: indexPath) as! GreetingsViewCell
        
        let greeting = greetings[indexPath.row]
        
        cell.greetingImage.image = greeting.getGreetingImage()
        cell.greetingTitle.text = greeting.greetingTitle
        cell.greetingDescription.text = greeting.greetingDescription
        
        return cell
    }
}

// MARK: Collection Flow Layout
extension OnBoardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width,
                      height: collectionView.frame.size.height)
    }
}


// MARK: PageControl
extension OnBoardingViewController {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
}
