#!/bin/bash
nvidia-settings -a "[gpu:0]/GPUFanControlState=1"
nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=40"

nvidia-settings -a "[gpu:1]/GPUFanControlState=1"
nvidia-settings -a "[fan:1]/GPUTargetFanSpeed=40"
