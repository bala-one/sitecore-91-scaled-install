# Sitecore 9.1 Scaled Install

The default sitecore installation is organized for a scaled install with helper scripts. The folders are organised with a number prefix to help install in a sequence.

Please follow those instructions, Every folder has the readme.txt file with the required steps. 
License file needs to be placed in the 2Install folder root.

## 0Prequisite
* It will prepare the windows server with IIS and required dependencies install.
* Certificates generation and Install.

## 1SOLR
* Install the Solr
* Create the required cores

## 2Install
* Update the global.ps1 with the prefix and passwords
### 0.Identity
* Identity server Install
### 1.xConnect
* All the Xconnect services will be installed
### 2.Processing and Reporting
* Install the processing and reporting service
### 3.CM
* Install content management
### 4.CD
* Install content delivery

## 3Modules
* Powershell extentsions install

## SIFLess_Dev_Only
* Dev only install

Hope this is helpfull.
