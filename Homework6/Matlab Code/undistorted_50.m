%Compensate Pic1
image1 = imread('IMG_5102.JPG');
pic1 = undistortImage(image1,cameraParams);
figure(1);
imshow(pic1,'border','tight')

%Compensate Pic2
image2 = imread('IMG_5103.JPG');
pic2 = undistortImage(image2,cameraParams);
figure(2);
imshow(pic2,'border','tight')

%Compensate Pic3
image4 = imread('IMG_5104.JPG');
pic4 = undistortImage(image4,cameraParams);
figure(3);
imshow(pic4,'border','tight')

%Compensate Pic4
image5 = imread('IMG_5105.JPG');
pic5 = undistortImage(image5,cameraParams);
figure(4);
imshow(pic2,'border','tight')

%Compensate Pic5
image6 = imread('IMG_5106.JPG');
pic6 = undistortImage(image6,cameraParams);
figure(5);
imshow(pic6,'border','tight')

%Compensate Pic6
image7 = imread('IMG_5107.JPG');
pic7 = undistortImage(image7,cameraParams);
figure(6);
imshow(pic7,'border','tight')