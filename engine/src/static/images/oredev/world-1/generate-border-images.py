import os



def create_command(input_file_path, destination_file_path):

    command = """convert \
         \( %s -resize 1168x672 -bordercolor none -gravity center -border 40x40 \) \
         \( -clone 0 -tile ../dirt.png -draw "color 0,0 reset" \) \
         +swap -compose over -composite %s""" % (input_file_path, destination_file_path)
    return command


counter = 0

files = [f for f in os.listdir('./') if os.path.isfile(f) and (".png" in f or ".jpg" in f) and ("border" not in f)]
for f in files:
    input_file_path = f
    destination_file_path = input_file_path.replace(".png", "-border.png", 1).replace(".jpg", "-border.jpg", 1)
    if not os.path.exists(destination_file_path):
        counter = counter + 1
        os.system(create_command(input_file_path, destination_file_path))


print("\n\n")
print("Created %s images" % counter)
