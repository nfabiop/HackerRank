

def wrap(string, max_width):
    wrapper = textwrap.TextWrapper(width=max_width)
    word_list = wrapper.fill(text=string)
    #for i in string:
    #    print(word_list)
    return word_list

