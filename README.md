# Project Title

Outcome Prediction from CTA in Acute Ischemic Stroke

# Team members

Keano Zamora\
Joshua Young\
Kaisha Maimaitiyimingjiang

## Getting Started

These introduction will give you a idea how to run it your local machine to generate the prediction model that we have.

### Prerequisites

Matlab\
Jupyter notebook\
Stroke Patient CTP DICOM image files


## preProcessCTP2.m and preProcessCTP_test2.m

Provided by Professor Fabien Scalzo, which is used to read CTP DICOM image files of an
acquisition and re-order them with respect to slice location and time, and rescale
the image intensity.

Run with Matlab by following command: 
```
[img, meta] = preProcessCTP(imagePath, options)
```
**Input**:\
imagePath: path to input images CTP, DICOM format\
options: ".dcm"

**Output**:\
img: 4D Array of the image (row,column,height,time) \
meta: struct value in Matlab with <time> Acquisition time of each slice and <location> Position of each slice along the Z-axis

## scikit_resize .ipynb

Resize 4D Array of the image that were generated by the **preProcessCTP2.m** with scikit image spatially in format of 128x128x20; x,y,z (slices) 

**Input**:\
.mat format img 4D Array of the image files that  were generated by the **preProcessCTP2.m**

**Output**:\
.mat format img in format of 128x128x20

## resampleCTP.m and resampleCTP_test.m
Provided by Professor Fabien Scalzo, which is used to resize & interpolate files by modifying their time dimension into 60 time points. 

Run with Matlab by following command: 
```
resampledImg = resampleCTP(img, meta, options)
```
**Input**:\
img: Input image CTP; 4D. \
meta: DICOM Tags for CTP image (time is required, which generate by preProcessCTP2 \
options: ".mat"

**Output**:\
resampledImg:  4D array (3D + time) in size of 128x128x20x60

## Acknowledgments

Thanks to Professor Fabien Scalzo at University of California, Los Angeles for providing training data and giving support as well as the project idea.
