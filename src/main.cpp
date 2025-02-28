#include <iostream>
#include <opencv2/opencv.hpp>
#include <opencv2/highgui/highgui.hpp>

int main() {
    std::cout << "OpenCV Hello World!" << std::endl;
    std::cout << "OpenCV version: " << CV_VERSION << std::endl;
    
    // Create a simple image
    cv::Mat image(400, 600, CV_8UC3, cv::Scalar(0, 0, 0));
    
    // Draw some text and shapes
    cv::putText(image, "Hello, OpenCV!", cv::Point(50, 50), 
                cv::FONT_HERSHEY_SIMPLEX, 1.0, cv::Scalar(0, 255, 0), 2);
    
    cv::circle(image, cv::Point(300, 200), 100, cv::Scalar(0, 0, 255), -1);
    cv::rectangle(image, cv::Point(100, 100), cv::Point(200, 300), 
                 cv::Scalar(255, 0, 0), 3);
    
    // Display the image
    cv::namedWindow("OpenCV Hello World", cv::WINDOW_AUTOSIZE);
    cv::imshow("OpenCV Hello World", image);
    cv::waitKey(0);
    
    return 0;
}
