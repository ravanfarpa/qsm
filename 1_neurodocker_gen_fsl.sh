
#install neurodocker
#pip install --no-cache-dir https://github.com/kaczmarj/neurodocker/tarball/master --user

neurodocker generate \
	--base neurodebian:stretch-non-free \
	--pkg-manager apt \
	--install fsl dcm2niix \
	> Dockerfile_fsl
