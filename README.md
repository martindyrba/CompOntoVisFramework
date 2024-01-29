# CompOntoVisFramework
A computational ontology and visualization framework for the visual comparison of brain atrophy profiles

![Python](https://img.shields.io/badge/Python-v3.7-green)
![OWL](https://img.shields.io/badge/OWL-v2-orange)
![Protégé](https://img.shields.io/badge/Protégé-v5.6.1-red)
![Plotly](https://img.shields.io/badge/Plotly-v2.24.1-blue)

The most common cause of dementia is Alzheimer’s disease (AD), which leads to regional volumetric changes in the brain. Specifically there is gray matter volume reduction (atrophy) in the medial temporal lobe including hippocampus. 
The volumetric loss and cortical thinning are structural pathologies visible in T1-weighted MRI scans, which can be observed already in the early stages of AD.

Easy visual exploration of a patient's atrophy profile could support neuroradiologist by saving time and effort during visual instection of brain MRI scans. 
However, exisitng neuroanatomical ontologies and MRI volumetry reporting tools, lack a generalizable computational framework for aggregating disease patholgy at different levels of brain abstraction.

**We created a comprehensible visual disease exploration pipeline.** 
Extending current tools, we proposed a novel interpretation pipeline by **combining computational ontological methods for aggregating volumetric information, 
and visual summary reports** to enhance examination of a person's atrophy profile for the whole brain at once. 
Our study also aimed to utilise resulting summary reports for highlighting both group characteristics of disease stages as well as single-subject data.

## Ontology
Inspired by the Foundational Model of Anatomy (FMA), we developed a web ontology language (OWL)-based ontology, 
which captures relationships among neuroanatomical regions, using the Protégé modeling software. The ontology includes all ROIs segmented by the FastSurferCNN software.

The following image illusrates the resulting OWL/Protégé ontology:
<p align="center">
  <img src="/Images/0000-Fig1-b.png" width="348">
</p>
<![OWL/Protégé ontology](/Images/0000-Fig1-b.png)>

## Summary Plots
Using the Plotly library and owlready2 Pyhon package, we developed an interactive visualization framework to derive volume deviation summary plots. 
We use a custom colour scale, where lower levels of deviations were represented by shades of yellow. 
Higher levels of volumetric deviations were represented in orange and red. 
The summary plot was designed to be symetric across the vertical axis, this reflects the symmetrical brain structure of the left and right hemisphere.

A sample summary plot for an ADNI participant with mild dementia due to Alzheimer’s disease (AD) is shown below:
<p align="center">
  <img src="/Images/0000-Fig3-a.png" width="548">
</p>
<![Summary Plot](/Images/0000-Fig3-a.png)>

[Click: Interactive Summary Plot for ADNI Sample](https://htmlpreview.github.io/?https://github.com/martindyrba/CompOntoVisFramework/blob/master/Results/6650_ADNI3_mean_w_Sunburst_ryg.html)

## Citation
```bibtex
@misc{Singh2024Onto,
    author = {Singh, Devesh and Dyrba, Martin and others},
    title = {A computational ontology and visualization framework for the visual comparison of brain atrophy profiles},
    year = {2024},
}
```
