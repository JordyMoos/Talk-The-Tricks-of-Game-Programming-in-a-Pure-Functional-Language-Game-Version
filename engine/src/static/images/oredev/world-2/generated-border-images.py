import os
from PIL import Image

#  Max dimension exclusive the border
max_width = 1168
max_height = 672


def create_image(input_file_path, destination_file_path):
    temp_input = "./border/temp/input.png"

    # Resize the image
    os.system("convert %s -resize %sx%s\> %s""" % (input_file_path, max_width, max_height, temp_input))

    # Get new image size
    (base_width, base_height) = Image.open(temp_input).size

    # Create the temp border images
    os.system("convert -size %sx%s tile:./border/top.png ./border/temp/top-long.png" %       (base_width + 32, 32))
    os.system("convert -size %sx%s tile:./border/bottom.png ./border/temp/bottom-long.png" % (base_width + 32, 32))
    os.system("convert -size %sx%s tile:./border/left.png ./border/temp/left-long.png" %     (32             , base_height + 32))
    os.system("convert -size %sx%s tile:./border/right.png ./border/temp/right-long.png" %   (32             , base_height + 32))

    # Create the frame
    merge_command = """convert -background None \
        \( %s -set page +32+32 \) \
        \( ./border/temp/top-long.png -set page +16+0 \) \
        \( ./border/temp/bottom-long.png -set page +16+%s \) \
        \( ./border/temp/left-long.png -set page +0+16 \) \
        \( ./border/temp/right-long.png -set page +%s+16 \) \
        \( ./border/top-left.png -set page +0+0 \) \
        \( ./border/top-right.png -set page +%s+0 \) \
        \( ./border/bottom-left.png -set page +0+%s \) \
        \( ./border/bottom-right.png -set page +%s+%s \) \
        -layers merge %s
    """ % (temp_input
        , base_height + 32, base_width + 32
        , base_width + 32 + 16 , base_height + 32 + 16
        , base_width + 32 + 16, base_height + 32 + 16
        , destination_file_path)

    os.system(merge_command)


counter = 0

files = [f for f in os.listdir('./') if os.path.isfile(f) and (".png" in f or ".jpg" in f) and ("border" not in f)]
for f in files:
    input_file_path = f
    destination_file_path = input_file_path.replace(".png", "-border.png", 1).replace(".jpg", "-border.jpg", 1)
    if not os.path.exists(destination_file_path):
        counter = counter + 1
        create_image(input_file_path, destination_file_path)


print("\n\n")
print("Created %s images" % counter)
