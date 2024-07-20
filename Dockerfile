FROM python:3.10.4-slim-buster
RUN apt update && apt upgrade -y
RUN apt-get -y install git
RUN apt-get install -y wget python3-pip curl bash neofetch ffmpeg software-properties-common
COPY requirements.txt .
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
COPY . .
RUN pip3 install wheel
RUN pip3 install --no-cache-dir -U -r requirements.txt
COPY start /start
CMD ["/bin/bash", "/start"]
# Pypi package Repo upgrade
RUN pip3 install --upgrade pip setuptools
pip install --upgrade pip setuptools


# Copy Python Requirements to /root/SaitamaRobot
RUN git clone -b shiken https://github.com/AnimeKaizoku/SaitamaRobot /root/SaitamaRobot
WORKDIR /root/SaitamaRobot

#Copy config file to /root/SaitamaRobot/SaitamaRobot
COPY ./SaitamaRobot/sample_config.py ./SaitamaRobot/config.py* /root/SaitamaRobot/SaitamaRobot/

ENV PATH="/home/bot/bin:$PATH"

python -m venv myenv
source myenv/bin/activate  # On Windows use: myenv\Scripts\activate


# Starting Worker
CMD ["python3","-m","SaitamaRobot"]
