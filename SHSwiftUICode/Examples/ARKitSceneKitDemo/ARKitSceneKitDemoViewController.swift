//
//  ARKitSceneKitDemoViewController.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/08/18.
//

import UIKit
import ARKit
import SceneKit
import GLTFSceneKit

class ARKitSceneKitDemoViewController: UIViewController, URLSessionDelegate {

    private var catchAble = false
    private var modelReady = false
    
    var arSCNView: ARSCNView {
        return self.view as! ARSCNView
    }
    
    override func loadView() {
        self.view = ARSCNView(frame: .zero)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        guard ARConfiguration.isSupported else {
            ILog.debug(tag: #file, content: "*** ARConfiguration: AR Not Supported")
            return
        }
        
        self.setupARSceneView()
        self.setupRecognizers()
        
        self.downloadSceneTask()
    }
    
    /**
     初始化AR和Scene
     */
    private func setupARSceneView() {
        
        // Do any additional setup after loading the view.
        arSCNView.delegate = self
        
        // Show statistics such as fps and timing information
        arSCNView.showsStatistics = true
        // 显示统计数据（statistics）如 fps 和 时长信息
        arSCNView.allowsCameraControl = false
        arSCNView.autoenablesDefaultLighting = true
        arSCNView.showsStatistics = false
        
        /*
         Feature points: 这些是你整个场景中看到的小点;它们代表了 ARKit 在摄像机图像中检测到的显著功能,这些功能又用作地标,以在设备移动时准确跟踪设备的位置和方向。
         World origin: 这是红色、绿色和蓝色线的大交叉点,位于开始AR session的位置。红线表示正 X 轴,绿线表示正 Y 轴,蓝线表示正 Z 轴。
         Bounding boxes: 这些是所有 3D 对象周围的框状轮廓。
         Wireframe: 需要注意的是,你现在可以在 AR 场景中每个 3D 对象的曲面上看到多边形的轮廓。你可以精确查看这些几何形状的详细程度。
         */
        arSCNView.debugOptions = [
//            .showFeaturePoints,
//            .showWorldOrigin,
//            .showBoundingBoxes,
//            .showWireframe,
        ]
        
        arSCNView.scene = SCNScene()
    }
    
    func setupARSession() {
        
        guard ARWorldTrackingConfiguration.isSupported else {
            // 可以使用 类的isSupported属性来检查设备是否支持该配置。3DOF 和 6DOF
            /*
             在启动AR session,之前,必须创建AR session conﬁguration （AR 会话配置）。此配置用于在真实世界(设备所在的位置)和虚拟 3D 世界(虚拟内容所在的位置)之间建立连接。
             
             有两种类型的配置：
             
             AROrientationTrackingConfiguration, 用于三个自由度跟踪, 简称3DOF。
             3DOF跟踪设备旋转,分为Pitch（俯仰）、Roll（滚动）和 Yaw（偏航） 组件,表示围绕X 轴、Y 轴和 Z 轴的旋转。这由 AR 定向跟踪配置会话配置类型支持。
             
             ARWorldTrackingConfiguration，用于六个自由度跟踪, 简称 6DOF。
             6DOF 跟踪Pitch、Roll和 Yaw,类似于 3DOF。它还使用 Sway、Heave 和 Surge 组件跟踪 3D 空间中的设备移动。这些新组件表示与 X 轴、Y 轴和 Z 轴平行的移动。这由 ARWorldTrack 配置会话配置类型支持。
             
             */
            ILog.debug(tag: #file, content: "*** ARConfig: AR World Tracking Not Supported")
            return
        }
        
        // 首先,创建一个 ARWorldTrackingConfiguration配置实例, 该实例已分配给config。
        let config = ARWorldTrackingConfiguration()
        
        /*
         设置worldAlignment属性,用于指定虚拟内容与真实世界的关系。这里有三个选项:
          a) gravity: 这将设置虚拟内容坐标系的 Y 轴,与地球引力平行。这可确保 Y 轴始终在实际空间中向上指向。它还使用设备的初始位置作为坐标系源,称为世界原点。这是 AR 会话开始时设备在真实世界中的位置。
          b) gravityAndHeading：这还会设置虚拟内容坐标系的 Y 轴,与重力平行。它还定向 X 轴,使其从西向东运行,并且 Z 轴,以便从北到南运行:
          最后,它还使用设备的初始位置作为世界起源。例如,你可以使用它将用户指向真实世界的指南针方向。
          c)camera：这将使用设备方向和 3D 空间中的位置作为世界原点。例如,用户可以在启动 AR 会话之前将其设备放在墙上。
         */
        config.worldAlignment = .gravity
        
        // 通过将providesAudioData设置为false来禁用该功能。此属性允许 AR 会话捕获音频。
        config.providesAudioData = false
        
        config.planeDetection = .horizontal
        
        arSCNView.session.run(config)
    }
    
    func setupRecognizers() {
       
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapFrom(recognizer:) ))
        tapGestureRecognizer.numberOfTapsRequired = 1
        arSCNView.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func handleTapFrom(recognizer: UITapGestureRecognizer) {
        // 获取屏幕空间坐标并传递给 ARSCNView 实例的 hitTest 方法
        let tapPoint = recognizer.location(in: arSCNView)
        //        let result = arSceneView.hitTest(tapPoint, types: .existingPlaneUsingExtent)


        if let query = arSCNView.raycastQuery(from: tapPoint, allowing: ARRaycastQuery.Target.estimatedPlane, alignment: .any) {

            // 如果射线与某个平面几何体相交，就会返回该平面，以离摄像头的距离升序排序
            // 如果命中多次，用距离最近的平面

            let results = arSCNView.session.raycast(query)
            
            ILog.debug(tag: #file, content: "??? results \(results.count)")
            
            if let hitResult = results.first {
                
                ILog.debug(tag: #file, content: "hit at \(hitResult.worldTransform.columns.3.x) \(hitResult.worldTransform.columns.3.y) \(hitResult.worldTransform.columns.3.z) \(hitResult.description)")
                
                if catchAble {
                    
                    ILog.debug(tag: #file, content: "catch!!!!")
                    catchAble = false
                }
            }
        }
    }
    
    func downloadSceneTask() {
        
        ILog.debug(tag: #file, content: "downloadSceneTask")
            
        guard let url = URL(
//            string: "https://dl.dropboxusercontent.com/scl/fi/42hd8vvinhzre0tkzuhk5/Gunk_3.glb?rlkey=olecrk6op6y8nbkn9hgb8icvp&dl=0"
            string: "https://dl.dropboxusercontent.com/scl/fi/626zoh4xdk6ve25u1f1eg/lunaguin_f_ex.glb?rlkey=fh40f4l50oododsbyjfwrywa8&dl=0"
        )
        else {
            return
            
        }
    
        //2. Create The Download Session
        let downloadSession = URLSession(configuration: URLSession.shared.configuration, delegate: self, delegateQueue: nil)
        
        //3. Create The Download Task & Run It
        let downloadTask = downloadSession.downloadTask(with: url) { fileURL, response, error in
            
            if let error = error {
                
                ILog.debug(tag: #file, content: "error \(error)")
               
            }
            else {
                
                ILog.debug(tag: #file, content: "Our local URL = \(fileURL?.absoluteString ?? "")")
                
                
                //1. Create The Filename
                let myFileUrl = self.getDocumentsDirectory().appendingPathComponent("temp.glb")
                
                //2. Copy It To The Documents Directory
                do {
                    try FileManager.default.copyItem(at: fileURL!, to: myFileUrl)
                    
                    ILog.debug(tag: #file, content: "Successfuly Saved File \(myFileUrl)")
                    
                    ThreadUtility.startUIThread {
                        //3. Load The Model
//                        self.loadModel()
                        self.modelReady = true
                    }
                   
                    
                }
                catch {
                    
                    ThreadUtility.startUIThread {
                        //3. Load The Model
                        ILog.debug(tag: #file, content: "Error Saving: \(error)")
                        
//                        self.loadModel()
                        self.modelReady = true
                    }
                }
            }
        }
        
        downloadTask.resume()
        
        ILog.debug(tag: #file, content: "run download")
    }
    
    func getDocumentsDirectory() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
        
    }
    
    func loadModel() {
        
        ILog.debug(tag: #file, content: "loadModel")
        
        // Get The Path Of The Downloaded File
        let downloadedScenePath = getDocumentsDirectory().appendingPathComponent("temp.glb")
        
        do {
            let sceneSource = GLTFSceneSource(url: downloadedScenePath)
            let scene: SCNScene = try sceneSource.scene()
            
            if !scene.rootNode.childNodes.isEmpty {
                
                ILog.debug(tag: #file, content: "scene.rootNode.childNodes.first!.scale ?? \(scene.rootNode.childNodes.first!.scale)")
                
                scene.rootNode.childNodes.first!.position = SCNVector3Make(0.0, 0.0, -1.0)
                scene.rootNode.childNodes.first!.scale = SCNVector3(x: 0.1, y: 0.1, z: 0.1)
                
                ILog.debug(tag: #file, content: "scene.rootNode.childNodes.first!.scale ?? \(scene.rootNode.childNodes.first!.scale)")
            }
            
            self.arSCNView.scene.rootNode.addChildNode(scene.rootNode)
            
        }
        catch {
            
            ILog.debug(tag: #file, content: error.localizedDescription)
            return
        }
    }
    
    
    // MARK: - Functions for standard AR view handling
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupARSession()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        arSCNView.session.pause()
    }

}

extension ARKitSceneKitDemoViewController: ARSCNViewDelegate {
    
    /**
     有新的 node 被映射到给定的 anchor 时调用。
     
     @param renderer 将会用于渲染 scene 的 renderer。
     @param node 映射到 anchor 的 node。
     @param anchor 新添加的 anchor。
     
     每次 ARKit 自认为检测到了平面时都会调用此方法。其中有两个信息，node 和 anchor。SCNNode 实例是 ARKit 创建的 SceneKit node，它设置了一些属性如 orientation（方向）和 position（位置），然后还有一个 anchor 实例，包含此锚点的更多信息，例如尺寸和平面的中心点。
     
     anchor 实例实际上是 ARPlaneAnchor 类型，从中我们可以得到平面的 extent（范围）和 center（中心点）信息。
     */
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        //        ILog.debug(tag: #file, content: "renderer didAdd")
        
        // 自定义绘制平面
        guard anchor is ARPlaneAnchor else {
            return
        }

        if modelReady {
            
            // Get The Path Of The Downloaded File
            let downloadedScenePath = getDocumentsDirectory().appendingPathComponent("temp.glb")
            
            do {
                let sceneSource = GLTFSceneSource(url: downloadedScenePath)
                let scene: SCNScene = try sceneSource.scene()
                
                if !scene.rootNode.childNodes.isEmpty {
                    
                    ILog.debug(tag: #file, content: "scene.rootNode.childNodes.first!.scale ?? \(scene.rootNode.childNodes.first!.scale)")
                    
                    scene.rootNode.childNodes.first!.position = SCNVector3Make(0.0, 0.0, 0.0)
//                    scene.rootNode.childNodes.first!.scale = SCNVector3(x: 0.1, y: 0.1, z: 0.1)
                }
                
//                self.arSCNView.scene.rootNode.addChildNode(scene.rootNode)
                
                node.addChildNode(scene.rootNode)
                
                modelReady = false
                catchAble = true
                
                let fileManager = FileManager.default

                do {
                    try fileManager.removeItem(at: downloadedScenePath)

                    ILog.debug(tag: #file, content: "delete file success")
                }
                catch {
                    ILog.debug(tag: #file, content: "delete file error")
                }
            }
            catch {
                
                ILog.debug(tag: #file, content: error.localizedDescription)
                return
            }
            
        }
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        //        ILog.debug(tag: #file, content: "renderer didUpdate")
        
        // 查看此平面当前是否正在渲染
//        guard let plane = planes[anchor.identifier] else {
//            return
//        }
//
//        // anchor 更新后也需要更新 3D 几何体。例如平面检测的高度和宽度可能会改变，所以需要更新 SceneKit 几何体以匹配
//        plane.update(anchor: anchor as! ARPlaneAnchor)
    }
    
    /**
     从 scene graph 中移除与给定 anchor 映射的 node 时调用。
     
     @param renderer 将会用于渲染 scene 的 renderer。
     @param node 被移除的 node。
     @param anchor 被移除的 anchor。
     */
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        // 如果多个独立平面被发现共属某个大平面，此时会合并它们，并移除这些 node
//        planes.removeValue(forKey: anchor.identifier)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        
        //        ILog.debug(tag: #file, content: "renderer updateAtTime")
        
//        ThreadUtility.startUIThread {
//            self.viewModel?.trackingState = self.trackingStatus
//        }
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
//        trackingStatus = "AR Session Was Interrupted!"
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
//        trackingStatus = "AR Session Interruption Ended"
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
//        trackingStatus = "AR Session Failure: \(error)"
    }
    
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        
//        switch camera.trackingState {
//            // 1
//        case .notAvailable:
//            trackingStatus = "Tacking: Not available!"
//            // 2
//        case .normal:
//            trackingStatus = "Tracking: All Good!"
//            // 3
//        case .limited(let reason):
//            
//            switch reason {
//            case .excessiveMotion:
//                trackingStatus = "Tracking: Limited due to excessive motion!"
//                // 3.1
//            case .insufficientFeatures:
//                trackingStatus = "Tracking: Limited due to insufficient features!"
//                // 3.2
//            case .initializing:
//                trackingStatus = "Tracking: Initializing..."
//                // 3.3
//            case .relocalizing:
//                trackingStatus = "Tracking: Relocalizing..."
//            @unknown default:
//                trackingStatus = "Unknow..."
//            }
//        }
//        
//        ILog.debug(tag: #file, content: "session ???? \(trackingStatus)")
    }
    
}
