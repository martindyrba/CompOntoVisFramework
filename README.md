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

Further details could be found in our publication:

Singh D, Grazia A, Reiz A, et al. A computational ontology framework for the synthesis of multi-level pathology reports from brain MRI scans. Journal of Alzheimer’s Disease. 2025;0(0). doi: [10.1177/13872877251331222](https://doi.org/10.1177/13872877251331222)



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
  <img src="/Results/6650_ADNI3_mean_w_Sunburst_rgy.png" width="548">
</p>
<![Summary Plot](/Images/0000-Fig3-a.png)>

[Click: Interactive Summary Plot for ADNI Sample](https://htmlpreview.github.io/?https://github.com/martindyrba/CompOntoVisFramework/blob/master/Results/6650_ADNI3_mean_w_Sunburst_ryg.html)

## Citation
```bibtex
@article{doi:10.1177/13872877251331222,
author = {Devesh Singh and Alice Grazia and Achim Reiz and Andreas Hermann and Slawek Altenstein and Lukas Beichert and Alexander Bernhardt and Katharina Buerger and Michaela Butryn and Peter Dechent and Emrah Duezel and Michael Ewers and Klaus Fliessbach and Silka D Freiesleben and Wenzel Glanz and Stefan Hetzer and Daniel Janowitz and Ingo Kilimann and Okka Kimmich and Christoph Laske and Johannes Levin and Andrea Lohse and Falk Luesebrink and Matthias Munk and Robert Perneczky and Oliver Peters and Lukas Preis and Josef Priller and Johannes Prudlo and Boris S Rauchmann and Ayda Rostamzadeh and Nina Roy-Kluth and Klaus Scheffler and Anja Schneider and Luisa S Schneider and Björn H Schott and Annika Spottke and Eike J Spruth and Matthis Synofzik and Jens Wiltfang and Frank Jessen and Stefan J Teipel and Martin Dyrba},
title ={A computational ontology framework for the synthesis of multi-level pathology reports from brain MRI scans},
journal = {Journal of Alzheimer’s Disease},
volume = {0},
number = {0},
pages = {13872877251331222},
year = {0},
doi = {10.1177/13872877251331222},
note ={PMID: 40255031},
URL = { https://doi.org/10.1177/13872877251331222},
eprint = { https://doi.org/10.1177/13872877251331222},
abstract = { Background Convolutional neural network (CNN) based volumetry of MRI data can help differentiate Alzheimer's disease (AD) and the behavioral variant of frontotemporal dementia (bvFTD) as causes of cognitive decline and dementia. However, existing CNN-based MRI volumetry tools lack a structured hierarchical representation of brain anatomy, which would allow for aggregating regional pathological information and automated computational inference.Objective Develop a computational ontology pipeline for quantifying hierarchical pathological abnormalities and visualize summary charts for brain atrophy findings, aiding differential diagnosis.Methods Using FastSurfer, we segmented brain regions and measured volume and cortical thickness from MRI scans pooled across multiple cohorts (N = 3433; ADNI, AIBL, DELCODE, DESCRIBE, EDSD, and NIFD), including healthy controls, prodromal and clinical AD cases, and bvFTD cases. Employing the Web Ontology Language (OWL), we built a semantic model encoding hierarchical anatomical information. Additionally, we created summary visualizations based on sunburst plots for visual inspection of the information stored in the ontology.Results Our computational framework dynamically estimated and aggregated regional pathological deviations across different levels of neuroanatomy abstraction. The disease similarity index derived from the volumetric and cortical thickness deviations achieved an AUC of 0.88 for separating AD and bvFTD, which was also reflected by distinct atrophy profile visualizations.Conclusions The proposed automated pipeline facilitates visual comparison of atrophy profiles across various disease types and stages. It provides a generalizable computational framework for summarizing pathologic findings, potentially enhancing the physicians’ ability to evaluate brain pathologies robustly and interpretably. }
}
```
