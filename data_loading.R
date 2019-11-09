#Load needed packages
require(rvest)
require(stringr)
require(tidyverse)
require(purrr)
require(here)
require(DT)
# URL for SLMPD data
base_url <- "http://slmpd.org/Crimereports.shtml"
webpage <- read_html(base_url)

scrapeJSSite <- function(){
  
  ## change Phantom.js scrape file
  url <- paste0("http://slmpd.org/CrimeReport.aspx")
  lines <- readLines("scrape.js")
  lines[1] <- paste0("var url ='", url ,"';")
  writeLines(lines, "scrape.js")
  
  ## Download website
  system("phantomjs.exe scrape.js")
}