# Enter your code here. Read input from STDIN. Print output to STDOUT
import math

AB = int(input())
BC = int(input())

MBC = round(180 * math.atan(AB/BC) / 3.1415)


print(str(MBC) + '\u00B0')
