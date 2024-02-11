//
//  OnboardingViewController.swift
//  DevMuscles
//
//  Created by Вячеслав Вовк on 10.02.2024.
//

import UIKit
import SnapKit

private struct PageControl {
    var FirstPage = UIView()
    var SecondPage = UIView()
    var ThirdPage = UIView()
}

class OnboardingViewController: UIViewController {
//    private var disposeBag = DisposeBag()
    
    // MARK: - Private Properties
    private var pages = [OnboardingPartViewController]()
    private var currentPage = 0
    
    
    // MARK: - Private Views
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageControl = UIPageControl()
    
    private let pageControll = UIView()
    private var firstPage = UIView()
    private var secondPage = UIView()
    private var thirdPage = UIView()
    
    
    var viewOutput: OnboardingViewOutput!
    
    init(pages: [OnboardingPartViewController] = [OnboardingPartViewController](), viewOutput: OnboardingViewOutput!) {
        self.viewOutput = viewOutput
        self.pages = pages
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setupPageControl()
        makeConstraints()
        view.backgroundColor = AppColors.blask
        setActivePage(page: 0)
        pages[0].button.isHidden = true
        pages[1].button.isHidden = true
    }
    
    
    // MARK: - Private Constants
//    private enum Constants {
//
//    }
    
}

// MARK: - Private Setup
private extension OnboardingViewController {
    
    func initialize() {
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    func setupPageControl() {
//        pageControl.numberOfPages = pages.count
//        pageControl.currentPage = 0
//        pageControl.isUserInteractionEnabled = false
//        view.addSubview(pageControl)
//        pageControl.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
//        }
        
        view.addSubview(pageControll)
        
        pageControll.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(4)
            make.width.equalTo(88)
        }
        pageControll.addSubview(firstPage)
        firstPage.backgroundColor = AppColors.gray
        
        
        firstPage.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(16)
        }
        
        pageControll.addSubview(secondPage)
        secondPage.backgroundColor = AppColors.gray
        
        
        pageControll.addSubview(thirdPage)
        thirdPage.backgroundColor = AppColors.gray
        
        thirdPage.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.width.equalTo(16)
        }
        
        secondPage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(firstPage.snp.trailing).inset(-10)
            make.trailing.equalTo(thirdPage.snp.leading).inset(-10)
        }
    }
    
    func setActivePage(page: Int) {
        switch page {
        case 0:
            firstPage.backgroundColor = AppColors.accentGreen
            firstPage.snp.updateConstraints { make in
                make.width.equalTo(36)
            }
            secondPage.backgroundColor = AppColors.gray
            
            thirdPage.backgroundColor = AppColors.gray
            thirdPage.snp.updateConstraints { make in
                make.width.equalTo(16)
            }
            
            
        case 1:
            firstPage.backgroundColor = AppColors.gray
            firstPage.snp.updateConstraints { make in
                make.width.equalTo(16)
            }
            secondPage.backgroundColor = AppColors.accentGreen
            
            thirdPage.backgroundColor = AppColors.gray
            thirdPage.snp.updateConstraints { make in
                make.width.equalTo(16)
            }
        case 2:
            firstPage.backgroundColor = AppColors.gray
            firstPage.snp.updateConstraints { make in
                make.width.equalTo(16)
            }
            secondPage.backgroundColor = AppColors.gray
            
            thirdPage.backgroundColor = AppColors.accentGreen
            thirdPage.snp.updateConstraints { make in
                make.width.equalTo(36)
            }
        default:
            break
        }
        UIView.animate(withDuration: 0) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    // MARK: - Constraints
    func makeConstraints() {
        
    }
}


// MARK: - UIPageViewControllerDataSource delegate
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartViewController), currentIndex > 0 else { return nil}
        if pages[currentIndex - 1] == pages.last! { return nil }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartViewController), currentIndex < pages.count - 1 else {
//            viewOutput.onboardingFinish()
            return nil }
        return pages[currentIndex + 1]
    }
    
    
}

// MARK: - UIPageViewController delegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first! as! OnboardingPartViewController) {
            currentPage = index
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            setActivePage(page: currentPage)
        }
    }
}

