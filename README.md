# Sakarika-Kerckhof-et-al-2023
Accompanying code to Sakarika, Kerckhof et al. 2023 - "Growth rate and limiting 
 substrate define the nutritional composition and cell size of microbial biomass 
 for food applications " (in prep).
 
Unless otherwise stated, most code is provided in the R language and most 
coherent scripts are grouped into [R markdown](https://rmarkdown.rstudio.com/) 
files (`*.Rmd`), in order to allow for reproducible data science.

## Folder/script structure

Script | Language | Purpose
-------|----------|----------
Proteomics/GO_mapping_for_visualization.Rmd | R (markdown) | simplification of GO results into data frame for simplified visualization using the QuickGO REST API
Flow_cytometry/Gating_and_preprocessing_FCM | R (markdown) | data extraction and gating script from raw flow cytometry standard (FCS) files
Proteomics/Retrieve-GO-terms.ipynb | Python (iPython notebook) | Retrieve and organize GO id's from protein info

## Dependencies and references
