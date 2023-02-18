#include <iostream>
#include <opencv2/core/ocl.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/opencv.hpp>

#include "crow.h"

int main() {
  cv::UMat img, gray;

  imread("static/lena.png", cv::IMREAD_COLOR).copyTo(img);

  cv::cvtColor(img, gray, cv::COLOR_BGR2GRAY);
  cv::GaussianBlur(gray, gray, cv::Size(7, 7), 1.5);
  cv::Canny(gray, gray, 0, 50);

  try {
    cv::imwrite("static/lenaProcessed.png", gray);
  } catch (const cv::Exception& e) {
    fprintf(stderr, "e occured converting to ...: %s\n", e.what());
  }

  crow::SimpleApp app;

  CROW_ROUTE(app, "/")([]() { return "Hello world"; });

  CROW_ROUTE(app, "/<string>")
  ([](std::string name) {
    auto page = crow::mustache::load("index.html");
    crow::mustache::context ctx({{"qweqweqweqwe", name}});
    return page.render(ctx);
  });

  app.port(8080).multithreaded().run();
}