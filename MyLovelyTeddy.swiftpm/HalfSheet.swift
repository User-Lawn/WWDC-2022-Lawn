//
//  File.swift
//  MyLovelyTeddy
//
//  Created by Jun.Mac on 2022/04/23.
//

import SwiftUI


extension View{
    
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>,@ViewBuilder sheetView: @escaping ()->SheetView,onEnd: @escaping ()->())->some View{
        
      
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(),showSheet: showSheet, onEnd: onEnd)
            )
            .onChange(of: showSheet.wrappedValue) { newValue in
                if !newValue{
                    onEnd()
                }
            }
    }
}

struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable{
    
    var sheetView: SheetView
    @Binding var showSheet: Bool
    var onEnd: ()->()
    
    let controller = UIViewController()
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
    
        controller.view.backgroundColor = .clear
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
     
        if showSheet{
            
            if uiViewController.presentedViewController == nil{
                
                
                let sheetController = CustomHostingController(rootView: sheetView)
                sheetController.presentationController?.delegate = context.coordinator
                uiViewController.present(sheetController, animated: true)
            }
        }
        else{

            if uiViewController.presentedViewController != nil{
                uiViewController.dismiss(animated: true)
            }
        }
    }
    
   
    class Coordinator: NSObject,UISheetPresentationControllerDelegate{
        
        var parent: HalfSheetHelper
        
        init(parent: HalfSheetHelper) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            parent.showSheet = false
        }
    }
}


class CustomHostingController<Content: View>: UIHostingController<Content>{
    
    override func viewDidLoad() {
                
        
        if let presentationController = presentationController as? UISheetPresentationController{
            
            presentationController.detents = [
            
                .medium(),
                .large()
            ]
            
          
            presentationController.prefersGrabberVisible = true
        }
    }
}

