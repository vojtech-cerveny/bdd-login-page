import os
from diffimg import diff


def compare_images(name):
    baseline = "./baseline/" + name + ".png"
    actual = "./temp/" + name + ".png"
    return round(diff(baseline, actual), 2)


def remove_images():
    folder = './temp'
    for the_file in os.listdir(folder):
        if the_file.endswith(".png"):
            file_path = os.path.join(folder, the_file)
            try:
                if os.path.isfile(file_path):
                    os.unlink(file_path)
            except Exception as e:
                print(e)
