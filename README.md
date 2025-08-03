# Gut Microbiome ML Classifier for Colorectal Cancer

This project builds a machine learning model to classify colorectal cancer (CRC) status using gut microbiome profiles. The data is derived from the **FengQ_2015** cohort (via `curatedMetagenomicData`), and includes bacterial taxonomic abundances and clinical metadata. A Random Forest model was trained to distinguish healthy individuals from CRC patients based on gut microbiome composition.

---

## 📁 Project Structure

```
├── data
│ ├── counts.csv                  # CLR-transformed or raw count matrix
  └── metadata.csv                # Sample metadata including study_condition
├── gut_microbiome_ML.Rproj        # RStudio project file
├── notebooks
  ├── gut_CRC_ml.Rmd             # Main analysis notebook
  └── gut_CRC_ml.html            # Rendered HTML output
├── results
  └── figures
      ├── feature_importance.png # Top taxa by RF importance
      ├── initial_roc.png        # ROC curve before tuning
      └── tuned_roc.png          # ROC curve after tuning
└── scripts
    └── data_preprocess.R          # Raw data wrangling from curatedMetagenomicData
```

---

## 🚀 Overview

- **Study:** FengQ_2015 (
- **Samples:** Healthy, Adenoma and CRC subjects
- **Goal:** Predict disease status from gut microbiome profiles
- **Approach:**
  - Preprocess raw taxonomic counts (CLR transformation)
  - Remove adenoma samples
  - Train/test split
  - Random Forest classifier with ROC evaluation
  - Feature importance interpretation

---

## 📊 Key Results

- **Initial AUC:** 0.796  
- **Tuned AUC:** 0.815  
- **Top Predictive Taxa:**  
  - *Blautia obeum*  
  - *Ruminococcus gnavus*   
  - Others from UniRef annotations

---

---

## 📌 Reproducibility

Run the full workflow using the R Markdown notebook:

```
notebooks/gut_CRC_ml.Rmd
```

All plots and model results are saved in the `results/figures/` directory.

---

## 🧠 Author

Mohit Batra.