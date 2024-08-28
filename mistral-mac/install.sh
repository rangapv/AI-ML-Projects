#!/usr/bin/env bash
#author: rangapv@yahoo.com
#Program to install Mistral 7B model on a mac

i1="pip3"
i2="python3"

echo "Installing requiremnts.."
m1=`$i1 install -r ./requirements.txt`
m1s="$?"
echo "m1s is $m1s"
if (( $m1s == 0 ))
then
echo "Downloading the mistral model mistral-7B-v0.1.tar"
m2=`curl -O https://models.mistralcdn.com/mistral-7b-v0-1/mistral-7B-v0.1.tar`
m2s="$?"
if (( $m2s == 0 ))
then
echo "Unpacking the mistral tar ball..."
m3=`tar -xf mistral-7B-v0.1.tar`
m3s="$?"
if (( $m3s == 0 ))
then
echo "Converting the weights.."
m4=`$i2 convert.py`
m4s="$?"
if (( $m4s == 0 ))
then
echo "To run the model ....."
echo "$i2 mistral.py --prompt \"It is a truth universally acknowledged,\""
fi
fi
fi
fi
