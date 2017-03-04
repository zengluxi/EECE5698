%Compensate Pic1
image1 = imread('IMG_5049.JPG');
pic1 = undistortImage(image1,cameraParams);
figure(1);
imshow(pic1,'border','tight')

%Compensate Pic2
image2 = imread('IMG_5050.JPG');
pic2 = undistortImage(image2,cameraParams);
figure(2);
imshow(pic2,'border','tight')

%Compensate Pic4
image4 = imread('IMG_5051.JPG');
pic4 = undistortImage(image4,cameraParams);
figure(4);
imshow(pic4,'border','tight')

%Compensate Pic5
image5 = imread('IMG_5052.JPG');
pic5 = undistortImage(image5,cameraParams);
figure(5);
imshow(pic2,'border','tight')

%Compensate Pic6
image6 = imread('IMG_5053.JPG');
pic6 = undistortImage(image6,cameraParams);
figure(6);
imshow(pic6,'border','tight')

%Compensate Pic7
image7 = imread('IMG_5054.JPG');
pic7 = undistortImage(image7,cameraParams);
figure(7);
imshow(pic7,'border','tight')

%Compensate Pic8
image8 = imread('IMG_5055.JPG');
pic8 = undistortImage(image8,cameraParams);
figure(8);
imshow(pic8,'border','tight')

%Compensate Pic9
image9 = imread('IMG_5056.JPG');
pic9 = undistortImage(image9,cameraParams);
figure(9);
imshow(pic9,'border','tight')
