from os import walk

dir_path = r'C:\\apps\\Lombard\\'
all_lines = 0

def test_func() -> bool:
    print("chuj")

for (dir_path, dir_names, file_names) in walk(dir_path):
    for file in file_names:
        if file.endswith(".gd"):
            all_lines += sum(1 for line in open(dir_path + "\\" + file))

test_func()

print("linijki: " + str(all_lines))