# Remote Access to IPython Notebooks via SSH
#
# https://coderwall.com/p/ohk6cg/remote-access-to-ipython-notebooks-via-ssh
# 
# on the DL box
jupyter notebook --no-browser --port 8889

# start an ssh tunnel on the local machine 
ssh -N -f -L localhost:8890:localhost:8889 m@192.168.0.103

# To close the SSH tunnel on the local machine
# look for the process and kill it manually
ps aux | grep localhost:8890
# kill -15 15740


