
#install neurodocker
#pip install --no-cache-dir https://github.com/kaczmarj/neurodocker/tarball/master --user

neurodocker generate \
	--base debian:stretch \
	--pkg-manager apt \
	--fsl version=5.0.10 \
	--dcm2niix version='latest' \
	--install wget unzip python3 python-numpy python-nibabel python-setuptools cython \
	> Dockerfile_fsl
