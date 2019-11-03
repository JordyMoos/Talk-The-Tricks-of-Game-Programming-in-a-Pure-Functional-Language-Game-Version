import random

width = 24

rock_change = 4
cactus_change = 15
aloe_change = 30

rock_count = 5
cactus_count = 12
aloe_count = 15

rock_output = ""
cactus_output = ""
aloe_output = ""

for _ in range(width):
    if random.randrange(1, 101) < rock_change:
        rock_output = rock_output + ("R%02d" % (random.randrange(1, rock_count + 1)))
    else:
        rock_output = rock_output + "   "

for _ in range(width):
    if random.randrange(1, 101) < cactus_change:
        cactus_output = cactus_output + ("C%02d" % (random.randrange(1, cactus_count + 1)))
    else:
        cactus_output = cactus_output + "   "

for _ in range(width):
    if random.randrange(1, 101) < aloe_change:
        aloe_output = aloe_output + ("E%02d" % (random.randrange(1, aloe_count + 1)))
    else:
        aloe_output = aloe_output + "   "

print("\n\n")
print('"%s",' % rock_output)
print('"%s",' % cactus_output)
print('"%s",' % aloe_output)
print("\n\n")
