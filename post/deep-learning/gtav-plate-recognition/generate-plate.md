# GTA Online Vehicle Plate Recognition -- Generating Plate as Training Data

So this post is about how I generate the plate number for training recognition model.
All of these serial of posts are aimed at recognition for vehicle plate in GTA Online.
The first step is generating training data. The following post will be introduce about 
"How to generate plate".

## Real Instances

This section I will show you some of the real instances for plate in the GTA Online.
![](/res/img/64BDL132.131473222390000000.jpg)
![](/res/img/65MZH676.131473222810000000.jpg)  
![](/res/img/66SJD585.131473174110000000.jpg)  

Those cars' plate include 8 digits or letters.
However if we looking at the site [Vehicle Features/Custom Vehicle License Plates](http://gta.wikia.com/wiki/Vehicle_Features/Custom_Vehicle_License_Plates),
the length of plate of vehicle might be less then 8.
So there will be 37 characters, including 10 digits, 26 upper letters, and space.
The space will fill up to 8 locations.

There are also 5 kinds of plate.  
![](/res/img/plate01.jpg)  
![](/res/img/plate02.jpg)  
![](/res/img/plate03.jpg)  
![](/res/img/plate04.jpg)  
![](/res/img/plate05.jpg)

So the full permutation of the plate number will have 3512479453921.
The idea for recognition will be "recognizing key points" -> "recognizing characters".

## Split Characters from Texture

The texture of figure will be  
![](/res/img/vehicle_generic_plate_font.jpg)

I transgform the texture from `256 x 96` to `448 x 168`, so that the characters will match to plate image.
Then I write the script (in Haskell) to split these characters into the single file.
To script can be found at (TODO).
And the following will be some of the example of results.  
![](/res/img/A.bmp)  
![](/res/img/1.bmp)  
![](/res/img/%20.bmp)

## Combine Plates

So let's see the combined plate frist.
The aimed plate will be  
![](/res/img/07UMT674.131473182860000000.jpg)  
And the combined plate will be  
![](/res/img/test.bmp)

The steps for "combining" include combining the characters, create the masks, and applying the mask to plate.
And the script can be found at (TODO).

The first step is combining.
The characters will fill the plate in order.
The locations to put the character is `49 x 18`. The images will be copied to a black blackground images.
That will be a mask, and if we want blue characters, the red and green channels will be subtracted by the mask.
If we want yellow characters, the blue channels will be subtracted by the mask.


## Transform Images

Next step is transform the plate via Perspective Transform, because the plates might be saw at different angle.
The following image is an example.  
![](/res/img/pttest.bmp)

After the transforming, the final step is combining the background and the plate.
The following image is an example.  
![](/res/img/wbgtest.bmp)


