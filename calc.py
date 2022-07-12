from os import walk

dir_path = r'C:\\apps\\Lombard\\'
all_lines = 0

for (dir_path, dir_names, file_names) in walk(dir_path):
    for file in file_names:
        if file.endswith(".gd"):
            all_lines += sum(1 for line in open(dir_path + "\\" + file))

print("lines of code: " + str(all_lines))