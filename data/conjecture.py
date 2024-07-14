last_val = int('1A838B13505B26867', 16)
next_val = last_val + int(last_val * 0.6)  # increasing by ~60% of the last value
print(hex(next_val))