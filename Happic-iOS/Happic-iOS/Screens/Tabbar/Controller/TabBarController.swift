//
//  TabBarController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/04.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Properties
    private let picker = UIImagePickerController()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        setDelegate()
        setPickerView()
    }
    
    // MARK: - Functions
    private func setTabBar() {
        view.backgroundColor = .black
        
        let homeController = templateNavigationController(title: "홈",
                                                          unselectedImage: UIImage(systemName: "house")!,
                                                          selectedImage: UIImage(systemName: "house")!,
                                                          rootViewController: HomeController())
        
        let haruHappicController = templateNavigationController(title: "하루해픽",
                                                                unselectedImage: UIImage(systemName: "calendar")!,
                                                                selectedImage: UIImage(systemName: "calendar")!,
                                                                rootViewController: HaruHappicController())
        
        let createContentsController = templateNavigationController(title: "",
                                                                    unselectedImage: UIImage(systemName: "plus.circle")!,
                                                                    selectedImage: UIImage(systemName: "plus.circle")!,
                                                                    rootViewController: CreateContentsController())
        
        let happicReportController = templateNavigationController(title: "해픽레포트",
                                                                  unselectedImage: UIImage(systemName: "doc")!,
                                                                  selectedImage: UIImage(systemName: "doc")!,
                                                                  rootViewController: HappicReportController())
        
        let settingController = templateNavigationController(title: "설정",
                                                             unselectedImage: UIImage(systemName: "gearshape")!,
                                                             selectedImage: UIImage(systemName: "gearshape")!,
                                                             rootViewController: SettingController())
        
        viewControllers = [homeController, haruHappicController, createContentsController, happicReportController, settingController]
        tabBar.barTintColor = .black
        tabBar.backgroundColor = .black
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
    }
    
    private func setDelegate() {
        self.delegate = self
    }
    
    private func setActionSheet() {
        let actionSheet = UIAlertController(title: "사진을 추가하세요", message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "카메라", style: .default) { _ in
            self.openCamera()
        }
        
        let photoLibraryAction = UIAlertAction(title: "갤러리", style: .default) { _ in
            self.openPhotoLibrary()
        }
        
        let cancelAction = UIAlertAction(title: "닫기", style: .cancel, handler: nil)
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photoLibraryAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true)
    }
    
    func templateNavigationController(title: String,
                                      unselectedImage: UIImage,
                                      selectedImage: UIImage,
                                      rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.title = title
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        nav.navigationBar.isHidden = true
        return nav
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.firstIndex(of: viewController)
        if index == 2 {
            setActionSheet()
            return false
        }
        return true
    }
}

extension TabBarController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func setPickerView() {
        picker.delegate = self
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        } else {
            print("Camera not available")
        }
    }
    
    func openPhotoLibrary() {
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            createContentsController.pickerImageView.image = image
            dismiss(animated: true, completion: nil)
        }
    }
}
