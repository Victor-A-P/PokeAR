# PokeARInfo

###

![icon of the app](AppIcon.png)

### Origin of the Idea

PokeAR it is an app that I made  as part of a course, the concept was so cool that and I liked the idea so much that I expanded it by adding more models to visualize in AR. The app connects to ARKit and SceneKit to recognize a specific image (marker) and, once that surface is detected, display the corresponding model. The interface is built with Storyboard, and the lifecycle is handled by AppDelegate. There’s currently no persistent storage, focusing on a reliable, instant experience.

![markers](markers.png)

### Technologies
 • Platform: iOS

 • Language & UI: Swift, UIKit/Storyboard

 • Integrations: ARKit (image tracking), SceneKit (3D rendering)

 • State & sync: Lifecycle with AppDelegate

### Purpose

PokeAR helps users visualize 3D models linked to a specific image in the real world, simplifying AR demos based on recognition and offering a clear experience for learning and showcasing.



### App Structure

#### Image recognition and AR display

The camera detects the marker (reference image). Once recognized and surface validated, the app places the corresponding 3D model in SceneKit, maintaining tracking with ARKit for stable visualization.
|![model1](nidoking.png)|![model2](nidorina.png)|![model3](persian.png)|![model4](pidgeot.png)|
|:------------------:|:--------------------:|:--------------------:|:--------------------:|

#### Catalog and model selection

From the main view, you can choose among different markers move or hold to wherever you want and then app associates each model to its required image.

![model hold in my hand](nidoran.png)

It is capable of recognaze up to 2 continuos image and display each with the corresponding model

![both models in screen](bothModels.png)


> CAUTION:
>
> I do not posses rights of any of the models or the images for the markers,credits to the respective owners, if is needed I am willing to take down this landing page just contac me first, or give you credit for any of the model that it is used 
