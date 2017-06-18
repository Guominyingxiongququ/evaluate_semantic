# evaluate_semantic

This repository is an evaluation tool for semantic segmentation
eval.m is a script which could calculate the average IOU of different classes

The input is semantic segmentation images filtered by a certain depth range, for example, from 0.5 meter to 10 meters. The part out of this depth range is black.

The output is the average IOU rate of different classes. resize_tracking.m is a script for changing the image format and size


