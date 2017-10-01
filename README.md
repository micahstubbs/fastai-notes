# fastai-notes


# setup

will loosely follow the guide in this post http://www.cbrevik.com/setup-for-fast-ai-course/

with the goal of using a local Ubuntu 16.04 + GTX 1080 development environment


```shell
# create the env
conda create -n py27 python=2.7 anaconda

# activate the python env
source activate py27

# go to the course directory
cd /courses

# install dependencies into our python env
# https://gist.github.com/luiscape/19d2d73a8c7b59411a2fb73a697f5ed4
while read requirement; do conda install --yes $requirement; done < requirements.txt

# go to the directory with the notebooks
cd deeplearning1/nbs

# install depedency that ensures Jupyter Notebook context
# can use Python modules installed in the py27 Python env
conda install nb_conda

# install old version of Keras that notebooks expect
pip install git+git://github.com/fchollet/keras.git@1.2.2

# install missing dependency for lesson1
# A columnar data container that can be compressed
conda install bcolz

cd ~
mkdir .keras
cd .keras
touch keras.json
```

paste into `keras.json` this config that tells Keras to use the Theano backend:

```json
{
	"image_dim_ordering": "th",
	"backend": "theano"
}
```


