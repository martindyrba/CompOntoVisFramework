# CompOntoVisFramework
A computational ontology and visualization framework for the visual comparison of brain atrophy profiles

![python](https://img.shields.io/badge/python-v3.7-green)
![OWL](https://img.shields.io/badge/OWL-v2-orange)
![Protégé](https://img.shields.io/badge/Protégé-v5.6.1-red)
![Plotly](https://img.shields.io/badge/Plotly-v2.24.1-blue)

The most common cause of dementia is Alzheimer’s disease (AD), which accounts for more than two-thirds of all dementia cases. 
The progression of AD leads to regional volumetric changes in the brain, specifically there is grey matter volume reduction (atrophy) in the medial temporal lobe. 
The volumetric loss and cortical thinning are structural pathologies visible in T1-weighted MRI scans, which can be observed already in the early stages of AD.

Easy exploration of patient's atrophy profile could save neroradiologist a lot of time and effort. 
However, both exisitng neuroanatomical ontologies and MRI volumetry reporting tools, lack a computational framework for aggregating disease patholgy at different levels of brain abstraction.

The goal of our study was to create a comprehensible disease exploration pipeline. 
Extending the current tools, we propose a novel interpretation pipeline by combining computational ontological methods for aggregating pathological information, 
and visual summary reports to enhance disease comprehensibility across the whole brain at once. 
Our study also aimed to utilise resulting summary reports for highlighting both group characteristics of disease stages as well as single-subject atrophy profiles.

## Ontology
Aligning with the Foundational Model of Anatomy (FMA) framework, we developed a Web ontology language (OWL) based ontology, 
which captures membership relationships among neuroanatomical regions, using the Protégé modeling software.

Following image illusrates the OWL/Protégé ontology that was built.
<p align="center">
  <img src="/Images/0000-Fig1-b.png" width="348">
</p>
<![OWL/Protégé ontology](/Images/0000-Fig1-b.png)>

## Summary Plots
Using Plotly, we created a summary visualzation tool. 
We use a custom colour scale, where lower levels of deviations were represented by shades of yellow. 
While the higher levels of volumetric deviations were represented in orange and red. 
The summar plot was created to be symetric across the vertical axis, this reflects the symertical brain strcture across the coronal and axial planes. 

Sample summary plot for an ADNI patitent with Alzheimer’s disease (AD).
<p align="center">
  <img src="/Images/0000-Fig3-a.png" width="548">
</p>
<![Summary Plot](/Images/0000-Fig3-a.png)>
