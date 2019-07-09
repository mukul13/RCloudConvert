# RCloudConvert
[![Travis-CI Build Status](https://travis-ci.org/mukul13/RCloudConvert.svg?branch=master)](https://travis-ci.org/mukul13/RCloudConvert)

R package to convert file format using Cloud Convert API 

## Installation

To install RCloudConvert package
```R
#install.packages('devtools')
library(devtools)
install_github("mukul13/RCloudConvert")
```
To get Cloud Convert API key, you have to sign up [here](https://cloudconvert.com/)

## Examples

```R
library(RCloudConvert)
api_key="YOUR API KEY"

###to upload local file
convert_file(api_key,input_format = "input file format",output_format = "output file format",input="upload",file="path/to/file/filename.extension",dest_file = "path/to/file/output_filename.extension")

###to convert file using url
convert_file(api_key,input_format = "input file format",output_format = "output file format",input="download",file="url",dest_file = "path/to/file/output_filename.extension")

###to convert file using amazon s3
convert_file(api_key,input_format = "input file format",output_format = "output file format",input="s3",file="path/to/file/filename.extension",dest_file = "path/to/file/output_filename.extension",input_s3_accesskeyid = "s3 accesskeyid",input_s3_secretaccesskey = "s3 secretaccesskey",input_s3_bucket = "s3 bucket")

###to convert file using ftp
convert_file(api_key,input_format = "input file format",output_format = "output file format",input="ftp",file="path/to/file/filename.extension",dest_file = "path/to/file/output_filename.extension",input_ftp_host = "ftp host",input_ftp_port = "ftp port",input_ftp_user = "username",input_ftp_password = "password")
```

## Resources
* [API Documentation](https://cloudconvert.com/apidoc)
* [Conversion Types](https://cloudconvert.com/apidoc#types)
* [CloudConvert Blog](https://cloudconvert.com/blog/)

### Note

There is a daily limit of 25 conversion minutes. To extend this limit, you can buy prepaid packages.
