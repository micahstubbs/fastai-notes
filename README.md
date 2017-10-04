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

now following the [lesson1 homework guide](http://wiki.fast.ai/index.php/Lesson_1)

```
# install kaggle cli
pip install kaggle-cli

# download data for Dogs vs. Cats Redux competition
# set a global kg config with username, password, competition
kg config -g -u yourusername -p yourpassword -c dogs-vs-cats-redux-kernels-edition
# $ kg download
kg download 

```

configure the new data to the file structure in the same way that was used in the sample lesson 1 notebook

└── dogscats
    ├── models
    ├── sample
    │   ├── train
    │   │   ├── cats
    │   │   └── dogs
    │   └── valid
    │       ├── cats
    │       └── dogs
    ├── test1
    ├── train
    │   ├── cats
    │   └── dogs
    └── valid
        ├── cats
        └── dogs


first, let's split the train date further into 75% `train` and 25% `valid`

```
cd kaggle/dogs-vs-cats-redux-kernels-edition
mv data/train data/train1
mkdir data/train
mkdir data/valid
python split-train-valid.py
```

now let's make the subfolders by class that the lesson 1 notebook expects. 
first for the training set:

```
cd kaggle/dogs-vs-cats-redux-kernels-edition/data/train
mkdir dogs
mv dog.* dogs/
mkdir cats
mv cat.* cats/
```

and once more for the validation set:


```
cd kaggle/dogs-vs-cats-redux-kernels-edition/data/valid
mkdir dogs
mv dog.* dogs/
mkdir cats
mv cat.* cats/
```