<center> <h1>Multiplexed Imaging Mass Cytometry in Metastatic Melanoma Utilizing RNA and Protein Co-Detection Links Features of Response to Immunotherapy </h1> </center>
Tobias Hoch <sup>1,2,3,5</sup>, Daniel Schulz<sup>1,2,5,* </sup>, Nils Eling<sup>1,2</sup>, Julia Martínez Gómez<sup>4</sup>, Mitch Levesque<sup>4</sup>, Bernd  Bodenmiller<sup>1,2,* </sup>

1 University of Zurich, Department of Quantitative Biomedicine, Zurich, 8057, Switzerland </br>
2 ETH Zurich, Institute for Molecular Health Sciences, Zurich, 8093 Switzerland </br>
3 Particles-Biology Interactions Lab, Empa, Swiss Federal Laboratories for Materials Science and Technology, St. Gallen, 9014, Switzerland </br>
4 University Hospital Zurich, Department of Dermatology, Schlieren, 8952, Switzerland </br>
5 These authors contributed equally </br>
`*` Correspondence: daniel.schulz@uzh.ch bernd.bodenmiller@uzh.ch

# Abstract
Intratumoral immune cells are crucial for tumor control and anti-tumor responses during immunotherapy. Immune cell trafficking into tumors is mediated by chemokines, which are expressed and secreted upon various stimuli and interact with specific receptors. To broadly characterize chemokine expression and function in tumors, we have used multiplex mass cytometry-based imaging of protein markers and RNA transcripts to analyze the chemokine landscape and immune infiltration in metastatic melanoma samples. Tumors that lacked immune infiltration were devoid of most chemokines and exhibited particularly low levels of antigen presentation and inflammation. Infiltrated tumors were characterized by expression of multiple chemokines. <i>CXCL9</i> and <i>CXCL10</i> were often localized in patches associated with dysfunctional T cells expressing <i>CXCL13</i> which was strongly associated with B cell patches and follicles. TCF7<sup>+</sup> naïve-like T cells, which predict response to immunotherapy, were enriched in the vicinity of B cell patches and follicles. Our data highlight the strength of RNA and protein co-detection which was critical to deconvolve specialized immune microenvironments in inflamed tumors based on chemokine expression. Our findings further suggest that the formation of tertiary lymphoid structures is accompanied by naïve and naive- like T cell recruitment, which ultimately boosts anti-tumor activity.

# How-To reproduce the pipeline
<ol>
  <li>Download the source code and the data required from the analysis <a href=https://doi.org/10.5281/zenodo.5994136>here</a></li>
  <li>Install <a href=https://docs.docker.com/engine/install/ubuntu/>docker</a></li>
  <li>Pull the docker image with <code>docker pull toobiwankenobi/melanoma_imc:latest</code></a></li>
  <li>Run the docker image with <code>docker run -e PASSWORD=bioc -p 8787:8787 toobiwankenobi/melanoma_imc:latest/</code></li>
  <li>Make the source code and data accessible in order to use it in the RStudio interface</a></li>  
  <li>Open the RStudio interface (<code>http://localhost:8787/</code>, user = <code>rstudio</code>, password = <code>bioc</code>) in your web browser</li>
  <li>Run Files!</li>
</ol>

# Requirements
Certain analyses require extensive computational power (mainly memory) if processes run in parallel. If you don't have these resources, the code might need to be adapted (i.e. parallelization needs to be reduced/removed). Raise an issue in this github repo to report any problems. 

# Raw Data
Raw Data (multi-channel .tiff files, single-cell masks, etc.) is available <a href=https://doi.org/10.5281/zenodo.6004986>here</a>
