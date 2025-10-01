import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate
{

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        

        sceneView.delegate = self
        
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
      
        let configuration = ARImageTrackingConfiguration()   // Create a session configuration
        //let configuration = ARWorldTrackingConfiguration()   // Create a session configuration
        
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "PokeCards", bundle: Bundle.main)
        {
            configuration.trackingImages = imageToTrack
            //configuration.detectionImages = imageToTrack
            
            configuration.maximumNumberOfTrackedImages = 2
            
            print("images succesfully added")
        }
        
       
       
        sceneView.session.run(configuration)  // Run the view's session
    }
    
    
    func renderer(_ renderer: any SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode?
    {
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor
        {
            let nombreCarta = imageAnchor.referenceImage.name!
            
            print(nombreCarta)
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width,
                                 height: imageAnchor.referenceImage.physicalSize.height)
            plane.firstMaterial?.diffuse.contents = UIColor(white:1.0, alpha: 0.75)
            
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2.0
            
            node.addChildNode(planeNode)
            
            if let nidokingScene = SCNScene(named: "art.scnassets/\(nombreCarta).scn")
            {
                if let pokeNode = nidokingScene.rootNode.childNodes.first
                {
                    pokeNode.eulerAngles.x = .pi / 3.0
                    planeNode.addChildNode(pokeNode)
                }
            }
            
            
           
            
        }
        
        
        return node
    }
    
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()  // Pause the view's session
    }

    
    
    
    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }

    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
 */
}
