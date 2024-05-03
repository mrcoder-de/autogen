#!/bin/bash

# MODEL=mlx-community/Meta-Llama-3-70B-Instruct-4bit
# MODEL=mlx-community/Meta-Llama-3-8B-Instruct-4bit
# MODEL=mlx-community/Phi-3-mini-4k-instruct-8bit
MODEL=mlx-community/Phi-3-mini-128k-instruct-4bit
# PROMPT="write the game snake in python"
PROMPT="if we lay 5 shirts out in the sun and it takes 4 hours to dry, how long would it take 20 shirts to dry? Explain your reasoning step by step"
# PROMPT="25 - 4 * 2 + 3 = ?"
# PROMPT="what is the capital of london?"

# python3 -m mlx_lm.generate --model mistralai/Mistral-7B-Instruct-v0.1 --prompt "hello"
python3 -m mlx_lm.generate \
    --max-tokens 1000 \
    --model $MODEL \
    --prompt "$PROMPT"