//
//  BaseUploadViewController.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/17.
//

import UIKit

class BaseUploadViewController: UIViewController {
    
    // MARK: - Properties
    let picker = UIImagePickerController()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setPickerView()
    }
    
    // MARK: - Functions
    func setActionSheet() {
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
}

// MARK: - Extensions
extension BaseUploadViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
    
    // 세로 이미지 회전 문제로 인한 함수
    func fixOrientation(img: UIImage) -> UIImage {
        if img.imageOrientation == .up {
            return img
        }
        
        UIGraphicsBeginImageContextWithOptions(img.size, false, img.scale)
        let rect = CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height)
        img.draw(in: rect)
        
        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return normalizedImage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let createContentsController = CreateContentsController()
        createContentsController.delegate = self
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            createContentsController.pickerImageView.image = fixOrientation(img: image)
            picker.dismiss(animated: true)
            createContentsController.modalPresentationStyle = .fullScreen
            present(createContentsController, animated: true, completion: nil)
        }
    }
}

extension BaseUploadViewController: CreateContentsControllerDelegate {
    func showToastAfterCreating(_ message: String) {
        showToast(message: message)
    }
}
