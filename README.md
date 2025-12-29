# Statistical Inference in R  
## Confidence Intervals & Hypothesis Testing

This repository contains an R lab focused on **statistical inference**, including confidence intervals and hypothesis testing for means and proportions using both theoretical assumptions and real data.

## Topics Covered

### 1) Proportion Tests (Normal Approximation)
- Z-test for a single proportion
- Standard error of a proportion
- Manual Z statistic calculation
- Comparison with `prop.test()` (without continuity correction)

### 2) Confidence Intervals for Proportions
- 90%, 96%, 98%, and 99% confidence intervals
- Normal approximation method
- Interpretation of confidence intervals

### 3) Confidence Intervals for Means
- 90% confidence interval using:
  - Normal distribution (Z critical value)
  - Student’s t-distribution
- Explanation of why t-distribution is more conservative

### 4) Hypothesis Testing for Means
- Z-test (σ assumed known)
- Two-sided p-value calculation
- t-test using `t.test()`

### 5) Real Dataset Analysis
- Dataset: `weight1.csv`
- One-sample t-test for population mean
- Confidence intervals for height
- Subgroup analysis:
  - Female height analysis
  - Male height proportion tests

### 6) Proportion Hypothesis Testing (Real Data)
- Testing whether 25% of males are taller than 180 cm
- Large-sample normal approximation
- Confidence interval for the proportion of males taller than 180 cm

## How to Run

### Requirements
- R (version 4.x or newer)
- Base R only (no external packages)

### Run the script
```bash
Rscript lab_confidence_tests.R
```