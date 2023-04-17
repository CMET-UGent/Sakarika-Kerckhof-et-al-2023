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

### Source data

The mass spectrometry data and flow cytometry data have been published in dedicated repositories:
- Proteomics data can be found at: 
- Flow cytometry data can be found at the FlowRepository with identifier FR-FCM-Z6Y6 - until publication of the manuscript this identifier is under embargo, but anonymous reviewer access can be provided

### R packages

- [tidyverse](https://www.tidyverse.org/):
Wickham H, Averick M, Bryan J, Chang W, McGowan LD, François R, Grolemund G, Hayes A, Henry L,
  Hester J, Kuhn M, Pedersen TL, Miller E, Bache SM, Müller K, Ooms J, Robinson D, Seidel DP,
  Spinu V, Takahashi K, Vaughan D, Wilke C, Woo K, Yutani H (2019). “Welcome to the tidyverse.”
  _Journal of Open Source Software_, *4*(43), 1686. doi:10.21105/joss.01686
  <https://doi.org/10.21105/joss.01686>.

- [httr](https://httr.r-lib.org/)
- [xml2](https://xml2.r-lib.org/)
- [jsonlite](https://github.com/jeroen/jsonlite)
- [topGO](https://bioconductor.org/packages/release/bioc/html/topGO.html)
- [openxlsx](https://ycphs.github.io/openxlsx/)
- [flowWorkspace](https://www.bioconductor.org/packages/release/bioc/html/flowWorkspace.html)
- [flowCore](https://www.bioconductor.org/packages/release/bioc/html/flowCore.html)
- [ggcyto](https://www.bioconductor.org/packages/release/bioc/html/ggcyto.html): Van P, Jiang W, Gottardo R, Finak G (2018). “ggcyto: Next-generation open-source visualization
  software for cytometry.” _Bioinformatics_. <https://doi.org/10.1093/bioinformatics/bty441>.
- [Phenoflow](https://github.com/CMET-UGent/Phenoflow_package): Props R, Monsieurs P, Mysara M, Clement L, Boon N (2016). Measuring the biodiversity of microbial communities by flow cytometry. _Methods in Ecology and Evolution_ 7: 1376-1385. < https://doi.org/10.1111/2041-210X.12607>.
- [flowAI](https://www.bioconductor.org/packages/release/bioc/html/flowAI.html): Monaco G, Chen H, Poidinger M, Chen J, de Magalhaes J, Larbi A (2016). “flowAI: automatic and interactive anomaly discerning tools for flow cytometry data.” _Bioinformatics_, 32(16). 10.1093/bioinformatics/btw191. 

### Python packages

- [pandas](https://pandas.pydata.org/)
