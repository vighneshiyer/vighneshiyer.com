#!/usr/bin/env bash

zola build
rsync -rvP --progress --stats public buyvm:/var/www/vighneshiyer
