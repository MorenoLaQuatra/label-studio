**Step 0:**
Clone this repo!

**Step 1:**
sudo DOCKER_BUILDKIT=1 docker build -t lst_startup .

**Step 2:**
sudo docker run -it -p DESIRED_PORT:8080 -v \`pwd\`/label-studio-data:/label-studio/data lst_startup

**Step 3:**
Signup with the main account and stop docker

**Step 4:**
sudo DOCKER_BUILDKIT=1 docker build -t lst_running -f Dockerfile_running .

**Step 5:**
sudo docker run -it -p DESIRED_PORT:8080 -v \`pwd\`/label-studio-data:/label-studio/data lst_running

**Step 6:** 
Login and generate signup link with access tokens and provide it to new users to signup.


**Where to find data?**
Data and annotations are stored in `pwd`/label-studio-data -> change it in launching command if you need!


