#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/objdetect/objdetect.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <stdio.h>
#include <unistd.h>

using namespace std;
using namespace cv;

char buf[4096];

extern "C" char* detect_faces(char* input_file, char* output_file, double scale, int minNeighbors);

int main(int argc, char** argv)
{
  if (argc<2) {
    fprintf(stderr, "usage: \n image imageout\n");
    exit(-1);
  }
  printf("%s", detect_faces(argv[1], argc < 3 ? NULL : argv[2], 1.2, 2));
  printf("%s", buf);
  exit(0);
}

char* detect_faces(char* input_file, char* output_file, double scale, int minNeighbors)
{
  CascadeClassifier cascade;
  if (!cascade.load("/Users/tatsuya/tmp/lbpcascade_frontalface.xml")) exit(-2);

  Mat imgbw, image = imread((string)input_file);
  if (image.empty()) exit(-3);

  cvtColor(image, imgbw, CV_BGR2GRAY);
  equalizeHist(imgbw, imgbw);

  vector<Rect> faces;
  cascade.detectMultiScale(imgbw, faces, scale, minNeighbors);

  for(unsigned int i = 0; i < faces.size(); i++) {
    Rect f = faces[i];
    rectangle(image, Point(f.x, f.y), Point(f.x+f.width, f.y+f.height), Scalar(255, 0, 0), 4, 8);
    sprintf(buf + strlen(buf), "%i;%i;%i;%i\n", f.x, f.y, f.width, f.height);
  }

  if (output_file) imwrite((string)output_file, image);
  return buf;
}
