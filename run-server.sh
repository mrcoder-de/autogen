#!/bin/bash

# MODEL=mlx-community/Meta-Llama-3-70B-Instruct-4bit
MODEL=mlx-community/Meta-Llama-3-8B-Instruct-4bit
PORT=8090

python3 -m mlx_lm.server --model $MODEL --port $PORT
