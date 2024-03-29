
# Pacotes utilizados

library(cepespR)
library(knitr)
library(plyr)
library(tidyverse)
library(shiny)
library(shinyBS)
library(magrittr)
library(shinydashboard)
library(shinyWidgets)
library(DT)
library(shinyjs)
library(shinydashboardPlus)
library(rintrojs)
library(jsonlite)
library(shinybusy)


# Objetivo
#'        - Carregar os arquivos usados no app;
#'        - Rodar o app.
#'        


# 1. Data -----------------------------------------------------------------

## Cria uma lista com os nomes dos arquivos a serem carregados

files <- list.files(file.path(getwd(),"/data/output"), 
                    pattern = ".rds")

## Carrega os arquivos com os indicadores pré-calculados

for(i in files){
  df <- readRDS(paste0("data/output/",i))
  df <- df[,1:length(df)]
  assign(paste(substr(i,1,nchar(i)-4)), df)
  
}

## Remove os arquivos desnecessários

rm(df,i,files)

