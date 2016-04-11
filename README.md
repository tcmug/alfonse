
Alpine, Ansible and Docker image generation
===================

Copy your public key to ssh_key.pub, e.g.:
'''
cp ~/.ssh/id_rsa.pub ssh_key.pub
'''

Then build the container:
'''
$ docker build -t alfonse:1.0 .
'''

Start the container:
'''
$ docker run -p 2222:22 --name alfonse -d alfonse:1.0
'''

Check that the IP and port match your local configuration in
ansible/inventory/hosts.

cd under ansible and run:
'''
$ ./provision.sh
'''

Then proceed to stop the container:
'''
$ docker stop $(docker ps -q --filter="name=alfonse")
'''

Create an image of its state:
'''
docker commit -m "Test message" -a "Tester" $(docker ps -a -q --filter="name=alfonse") alfonse:1.1
'''

After that you can do whatever you want with the image alfonse:1.1.
'''
docker stop $(docker ps -q --filter="name=alfonse")
'''



