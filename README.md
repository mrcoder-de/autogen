# AutoGen, AutoGen Studio + MLX + Llama3

## MLX

If you're on Mac, you can run small LLMs fast and efficiently with MLX: https://pypi.org/project/mlx-lm/

Run a simple command like this:
```
python3 -m mlx_lm.generate \
    --max-tokens 10000 \
    --model mlx-community/Meta-Llama-3-8B-Instruct-4bit \
    --prompt "what's the capital of London?"
```

### mlx.server

You can serve an LLM with the OpenAI API easily using `mlx.serve`, like this:

```
python3 -m mlx_lm.server \
    --model mlx-community/Meta-Llama-3-8B-Instruct-4bit \
    --port 8090
```

## AutoGen

AutoGen is a framework for running AI Agents: https://microsoft.github.io/autogen/

NOTE: It's not a server. You can run a pre-build AutoGen application from docker that will eventually complete and stop the docker container.

Here are the instructions for running in Docker: https://microsoft.github.io/autogen/docs/installation/Docker/

## Running AutoGen Studio

AutoGen Studio is a frontend to AutoGen: https://autogen-studio.com/

You can run it from docker by building your own docker image based on the code provided by this guy: https://github.com/WaywardHayward/autogen-studio-dockerfile (I took a quick look and there doesn't appear to be anything malicious in there)

Once you've built the image, you can run it with docker compose:
```
services:
  autogen-studio:
    image: autogen-studio:latest
    volumes:
      - ./work:/home/app/work
    ports:
      - "8080:8080"
```

## Using Autogen Studio

### Our Example

Ok. So here's what we're going to try and do with AutoGen:
- we pass autogen a link to an interesting article (use this one: https://www.infoq.com/news/2024/04/ai-sdlc-adoption/)
- autogen should download the article
- convert it to markdown
- read the article
  - extract the title
  - write a very short executive summary of the article less than 100 words
  - extract the "wisdom" from the article in point form 
  - write all that to a file

Bonus points:
- write a very small blog post about the article
  - write the article as if someone from CSS was writing it
  - start off with a short pitch saying, "Dear Humans, it is I, CSS.bot! Did you know that..."
  - then write one sentence about the article.
  - then "the key takeaway is..." and the key takeaway
  - then "if you want to know more, here's the article: " with a link to the article
  - then some standard hashtags "#CSS #AI"
  - then some content specific hashtags
  - then write the whole thing to a text file

### Create a model

You'll want to use the model you have running locally. That means that AutoGen (running in a docker container) needs to be able to address your local machine. You can do this with the `host.docker.internal` hostname.

Here are the parameters you can use for your model
- model name: Llama3 8B
- base url: http://host.docker.internal/v1


# Random Notes

https://techcommunity.microsoft.com/t5/educator-developer-blog/building-ai-agent-applications-series-using-autogen-to-build/ba-p/4052280

