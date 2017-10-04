# Singularity-tgv-qsm

This singularity image bundles the tgv-qsm algorithm (http://www.neuroimaging.at/pages/qsm.php) with fsl (https://www.fmrib.ox.ac.uk/fsl) and dcm2niix (https://github.com/rordenlab/dcm2niix) and all necessary dependencies. This image provides a complete QSM processing pipeline starting from converting dicom images to nii, creating the brain mask using bet, rescaling phase data, running tgv on this data and checking the outputs.

If you use this image, this is the reference describing the QSM algorithm:
Langkammer, C; Bredies, K; Poser, BA; Barth, M; Reishofer, G; Fan, AP; Bilgic, B; Fazekas, F; Mainero; C; Ropele, S
Fast Quantitative Susceptibility Mapping using 3D EPI and Total Generalized Variation.
Neuroimage. 2015 May 1;111:622-30. doi: 10.1016/j.neuroimage.2015.02.041. PubMed 

# Using the image
```
singularity shell shub://2712
```

this will download the image, unpack it and then start a shell in the image mounting the folder where you executed the command from:

```
Progress |===================================| 100.0%
Singularity: Invoking an interactive shell within container...

Singularity Singularity CAIsr-singularity-tgv-qsm-v1.0_20170902.img:/test/test-tgv>
```

you can also bind a different directory to your image (e.g. bind /data from your host to /data in your singularity image)
```
singularity shell --bind /data:/data/ CAIsr-singularity-tgv-qsm-v1.0_20170902.img
```

or you can just run a single application from the image:
```
singularity exec CAIsr-singularity-tgv-qsm-v1.0_20170902.img bet2
```

Here is an example for a full pipeline:
```
singularity exec CAIsr-singularity-tgv-qsm-v1.0_20170902.img dcm2niix -o ./ -f magnitude GR_M_5_QSM_p2_1mmIso_TE20/

singularity exec CAIsr-singularity-tgv-qsm-v1.0_20170902.img dcm2niix -o ./ -f phase GR_P_6_QSM_p2_1mmIso_TE20/

singularity exec CAIsr-singularity-tgv-qsm-v1.0_20170902.img bet2 magnitude.nii magnitude_bet2

singularity exec CAIsr-singularity-tgv-qsm-v1.0_20170902.img tgv_qsm -p phase.nii -m magnitude_bet2_mask.nii.gz -f 2.89 -t 0.02 -s -o qsm
```
