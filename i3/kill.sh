#!/bin/bash

win_id=$(xdotool getwindowfocus)
xdotool windowkill "$win_id"
