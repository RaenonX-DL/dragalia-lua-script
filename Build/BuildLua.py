from __future__ import print_function

import os, sys, re, datetime, json, traceback
import shutil


def print_error_message(message):
    print("================== ERROR ==================")
    print(message)
    print()
    traceback.print_exc()
    input("Press `Enter` to exit.")
    sys.exit(1)


# Version Check
if int(sys.version[0]) < 3:
    print_error_message("The python version should be 3.")

current_path = os.path.dirname(os.path.realpath(__file__))
config_path = os.path.abspath(os.path.join(current_path, "BuildLua.json"))

if not os.path.isfile(config_path):
    with open(config_path, "w+") as cfg:
        cfg.write("""{
          "PhoneModel": "Galaxy S9+",
          "Script": "DLRaid"
        }""")

with open(config_path) as f:
    config_json = json.load(f)

phone_model = config_json.get("PhoneModel")
print(f"Phone Model: {phone_model or '(Unknown)'}")
print()

script = config_json.get("Script")
print(f"Script to Build: {script or '(Unknown)'}")
print()

dir_specific = os.path.abspath(os.path.join(current_path, f"../Specific/{phone_model}"))
dir_general = os.path.abspath(os.path.join(current_path, "../General"))

print(f"Directory for specific files: {dir_specific}")
print(f"Directory for general files: {dir_general}")
print()

dir_output_parent = os.path.abspath(os.path.join(current_path, "BuildLua-output"))
dir_output = os.path.abspath(os.path.join(dir_output_parent, script))

print(f"Directory for output: {dir_output}")
print()

script_src_common = os.path.abspath(os.path.join(dir_general, "Common"))
script_src_general = os.path.abspath(os.path.join(dir_general, script))
script_src_specific = os.path.abspath(os.path.join(dir_specific, script))
script_dest = os.path.abspath(os.path.join(dir_output, f"{script}.lua"))

print(f"Source Directory for scripts: {script_src_general}")
print(f"Destination Path for scripts: {script_dest}")
print()

image_dir = "image"
image_src = os.path.abspath(os.path.join(os.path.join(dir_specific, script), image_dir))
image_dest = os.path.abspath(os.path.join(dir_output, image_dir))

print(f"Source Directory for images: {image_src}")
print(f"Destination Directory for images: {image_dest}")
print()

file_config_path = os.path.abspath(os.path.join(current_path, "BuildLua-files.json"))
script_files = []

loaded_files = []


def check_configs():
    if not phone_model:
        print(f"Specify value for field `PhoneModel` in {config_json}.")

    if not script:
        print(f"Specify value for field `Script` in {config_json}.")


def build_script_file_catalog():
    global script_files

    if os.path.isfile(file_config_path):
        with open(file_config_path) as file_config:
            file_list = json.load(file_config).get(script)

            if file_list:
                for path_data in file_list:
                    path_type = path_data["Type"]
                    path_path = path_data["Path"]

                    if path_type == "General":
                        script_files.append(os.path.abspath(os.path.join(script_src_general, path_path)))
                    elif path_type == "Specific":
                        script_files.append(os.path.abspath(os.path.join(script_src_specific, path_path)))
                    elif path_type == "CommonGeneral":
                        script_files.append(os.path.abspath(os.path.join(script_src_common, path_path)))
                    else:
                        print_error_message(
                            f"Unhandled path data type `{path_type}` on Script: {script} at Path: {path_path}")
    else:
        print_error_message("No script file catalog found.")


def clear_output_dir():
    shutil.rmtree(dir_output, ignore_errors=True)


def check_script_path():
    if not os.path.isdir(dir_specific):
        print_error_message(f"Create folder at `{dir_specific}` and named `{phone_model}` first.")

    if not os.path.isdir(dir_output_parent):
        os.mkdir(dir_output_parent)

    if not os.path.isdir(dir_output):
        os.mkdir(dir_output)


def check_script_files():
    for scf in script_files:
        if not os.path.exists(scf):
            print_error_message(f"File: {scf} should exists but not found.")


def copy_images():
    shutil.copytree(image_src, image_dest)


def write_header():
    print_info_message("Writing Headers...")

    script_out.write(f"-- Built on {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
    script_out.write(f"-- Built for {phone_model}\n\n\n")


def write_script(script_file_path, module_name=None):
    if script_file_path not in loaded_files:
        loaded_files.append(script_file_path)

        with open(script_file_path, encoding="utf-8") as script_file:
            f_name = os.path.splitext(os.path.basename(script_file.name))[0]

            if not module_name:
                module_name = f_name

            module_path_str = script_file_path.split("dragalia-lua-script", 1)[1]

            print(f"Processing Module - {module_name} at {module_path_str}")
            # script_out.write(f"\n-- Module: {module_name} @ {module_path_str}\n")

            # Remap module
            if "+" in module_name:
                module_name = module_name.split("+")[0]
            if module_name == "DefaultConfigs":
                module_name = "Configs"

            for line in script_file:
                line_strip = line.strip()

                if "local m = {}" in line:
                    script_out.write(f"local {module_name} = {{}}\n")
                elif line.startswith("-- Inherit"):
                    try:
                        _, _, target, path = line_strip.split(" ", 4)
                    except ValueError:
                        print_error_message(f"Error on unpacking values of the line [{line_strip}] at [{script_file_path}].")

                    if target == "General":
                        write_script(os.path.abspath(os.path.join(dir_general, path)))
                    elif target == "Specific":
                        write_script(os.path.abspath(os.path.join(dir_specific, path)))
                    else:
                        print_error_message(f"Unknown Inherit Target - {target}.")
                else:
                    # Replace `m.`
                    if "m." in line_strip:
                        line = re.sub(r"(^|\s)(m)\.(\w+)", rf"\1{module_name}.\3", line)

                    # Replace Comments
                    if "--" in line_strip:
                        line = re.sub(r"(\w*)--.+", r"\1", line)

                    if len(line.strip()) > 0:
                        script_out.write(line)
                        if not line.endswith("\n"):
                            script_out.write("\n")


def print_info_message(message):
    print(f"{message}")


if __name__ == '__main__':
    try:
        check_configs()
        build_script_file_catalog()

        clear_output_dir()

        check_script_path()
        check_script_files()

        with open(script_dest, "w", encoding="utf-8") as script_out:
            write_header()

            for sf in script_files:
                write_script(os.path.join(script_src_general, sf))

        copy_images()
        print()
        input("Press `Enter` to exit.")
    except Exception as e:
        print_error_message(f"{str(e)}")
