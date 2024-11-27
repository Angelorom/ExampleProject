import re
from applica_mutazioni import load_tf_file, save_tf_file

# Mutazione 1: Rimuovi crittografia dal bucket S3
def mutate_remove_s3_encryption():
    print("Mutazione: Rimozione crittografia S3")
    content = load_tf_file()
    mutated_content = [re.sub(r'encryption = "AES256"', 'encryption = "NONE"', line) for line in content]
    save_tf_file(mutated_content)

# Mutazione 2: Rendi pubblico l'accesso al bucket S3
def mutate_make_s3_public():
    print("Mutazione: Accesso pubblico al bucket S3")
    content = load_tf_file()
    mutated_content = [re.sub(r'block_public_acls = true', 'block_public_acls = false', line) for line in content]
    mutated_content = [re.sub(r'ignore_public_acls = true', 'ignore_public_acls = false', line) for line in mutated_content]
    save_tf_file(mutated_content)

# Mutazione 3: Modifica il timeout della funzione Lambda
def mutate_lambda_timeout():
    print("Mutazione: Timeout della funzione Lambda")
    content = load_tf_file()
    mutated_content = [re.sub(r'timeout = "120"', 'timeout = "5"', line) for line in content]
    save_tf_file(mutated_content)

# Mutazione 4: Cambia policy IAM per la funzione Lambda (permissiva)
def mutate_lambda_iam_policy():
    print("Mutazione: Policy IAM troppo permissiva")
    content = load_tf_file()
    mutated_content = [re.sub(r'policy = "restricted_policy"', 'policy = "admin_policy"', line) for line in content]
    save_tf_file(mutated_content)

# Mutazione 5: Rimuovi la creazione della tabella DynamoDB
def mutate_remove_dynamodb_table():
    print("Mutazione: Rimozione della tabella DynamoDB")
    content = load_tf_file()
    mutated_content = []
    for line in content:
        if "resource \"aws_dynamodb_table\"" not in line:
            mutated_content.append(line)
    save_tf_file(mutated_content)

# Mutazione 6: Modifica della regione AWS
def mutate_change_region():
    print("Mutazione: Modifica della regione AWS")
    content = load_tf_file()
    mutated_content = [re.sub(r'region     = "eu-central-1"', 'region     = "us-west-1"', line) for line in content]
    save_tf_file(mutated_content)

# Mutazione 7: Disabilita i log per la funzione Lambda
def mutate_disable_lambda_logs():
    print("Mutazione: Disabilita i log della funzione Lambda")
    content = load_tf_file()
    mutated_content = [line for line in content if "aws_cloudwatch_log_group" not in line]
    save_tf_file(mutated_content)

# Mutazione 8: Modifica il nome del bucket S3
def mutate_change_s3_bucket_name():
    print("Mutazione: Modifica del nome del bucket S3")
    content = load_tf_file()
    mutated_content = [re.sub(r'name = "my-s3-bucket"', 'name = "mutated-s3-bucket"', line) for line in content]
    save_tf_file(mutated_content)

# Mutazione 9: Imposta retention minima per DynamoDB
def mutate_min_dynamodb_retention():
    print("Mutazione: Retention minima per DynamoDB")
    content = load_tf_file()
    mutated_content = [re.sub(r'retention_in_days = 30', 'retention_in_days = 1', line) for line in content]
    save_tf_file(mutated_content)

# Mutazione 10: Disabilita il trigger della funzione Lambda
def mutate_remove_lambda_trigger():
    print("Mutazione: Rimozione del trigger della funzione Lambda")
    content = load_tf_file()
    mutated_content = [line for line in content if "trigger" not in line]
    save_tf_file(mutated_content)