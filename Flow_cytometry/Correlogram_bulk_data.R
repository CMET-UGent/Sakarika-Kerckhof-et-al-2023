################################################################################
####                     Correlogram_bulk_data.R                            ####
################################################################################
# Author: Myrsini Sakarika                                                     #
# Purpose: example script to create the correlograms in Sakarika, Kerckhof et  #
# al. (2023)                                                                   #
################################################################################

#### Load required packages ----------------------------------------------------

library(ggplot2)
library(corrplot)
library(tidyverse)

#### Load data with correct format ---------------------------------------------
data3 <- read.csv("C.necator_bulk_data.csv", header = TRUE, sep = ",")
datacnec <- data3[, -c(1:3)]

#### Calculate correlations and statistical testing ----------------------------
data.cor1 <- cor(datacnec, method = "spearman")
# Spearman because we do not know if the relationship is linear

testRes <- cor.mtest(data.cor1, conf.level = 0.95)
testRes <- as.data.frame(as.table(testRes$p))
testRes[["p.val_symbol"]] <-
  c(ifelse(testRes$Freq < 0.05 & testRes$Freq != 0, "*", ""))
testRes <- as.data.frame(testRes)
testRes <- rename(testRes, p.val = Freq)

#### Data wrangling for the plotting -------------------------------------------
data.cor1 <- as.data.frame(as.table(data.cor1))
p.val<-testRes$p.val
p.val_symbol<-testRes$p.val_symbol
data.cor1 = cbind(data.cor1, p.val, p.val_symbol)

# select specific variables for Var1
data.cor1 <- data.cor1 %>%
  filter(Var1 %in% c("Protein_content","PHA.Neutral_lipid_intensity", 
                     "Growth_rate","Cell_diameter", "Nucleic_acid_intensity",
                     "Carbohydrate_content")) 
# select specific variables for Var2
data.cor1 <- data.cor1 %>%
  filter(Var2 %in% c("COD_concentration", "Ammonium_concentration", 
                     "Cell_diameter", "Growth_rate")) 

# arrange the data for plotting
data.cor1<-data.cor1%>%
  mutate(Var1=factor(Var1, levels=c("PHA.Neutral_lipid_intensity", 
                                    "Carbohydrate_content", "Protein_content", 
                                    "Nucleic_acid_intensity","Cell_diameter",
                                    "Growth_rate"))) %>%
  mutate(Var2=factor(Var2, levels=c("COD_concentration",
                                    "Ammonium_concentration", "Growth_rate", 
                                    "Cell_diameter"))) 

#### Actual plotting -----------------------------------------------------------
CNECplot <- ggplot(data.cor1, aes(x = Var2, y = Var1)) +
  geom_tile(color = "grey", fill = "grey") +
  geom_point(data = subset(data.cor1, Freq < 1), 
             aes(color = Freq, size = abs(Freq))) +
  geom_text(
    aes(label = p.val_symbol),
    size = 8,
    vjust = 0.7,
    hjust = 0.5
  ) +
  scale_color_gradient2(
    low = "#C00000",
    mid = "white",
    midpoint = 0,
    high = "#45AD94",
    limits = c(-1, 1),
    breaks = c(-0.8, -0.4, 0, 0.4, 0.8),
    name = "Strength and direction\nof correlation"
  ) +
  scale_size_continuous(
    range = c(5, 15),
    name = "Strength of correlation",
    limits = c(0, 1),
    breaks = c(0, 0.4, 0.8)
  ) +
  scale_x_discrete(
    labels = c(
      "COD_concentration" = "Carbon concentration",
      "Ammonium_concentration" = "Nitrogen concentration",
      "Growth_rate" = "Growth rate",
      "Cell_diameter" = "Cell size"
    )
  ) +
  scale_y_discrete(
    labels = c(
      "Protein_content" = "Protein content",
      "PHA.Neutral_lipid_intensity" = "PHA and neutral lipid content" ,
      "Nucleic_acid_intensity" = "Nucleic acid content",
      "Growth_rate" = "Growth rate",
      "Cell_diameter" = "Cell size",
      "Carbohydrate_content" = "Carbohydrate content"
    )
  ) +
  ggtitle("Cupriavidus necator") +
  theme_bw()

CNECplot <-
  CNECplot + theme(axis.text.x = element_text(
    colour = "black",
    size = 11,
    angle = 45,
    hjust = 1
  )) +
  theme(axis.text.y = element_text(colour = "black", size = 11)) +
  theme(axis.title.x = element_blank()) +
  theme(axis.title.y = element_blank()) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold.italic")) +
  guides(color = guide_colorbar(order = 1), size = guide_legend(order = 2))

CNECplot

tiff("correlation_bulk_C.necator.tiff", width = 6, height = 5.5, units = 'in', 
     res = 600, compression = 'lzw')
CNECplot
dev.off()
