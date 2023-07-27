# from transformers import AutoModelForCausalLM, pipeline, AutoTokenizer
# import torch
# import time

# model = AutoModelForCausalLM.from_pretrained(
#     "databricks/dolly-v2-3b",
#     device_map="auto",
#     torch_dtype=torch.float16,
#     load_in_8bit=True)

# tokenizer = AutoTokenizer.from_pretrained("databricks/dolly-v2-3b")

# def prompt(s):
#     input_ids = tokenizer(s, return_tensors="pt").input_ids.to('cuda')
#     start = time.time()
#     gen_tokens = model.generate(
#       input_ids,
#       do_sample=True,
#       temperature=0.9,
#       max_length=100
#     )

#     gen_text = tokenizer.batch_decode(gen_tokens)[0]
#     end = time.time()
#     print("time to generate: ", end - start)
#     return gen_text

# # Change this prompt to be anything that you want.
# print(prompt("My name is Afolabi Omotoso?"))

from transformers import AutoModelForCausalLM, AutoTokenizer

## 3B Model (about 5GB)
tokenizer = AutoTokenizer.from_pretrained("databricks/dolly-v2-3b", padding_side="left")
model = AutoModelForCausalLM.from_pretrained("databricks/dolly-v2-3b", device_map="auto")

## Save Tokenizer and Model
tokenizer.save_pretrained('/home/site/wwwroot/dolly/tokenizer')
model.save_pretrained('/home/site/wwwroot/dolly/model')
