#' @import RCurl
library(RCurl)

#' To convert file to other format
#'
#' @param api_key CloudConvert API key
#' @param input_format The format of the input file
#' @param output_format The format the file should be converted to
#' @param input Set the method of uploading the input file
#' @param file Input file destination (including the name of file with extension)
#' @param dest_file Name where the downloaded file is saved (including the name of file with extension)
#' @param input_s3_accesskeyid The Amazon S3 accessKeyId (Required when input is s3)
#' @param input_s3_secretaccesskey The Amazon S3 secretAccessKey (Required when input is s3)
#' @param input_s3_bucket The Amazon S3 bucket where to download the input file or upload the output file (Required when input is s3)
#' @param input_ftp_host The FTP server host (Required when input is ftp)
#' @param input_ftp_port The port the FTP server is bind to (Required when input is ftp)
#' @param input_ftp_user FTP username (Required when input is ftp)
#' @param input_ftp_password FTP password (Required when input is ftp)
#' @export
#' @examples
#' convert_file(api_key=api_key,input_format = "jpg",output_format = "pdf",input="upload",file="input file location",dest_file = "destination file location")


convert_file=function(api_key,input_format,output_format,input,file,dest_file,
                      input_s3_accesskeyid="",input_s3_secretaccesskey="",
                      input_s3_bucket="",
                      input_ftp_host="",input_ftp_port="",
                      input_ftp_user="",input_ftp_password="")
{
  uri=""
  result=NULL
  
  
  ### upload option 
  if(input=="upload")
  {
    uri=paste("https://api.cloudconvert.com/convert?apikey=",api_key,"&input=",input,"&inputformat=",input_format,
            "&outputformat=",output_format,"&download=true",sep="")

    result = postForm(uri, file = fileUpload(filename = file),
                     .opts = list(ssl.verifypeer = FALSE))
    result=result[1]
    result=substr(result,27,nchar(result))
  }
  
  
  ### download option
  if(input=="download")
  {
    uri=paste("https://api.cloudconvert.com/convert?apikey=",api_key,"&input=",input,"&inputformat=",input_format,
              "&outputformat=",output_format,"&download=true&file=",file,sep="")
    result=getURL(uri)
    result=result[1]
    result=substr(result,27,nchar(result))
  }
  
  ### s3 option
  if(input== "s3")
  {
    uri=paste("https://api.cloudconvert.com/convert?apikey=",api_key,"&input=",input,"&inputformat=",input_format,
              "&outputformat=",output_format,"&download=true&file=",file,
              "&input[s3][secretaccesskey]=",input_s3_secretaccesskey,
              "&input[s3][accesskeyid]=",input_s3_accesskeyid,
              "&input[s3][bucket]=",input_s3_bucket,sep="")
    
    result=getURL(uri)
    result=result[1]
    result=substr(result,27,nchar(result))
  }
  
  ### ftp option

  if(input== "ftp")
  {
    uri=paste("https://api.cloudconvert.com/convert?apikey=",api_key,"&input=",input,"&inputformat=",input_format,
              "&outputformat=",output_format,"&download=true&file=",file,
              "&input[ftp][host]=",input_ftp_host,
              "&input[ftp][port]=",input_ftp_port,
              "&input[ftp][user]=",input_ftp_user,
              "&input[ftp][password]=",input_ftp_password,sep="")
    
    result=getURL(uri)
    result=result[1]
    result=substr(result,27,nchar(result))
  }
  
  download.file(url=result,destfile = dest_file,mode="wb")
}
