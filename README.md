# Project Title

Outcome Prediction from CTA in Acute Ischemic Stroke

# Team members

*Keano Zamora
*Joshua Young
*Kaisha Maimaitiyimingjiang

## Getting Started

These introduction will give you a idea how to run it your local machine to generate the prediction model that we have.

### Prerequisites

*Matlab
*Jupyter notebook
*Stroke Patient CTP DICOM image files 


## preProcessCTP2.m and preProcessCTP_test2.m

Provided by Professor Fabien Scalzo, which is used to read CTP DICOM image files of an
acquisition and re-order them with respect to slice location and time, and rescale
the image intensity.

Run on with Matlab by following command: 
```
"[img, meta] = preProcessCTP(imagePath, options)"
```
*Input:
imagePath: path to input images CTP, DICOM format
options: ".dcm"

*Output:
img: 4D Array of the image (row,column,height,time) 
meta: struct value in Matlab with <time> Acquisition time of each slice and <location> Position
       of each slice along the Z-axis

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

Thanks to Professor Fabien Scalzo at University of California, Los Angeles for providing training data and giving support as well as the project idea.
