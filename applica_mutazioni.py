import os
import subprocess
import logging
import importlib

TF_DIR = ""
TF_FILE = os.path.join(TF_DIR, "main.tf")

def run_terraform_tests():
    process = subprocess.run(["terraform", "test", TF_DIR], capture_output=True, text=True)
    return process.stdout, process.stderr

def load_tf_file():
    with open(TF_FILE, "r") as file:
        return file.readlines()

def save_tf_file(content):
    with open(TF_FILE, "w") as file:
        file.writelines(content)

def restore_original_tf_file():
    with open(f"{TF_FILE}.backup", "r") as original_file:
        original_content = original_file.readlines()
    save_tf_file(original_content)

# Funzione principale per caricare mutazioni dinamicamente
def apply_mutations_and_test():
    # Importa dinamicamente tutte le funzioni dal file mutation.py
    mutation_module = importlib.import_module("mutation")
    mutation_functions = [
        (getattr(mutation_module, func), func)
        for func in dir(mutation_module)
        if callable(getattr(mutation_module, func)) and func.startswith("mutate_")
    ]

    for mutate_func, func_name in mutation_functions:
        logging.info("Inizio esecuzione mutazione: %s", func_name)
        mutate_func()
        stdout, stderr = run_terraform_tests()
        logging.info("Output test:\n%s", stdout)
        if stderr:
            logging.error("Errori test:\n%s", stderr)
        restore_original_tf_file()

# Backup del file Terraform originale
if not os.path.exists(f"{TF_FILE}.backup"):
    with open(TF_FILE, "r") as file:
        with open(f"{TF_FILE}.backup", "w") as backup_file:
            backup_file.writelines(file.readlines())

if __name__ == "__main__":
    logging.basicConfig(filename='terraform.log', level=logging.DEBUG, 
                        format='%(asctime)s - %(levelname)s - %(message)s')
    apply_mutations_and_test()
