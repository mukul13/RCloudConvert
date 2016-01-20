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
#' @export
#' @examples
#' convert_file(api_key=api_key,input_format = "jpg",output_format = "pdf",input="upload",file="input file location",dest_file = "destination file location")


convert_file=function(api_key,input_format,output_format,input,file,dest_file)
{
  uri=paste("https://api.cloudconvert.com/convert?apikey=",api_key,"&input=",input,"&inputformat=",input_format,
            "&outputformat=",output_format,"&download=true",sep="")

  result = postForm(uri, file = fileUpload(filename = file),
                      .opts = list(ssl.verifypeer = FALSE))
  result=result[1]
  result=substr(result,27,nchar(result))

  download.file(url=result,destfile = dest_file,mode="wb")
}


